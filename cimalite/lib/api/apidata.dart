import 'package:cimalite/core/hook/hook.dart';
import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';

abstract class Apicalls {
  Future<dio.Response<dynamic>?> login(Loginreq value);
  Future<dio.Response<dynamic>?> changePswd(ChangeReq value);
  Future<dio.Response<dynamic>?> pswrdVrfy(ChangeReq value);
  Future<dio.Response<dynamic>?> frgtpswrd(ChangeReq value);
  Future<dio.Response<dynamic>?> inspecitonList(Inspectionlistreq value);
  Future<dio.Response<dynamic>?> dwnldPdf(int? schId);
  Future<dio.Response<dynamic>?> frgtusrName(ChangeReq value);
  Future<dio.Response<dynamic>?> frgtusevrfy(ChangeReq value);
  Future<dio.Response<dynamic>?> inspNoticeList(Inspectionlistreq value);
  Future<dio.Response<dynamic>?> noticeListView(Inspectionlistreq value);
  Future<dio.Response<dynamic>?> dwnldNotice(String? val);
  Future<dio.Response<dynamic>?> societyProfile(Inspectionlistreq value);

}

class Ciadata extends Apicalls {
  final dio.Dio dioclient = dio.Dio();
  final url = Url();

  Ciadata() {
    dioclient.options = dio.BaseOptions(
      baseUrl: url.baseUrl,
      responseType: dio.ResponseType.plain,
    );
  }

  @override
  Future<dio.Response<dynamic>?> login(Loginreq value) async {
    try {
      final result = await dioclient.post(
        url.loginUrl,
        data: value.toJson(),
      );
      return result;
    } on dio.DioException catch (ex) {
      // Check for timeout or other errors
      if (ex.type == DioExceptionType.connectionTimeout) {
        // Return a custom response or throw an exception with more details
        return dio.Response(
          requestOptions: ex.requestOptions,
          statusCode: 408, // HTTP 408 Request Timeout
          statusMessage: "Connection Timeout",
        );
      }

      // Return the error response from DioException
      return dio.Response(
        requestOptions: ex.requestOptions,
        statusCode: ex.response?.statusCode ??
            500, // Default to HTTP 500 if no status code
        statusMessage: ex.message,
        data: ex.response?.data, // Include error data if available
      );
    }
  }

  @override
  Future<dio.Response?> changePswd(ChangeReq value) async {
    final sharedValue = await SharedPrefManager.instance.getSharedData();
    final token = sharedValue!.accesstoken;
    try {
      final result = await dioclient.post(url.chngPswdUrl,
          data: value.toJson(),
          options: Options(responseType: ResponseType.plain, headers: {
            "Authorization": "Bearer $token",
            "Accept": "application/json"
          }));
      return result;
    } on dio.DioException catch (ex) {
      // Check for timeout or other errors
      if (ex.type == DioExceptionType.connectionTimeout) {
        // Return a custom response or throw an exception with more details
        return dio.Response(
          requestOptions: ex.requestOptions,
          statusCode: 408, // HTTP 408 Request Timeout
          statusMessage: "Connection Timeout",
        );
      }

      // Return the error response from DioException
      return dio.Response(
        requestOptions: ex.requestOptions,
        statusCode: ex.response?.statusCode ??
            500, // Default to HTTP 500 if no status code
        statusMessage: ex.message,
        data: ex.response?.data, // Include error data if available
      );
    }
  }

  @override
  Future<dio.Response?> pswrdVrfy(ChangeReq value) async {
    try {
      final result = await dioclient.post(
        url.frgtPswdvrfyUrl,
        data: value.toJson(),
      );
      return result;
    } on dio.DioException catch (ex) {
      // Check for timeout or other errors
      if (ex.type == DioExceptionType.connectionTimeout) {
        // Return a custom response or throw an exception with more details
        return dio.Response(
          requestOptions: ex.requestOptions,
          statusCode: 408, // HTTP 408 Request Timeout
          statusMessage: "Connection Timeout",
        );
      }

      // Return the error response from DioException
      return dio.Response(
        requestOptions: ex.requestOptions,
        statusCode: ex.response?.statusCode ??
            500, // Default to HTTP 500 if no status code
        statusMessage: ex.message,
        data: ex.response?.data, // Include error data if available
      );
    }
  }

