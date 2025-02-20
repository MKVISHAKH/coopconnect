import 'package:cimalite/core/hook/hook.dart';


class InspectionListFun {
  InspectionListFun._internal();
  static InspectionListFun instance = InspectionListFun._internal();
  InspectionListFun factory() {
    return instance;
  }

  ValueNotifier<List<Datum>> getInspectionListNotifier = ValueNotifier([]);
  ValueNotifier<List<DatumVal>> getInspectionNoticeListNotifier =
      ValueNotifier([]);
  ValueNotifier<List<DatumValue>> getnoticeNotifierNotifier = ValueNotifier([]);

  Future getinspLst(BuildContext context) async {
    try {
      final sharedValue = await SharedPrefManager.instance.getSharedData();
      String? message;

      final insplistReq = Inspectionlistreq(
        socId: sharedValue!.socId,
      );
      final scheduleLstresp = await Ciadata().inspecitonList(insplistReq);

      if (scheduleLstresp == null) {
        getInspectionListNotifier.value.clear();
        getInspectionListNotifier.value.addAll([]);
        getInspectionListNotifier.notifyListeners();
        if (!context.mounted) return;
        CommonFun.instance.showApierror(context, "Something went wrong");
      } else if (scheduleLstresp.statusCode == 200) {
        final resultAsJson = jsonDecode(scheduleLstresp.toString());
        final sctyListRespVal =
            Inspectionlistresp.fromJson(resultAsJson as Map<String, dynamic>);

        if (sctyListRespVal.status == 'success') {
          //print('sucess');
          final itemDet = sctyListRespVal.data ?? [];
          //print(item_det.);
          getInspectionListNotifier.value.clear();
          getInspectionListNotifier.value.addAll(itemDet);
          getInspectionListNotifier.notifyListeners();
        } else if (sctyListRespVal.status == 'failure') {
          final itemDet = sctyListRespVal.data ?? [];
          getInspectionListNotifier.value.clear();
          getInspectionListNotifier.value.addAll(itemDet);
          getInspectionListNotifier.notifyListeners();
          if (!context.mounted) return;
          CommonFun.instance.showApierror(context, "No Data Found");
        }
      } else if (message == 'Unauthenticated' ||
          scheduleLstresp.statusCode == 401) {
        if (!context.mounted) return [];

        CommonFun.instance.signout(context);
      } else if (scheduleLstresp.statusCode == 500) {
        if (!context.mounted) return;
        CommonFun.instance.showApierror(context, "Sever Not reached");

        // showLoginerror(context, 3);
      } else if (scheduleLstresp.statusCode == 408) {
        if (!context.mounted) return;
        CommonFun.instance.showApierror(context, "Connection time out");

        //showLoginerror(context, 4);
      } else {
        getInspectionListNotifier.value.clear();
        getInspectionListNotifier.value.addAll([]);
        getInspectionListNotifier.notifyListeners();
        if (!context.mounted) return;
        CommonFun.instance.showApierror(context, "Something went wrong");
        //showLoginerror(context, 5);
      }
    } catch (e) {
      if (!context.mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('An unexpected error occurred')),
      );
    }
  }

  Future getInspecLstSort(fdate, todate, BuildContext context) async {
    try {
      String? message;

      final sharedValue = await SharedPrefManager.instance.getSharedData();

      final schedulReq = Inspectionlistreq(
          fromdt: fdate, todt: todate, socId: sharedValue!.socId);
      final scheduleLstresp = await Ciadata().inspecitonList(schedulReq);

      if (scheduleLstresp == null) {
        getInspectionListNotifier.value.clear();
        getInspectionListNotifier.value.addAll([]);
        getInspectionListNotifier.notifyListeners();
        if (!context.mounted) return;
        CommonFun.instance.showApierror(context, "Something went wrong");
      } else if (scheduleLstresp.statusCode == 200) {
        final resultAsJson = jsonDecode(scheduleLstresp.toString());
        final sctyListRespVal =
            Inspectionlistresp.fromJson(resultAsJson as Map<String, dynamic>);

        if (sctyListRespVal.status == 'success') {
          //print('sucess');
          final itemDet = sctyListRespVal.data ?? [];
          //print(item_det.);
          getInspectionListNotifier.value.clear();
          getInspectionListNotifier.value.addAll(itemDet);
          getInspectionListNotifier.notifyListeners();
        } else if (sctyListRespVal.status == 'failure') {
          final itemDet = sctyListRespVal.data ?? [];
          getInspectionListNotifier.value.clear();
          getInspectionListNotifier.value.addAll(itemDet);
          getInspectionListNotifier.notifyListeners();
          if (!context.mounted) return;
          CommonFun.instance.showApierror(context, "No Data Found");
        }
      } else if (message == 'Unauthenticated' ||
          scheduleLstresp.statusCode == 401) {
        if (!context.mounted) return [];

        CommonFun.instance.signout(context);
      } else if (scheduleLstresp.statusCode == 500) {
        if (!context.mounted) return;
        CommonFun.instance.showApierror(context, "Sever Not reached");

        // showLoginerror(context, 3);
      } else if (scheduleLstresp.statusCode == 408) {
        if (!context.mounted) return;
        CommonFun.instance.showApierror(context, "Connection time out");

        //showLoginerror(context, 4);
      } else {
        getInspectionListNotifier.value.clear();
        getInspectionListNotifier.value.addAll([]);
        getInspectionListNotifier.notifyListeners();
        if (!context.mounted) return;
        CommonFun.instance.showApierror(context, "Something went wrong");
        //showLoginerror(context, 5);
      }
    } catch (e) {
      if (!context.mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('An unexpected error occurred')),
      );
    }
  }

  Future<List<DatumVal>?> getinspNoticeLst(BuildContext context) async {
    try {
      final sharedValue = await SharedPrefManager.instance.getSharedData();
      String? message;
      List<DatumVal>? insplist = [];

      final insplistReq = Inspectionlistreq(
        socId: sharedValue!.socId,
      );
      final scheduleLstresp = await Ciadata().inspNoticeList(insplistReq);

      if (scheduleLstresp == null) {
        getInspectionNoticeListNotifier.value.clear();
        getInspectionNoticeListNotifier.value.addAll([]);
        getInspectionNoticeListNotifier.notifyListeners();
        if (!context.mounted) return [];
        CommonFun.instance.showApierror(context, "Something went wrong");
        insplist = insplist;
        return insplist;
      } else if (scheduleLstresp.statusCode == 200) {
        final resultAsJson = jsonDecode(scheduleLstresp.toString());
        final sctyListRespVal =
            InspnoticeList.fromJson(resultAsJson as Map<String, dynamic>);

        if (sctyListRespVal.status == 'success') {
          //print('sucess');
          final itemDet = sctyListRespVal.data ?? [];
          //print(item_det.);
          getInspectionNoticeListNotifier.value.clear();
          getInspectionNoticeListNotifier.value.addAll(itemDet);
          getInspectionNoticeListNotifier.notifyListeners();
          insplist = itemDet;
          return insplist;
        } else if (sctyListRespVal.status == 'failure') {
          final itemDet = sctyListRespVal.data ?? [];
          getInspectionNoticeListNotifier.value.clear();
          getInspectionNoticeListNotifier.value.addAll(itemDet);
          getInspectionNoticeListNotifier.notifyListeners();
          if (!context.mounted) return [];
          CommonFun.instance.showApierror(context, "No Data Found");
          insplist = itemDet;
          return insplist;
        }
      } else if (message == 'Unauthenticated' ||
          scheduleLstresp.statusCode == 401) {
        if (!context.mounted) return [];

        CommonFun.instance.signout(context);
      } else if (scheduleLstresp.statusCode == 500) {
        if (!context.mounted) return [];
        CommonFun.instance.showApierror(context, "Sever Not reached");

        // showLoginerror(context, 3);
      } else if (scheduleLstresp.statusCode == 408) {
        if (!context.mounted) return [];
        CommonFun.instance.showApierror(context, "Connection time out");

        //showLoginerror(context, 4);
      } else {
        getInspectionNoticeListNotifier.value.clear();
        getInspectionNoticeListNotifier.value.addAll([]);
        getInspectionNoticeListNotifier.notifyListeners();
        if (!context.mounted) return [];
        CommonFun.instance.showApierror(context, "Something went wrong");
        //showLoginerror(context, 5);
        insplist = insplist;
        return insplist;
      }
    } catch (e) {
      if (!context.mounted) return [];

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('An unexpected error occurred')),
      );
    }
    return [];
  }

  Future getinspNoticeSortLst(
      selectedInspid, fdate, todate, BuildContext context) async {
    try {
      final sharedValue = await SharedPrefManager.instance.getSharedData();
      String? message;

      final insplistReq = Inspectionlistreq(
        inspectionId: selectedInspid,
        fromdt: fdate,
        todt: todate,
        socId: sharedValue!.socId,
      );
      final scheduleLstresp = await Ciadata().inspNoticeList(insplistReq);

      if (scheduleLstresp == null) {
        getInspectionNoticeListNotifier.value.clear();
        getInspectionNoticeListNotifier.value.addAll([]);
        getInspectionNoticeListNotifier.notifyListeners();
        if (!context.mounted) return;
        CommonFun.instance.showApierror(context, "Something went wrong");
      } else if (scheduleLstresp.statusCode == 200) {
        final resultAsJson = jsonDecode(scheduleLstresp.toString());
        final sctyListRespVal =
            InspnoticeList.fromJson(resultAsJson as Map<String, dynamic>);

        if (sctyListRespVal.status == 'success') {
          //print('sucess');
          final itemDet = sctyListRespVal.data ?? [];
          //print(item_det.);
          getInspectionNoticeListNotifier.value.clear();
          getInspectionNoticeListNotifier.value.addAll(itemDet);
          getInspectionNoticeListNotifier.notifyListeners();
        } else if (sctyListRespVal.status == 'failure') {
          final itemDet = sctyListRespVal.data ?? [];
          getInspectionNoticeListNotifier.value.clear();
          getInspectionNoticeListNotifier.value.addAll(itemDet);
          getInspectionNoticeListNotifier.notifyListeners();
          if (!context.mounted) return;
          CommonFun.instance.showApierror(context, "No Data Found");
        }
      } else if (message == 'Unauthenticated' ||
          scheduleLstresp.statusCode == 401) {
        if (!context.mounted) return [];

        CommonFun.instance.signout(context);
      } else if (scheduleLstresp.statusCode == 500) {
        if (!context.mounted) return;
        CommonFun.instance.showApierror(context, "Sever Not reached");

        // showLoginerror(context, 3);
      } else if (scheduleLstresp.statusCode == 408) {
        if (!context.mounted) return;
        CommonFun.instance.showApierror(context, "Connection time out");

        //showLoginerror(context, 4);
      } else {
        getInspectionNoticeListNotifier.value.clear();
        getInspectionNoticeListNotifier.value.addAll([]);
        getInspectionNoticeListNotifier.notifyListeners();
        if (!context.mounted) return;
        CommonFun.instance.showApierror(context, "Something went wrong");
        //showLoginerror(context, 5);
      }
    } catch (e) {
      if (!context.mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('An unexpected error occurred')),
      );
    }
  }

  Future getinspNotice(BuildContext context, int? inspid) async {
    try {
      final sharedValue = await SharedPrefManager.instance.getSharedData();
      String? message;

      final insplistReq =
          Inspectionlistreq(socId: sharedValue!.socId, inspectionId: inspid);
      final scheduleLstresp = await Ciadata().noticeListView(insplistReq);

      if (scheduleLstresp == null) {
        getnoticeNotifierNotifier.value.clear();
        getnoticeNotifierNotifier.value.addAll([]);
        getnoticeNotifierNotifier.notifyListeners();
        if (!context.mounted) return;
        CommonFun.instance.showApierror(context, "Something went wrong");
      } else if (scheduleLstresp.statusCode == 200) {
        final resultAsJson = jsonDecode(scheduleLstresp.toString());
        final sctyListRespVal =
            Inspectionnotice.fromJson(resultAsJson as Map<String, dynamic>);

        if (sctyListRespVal.status == 'success') {
          //print('sucess');
          final itemDet = sctyListRespVal.data ?? [];
          //print(item_det.);
          getnoticeNotifierNotifier.value.clear();
          getnoticeNotifierNotifier.value.addAll(itemDet);
          getnoticeNotifierNotifier.notifyListeners();
        } else if (sctyListRespVal.status == 'failure') {
          final itemDet = sctyListRespVal.data ?? [];
          getnoticeNotifierNotifier.value.clear();
          getnoticeNotifierNotifier.value.addAll(itemDet);
          getnoticeNotifierNotifier.notifyListeners();
          if (!context.mounted) return;
          CommonFun.instance.showApierror(context, "No Data Found");
        }
      } else if (message == 'Unauthenticated' ||
          scheduleLstresp.statusCode == 401) {
        if (!context.mounted) return [];

        CommonFun.instance.signout(context);
      } else if (scheduleLstresp.statusCode == 500) {
        if (!context.mounted) return;
        CommonFun.instance.showApierror(context, "Sever Not reached");

        // showLoginerror(context, 3);
      } else if (scheduleLstresp.statusCode == 408) {
        if (!context.mounted) return;
        CommonFun.instance.showApierror(context, "Connection time out");

        //showLoginerror(context, 4);
      } else {
        getnoticeNotifierNotifier.value.clear();
        getnoticeNotifierNotifier.value.addAll([]);
        getnoticeNotifierNotifier.notifyListeners();
        if (!context.mounted) return;
        CommonFun.instance.showApierror(context, "Something went wrong");
        //showLoginerror(context, 5);
      }
    } catch (e) {
      if (!context.mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('An unexpected error occurred')),
      );
    }
  }

  Future<Data?> getSocietyProfile(BuildContext context) async {
    try {
      final sharedValue = await SharedPrefManager.instance.getSharedData();
      String? message;
      
      final insplistReq =
          Inspectionlistreq(socId: sharedValue!.socId,);
      final scheduleLstresp = await Ciadata().societyProfile(insplistReq);

      if (scheduleLstresp == null) {
        
        if (!context.mounted) return null;
        CommonFun.instance.showApierror(context, "Something went wrong");
        
        return null;
      } else if (scheduleLstresp.statusCode == 200) {
        final resultAsJson = jsonDecode(scheduleLstresp.toString());
        final sctyListRespVal =
            SocietyProfile.fromJson(resultAsJson as Map<String, dynamic>);

        if (sctyListRespVal.status == 'success') {
          
          
          return sctyListRespVal.data;
        } else if (sctyListRespVal.status == 'failure') {
          
          
          if (!context.mounted) return null;
          CommonFun.instance.showApierror(context, "No Data Found");
          return null;
        }
      } else if (message == 'Unauthenticated' ||
          scheduleLstresp.statusCode == 401) {
        if (!context.mounted) return null;

        CommonFun.instance.signout(context);
        return null;
      } else if (scheduleLstresp.statusCode == 500) {
        if (!context.mounted) return null;
        CommonFun.instance.showApierror(context, "Sever Not reached");
        return null;
        // showLoginerror(context, 3);
      } else if (scheduleLstresp.statusCode == 408) {
        if (!context.mounted) return null;
        CommonFun.instance.showApierror(context, "Connection time out");
        return null;
        //showLoginerror(context, 4);
      } else {
        
        if (!context.mounted) return null;
        CommonFun.instance.showApierror(context, "Something went wrong");
        //showLoginerror(context, 5);
        return null;
      }
    } catch (e) {
      if (!context.mounted) return null;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('An unexpected error occurred')),
      );
    }
    return null;
  }
}