  @override
  Future<dio.Response?> frgtpswrd(ChangeReq value) async {
    try {
      final result = await dioclient.post(
        url.frgtPswdUrl,
        data: value.toJson(),
      );
      return result;
    } on dio.DioException catch (ex) {
      // Check for timeout or other errors
      if (ex.type == DioExceptionType.connectionTimeout) {
        // Return a custom response or throw an exception with more details
        return dio.Response(
          requestOptions: ex.requestOptions,
          statusCode: 408, // HTTP 408 Request Timeout
          statusMessage: "Connection Timeout",
        );
      }

      // Return the error response from DioException
      return dio.Response(
        requestOptions: ex.requestOptions,
        statusCode: ex.response?.statusCode ??
            500, // Default to HTTP 500 if no status code
        statusMessage: ex.message,
        data: ex.response?.data, // Include error data if available
      );
    }
  }

  @override
  Future<dio.Response?> inspecitonList(Inspectionlistreq value) async {
    final sharedValue = await SharedPrefManager.instance.getSharedData();
    final token = sharedValue!.accesstoken;
    try {
      final result = await dioclient.post(url.inspectionListUrl,
          data: value.toJson(),
          options: Options(responseType: ResponseType.plain, headers: {
            "Authorization": "Bearer $token",
            "Accept": "application/json"
          }));
      return result;
    } on dio.DioException catch (ex) {
      // Check for timeout or other errors
      if (ex.type == DioExceptionType.connectionTimeout) {
        // Return a custom response or throw an exception with more details
        return dio.Response(
          requestOptions: ex.requestOptions,
          statusCode: 408, // HTTP 408 Request Timeout
          statusMessage: "Connection Timeout",
        );
      }

      // Return the error response from DioException
      return dio.Response(
        requestOptions: ex.requestOptions,
        statusCode: ex.response?.statusCode ??
            500, // Default to HTTP 500 if no status code
        statusMessage: ex.message,
        data: ex.response?.data, // Include error data if available
      );
    }
  }

  @override
  Future<dio.Response?> dwnldPdf(int? schId) async {
    final sharedValue = await SharedPrefManager.instance.getSharedData();
    final token = sharedValue!.accesstoken;
    try {
      final result = await dioclient.get('${url.dwnldPdfUrl}/$schId',
          options: dio.Options(
              responseType: dio.ResponseType.bytes,
              followRedirects: false,
              receiveDataWhenStatusError: true,
              receiveTimeout: const Duration(seconds: 30),
              headers: {
                "Authorization": "Bearer $token",
                "Accept": "application/json"
              }));
      return result;
    } on dio.DioException catch (ex) {
      // Check for timeout or other errors
      if (ex.type == DioExceptionType.connectionTimeout) {
        // Return a custom response or throw an exception with more details
        return dio.Response(
          requestOptions: ex.requestOptions,
          statusCode: 408, // HTTP 408 Request Timeout
          statusMessage: "Connection Timeout",
        );
      }

      // Return the error response from DioException
      return dio.Response(
        requestOptions: ex.requestOptions,
        statusCode: ex.response?.statusCode ??
            500, // Default to HTTP 500 if no status code
        statusMessage: ex.message,
        data: ex.response?.data, // Include error data if available
      );
    }
  }

  @override
  Future<dio.Response?> frgtusrName(ChangeReq value) async {
    try {
      final result = await dioclient.post(
        url.frgtUsrUrl,
        data: value.toJson(),
      );
      return result;
    } on dio.DioException catch (ex) {
      // Check for timeout or other errors
      if (ex.type == DioExceptionType.connectionTimeout) {
        // Return a custom response or throw an exception with more details
        return dio.Response(
          requestOptions: ex.requestOptions,
          statusCode: 408, // HTTP 408 Request Timeout
          statusMessage: "Connection Timeout",
        );
      }

      // Return the error response from DioException
      return dio.Response(
        requestOptions: ex.requestOptions,
        statusCode: ex.response?.statusCode ??
            500, // Default to HTTP 500 if no status code
        statusMessage: ex.message,
        data: ex.response?.data, // Include error data if available
      );
    }
  }

  @override
  Future<dio.Response?> frgtusevrfy(ChangeReq value) async {
    try {
      final result = await dioclient.post(
        url.frgtUsrvrfyUrl,
        data: value.toJson(),
      );
      return result;
    } on dio.DioException catch (ex) {
      // Check for timeout or other errors
      if (ex.type == DioExceptionType.connectionTimeout) {
        // Return a custom response or throw an exception with more details
        return dio.Response(
          requestOptions: ex.requestOptions,
          statusCode: 408, // HTTP 408 Request Timeout
          statusMessage: "Connection Timeout",
        );
      }

      // Return the error response from DioException
      return dio.Response(
        requestOptions: ex.requestOptions,
        statusCode: ex.response?.statusCode ??
            500, // Default to HTTP 500 if no status code
        statusMessage: ex.message,
        data: ex.response?.data, // Include error data if available
      );
    }
  }

  @override
  Future<dio.Response?> inspNoticeList(Inspectionlistreq value) async {
    final sharedValue = await SharedPrefManager.instance.getSharedData();
    final token = sharedValue!.accesstoken;
    try {
      final result = await dioclient.post(url.inspNoticeListUrl,
          data: value.toJson(),
          options: Options(responseType: ResponseType.plain, headers: {
            "Authorization": "Bearer $token",
            "Accept": "application/json"
          }));
      return result;
    } on dio.DioException catch (ex) {
      // Check for timeout or other errors
      if (ex.type == DioExceptionType.connectionTimeout) {
        // Return a custom response or throw an exception with more details
        return dio.Response(
          requestOptions: ex.requestOptions,
          statusCode: 408, // HTTP 408 Request Timeout
          statusMessage: "Connection Timeout",
        );
      }

      // Return the error response from DioException
      return dio.Response(
        requestOptions: ex.requestOptions,
        statusCode: ex.response?.statusCode ??
            500, // Default to HTTP 500 if no status code
        statusMessage: ex.message,
        data: ex.response?.data, // Include error data if available
      );
    }
  }

  @override
  Future<dio.Response?> noticeListView(Inspectionlistreq value) async {
    final sharedValue = await SharedPrefManager.instance.getSharedData();
    final token = sharedValue!.accesstoken;
    try {
      final result = await dioclient.post(url.inspNoticeUrl,
          data: value.toJson(),
          options: Options(responseType: ResponseType.plain, headers: {
            "Authorization": "Bearer $token",
            "Accept": "application/json"
          }));
      return result;
    } on dio.DioException catch (ex) {
      // Check for timeout or other errors
      if (ex.type == DioExceptionType.connectionTimeout) {
        // Return a custom response or throw an exception with more details
        return dio.Response(
          requestOptions: ex.requestOptions,
          statusCode: 408, // HTTP 408 Request Timeout
          statusMessage: "Connection Timeout",
        );
      }

      // Return the error response from DioException
      return dio.Response(
        requestOptions: ex.requestOptions,
        statusCode: ex.response?.statusCode ??
            500, // Default to HTTP 500 if no status code
        statusMessage: ex.message,
        data: ex.response?.data, // Include error data if available
      );
    }
  }

  @override
  Future<dio.Response?> dwnldNotice(String? val) async {
    try {
      final result = await dioclient.get(val!,
          options: dio.Options(
              responseType: dio.ResponseType.bytes,
              followRedirects: false,
              receiveDataWhenStatusError: true,
              receiveTimeout: const Duration(seconds: 30)));
      return result;
    } on dio.DioException catch (ex) {
      // Check for timeout or other errors
      if (ex.type == DioExceptionType.connectionTimeout) {
        // Return a custom response or throw an exception with more details
        return dio.Response(
          requestOptions: ex.requestOptions,
          statusCode: 408, // HTTP 408 Request Timeout
          statusMessage: "Connection Timeout",
        );
      }

      // Return the error response from DioException
      return dio.Response(
        requestOptions: ex.requestOptions,
        statusCode: ex.response?.statusCode ??
            500, // Default to HTTP 500 if no status code
        statusMessage: ex.message,
        data: ex.response?.data, // Include error data if available
      );
    }
  }
  
  @override
  Future<dio.Response?> societyProfile(Inspectionlistreq value) async{
    final sharedValue = await SharedPrefManager.instance.getSharedData();
    final token = sharedValue!.accesstoken;
    try {
      final result = await dioclient.post(url.socProfileUrl,
          data: value.toJson(),
          options: Options(responseType: ResponseType.plain, headers: {
            "Authorization": "Bearer $token",
            "Accept": "application/json"
          }));
      return result;
    } on dio.DioException catch (ex) {
      // Check for timeout or other errors
      if (ex.type == DioExceptionType.connectionTimeout) {
        // Return a custom response or throw an exception with more details
        return dio.Response(
          requestOptions: ex.requestOptions,
          statusCode: 408, // HTTP 408 Request Timeout
          statusMessage: "Connection Timeout",
        );
      }

      // Return the error response from DioException
      return dio.Response(
        requestOptions: ex.requestOptions,
        statusCode: ex.response?.statusCode ?? 500, // Default to HTTP 500 if no status code
        statusMessage: ex.message,
        data: ex.response?.data, // Include error data if available
      );
    }
  }
}
