import 'dart:developer';

import 'package:cimalite/core/hook/hook.dart';

class SharedPrefManager {
  //---singleton-----
  SharedPrefManager._internal();
  static SharedPrefManager instance = SharedPrefManager._internal();
  SharedPrefManager factory() {
    return instance;
  }
  //----end singleton

  Future<void> addSharedData(Sharedpref value) async {
    final sharedprefes = await SharedPreferences.getInstance();
    await sharedprefes.setBool(savekeyname, true);
    await sharedprefes.setInt('USERID', value.userId ?? 0);
    await sharedprefes.setInt('SOCID', value.socId ?? 0);
    await sharedprefes.setString('SOCCODE', value.socCode ?? '');
    await sharedprefes.setString('SOCNAME', value.socName ?? '');
    await sharedprefes.setString('MOBILE', value.mobile ?? '');
    await sharedprefes.setString('EMAIL', value.email ?? '');
    await sharedprefes.setInt('ACTIVE', value.active ?? 0);
    await sharedprefes.setString('ACCESSTOKEN', value.accesstoken ?? '');

    //final jsonString = json.encode(value.toJson());
    // await prefs.setStringList(_key, login);
  }

  Future<Sharedpref?> getSharedData() async {
    final sharedprefs = await SharedPreferences.getInstance();

    final userid = sharedprefs.getInt('USERID') ?? 0;

    final socid = sharedprefs.getInt('SOCID') ?? 0;

    final soccode = sharedprefs.getString('SOCCODE') ?? '';

    final socname = sharedprefs.getString('SOCNAME') ?? '';

    final mobile = sharedprefs.getString('MOBILE') ?? '';

    final email = sharedprefs.getString('EMAIL') ?? '';

    final active = sharedprefs.getInt('ACTIVE') ?? 0;

    final atkn = sharedprefs.getString('ACCESSTOKEN') ?? '';

    final valshared = Sharedpref.value(
        userId: userid,
        socId: socid,
        socCode: soccode,
        socName: socname,
        mobile: mobile,
        email: email,
        active: active,
        accesstoken: atkn);

    return valshared;
  }

  Future<void> setdeviceinfo(Deviceinfo value) async {
    final sharedprefes = await SharedPreferences.getInstance();
    await sharedprefes.setBool(savedeviceinfo, true);
    await sharedprefes.setString('DEVICE', value.phone ?? '');
    await sharedprefes.setString('DEVICEOS', value.phoneos ?? '');
    await sharedprefes.setString(
        'SCREENRESOLUTION', value.screenresolution ?? '');
    await sharedprefes.setString('DEVICEVERSION', value.osversion ?? '');
    await sharedprefes.setString('PACKAGENAME', value.packagename ?? '');
    await sharedprefes.setString('APPVERSION', value.appversion ?? '');
  }

  Future<Deviceinfo> getdeviceinfo() async {
    final sharedprefs = await SharedPreferences.getInstance();
    bool checkValue = sharedprefs.containsKey('DEVICE');
    log('$checkValue');
    final device = sharedprefs.getString('DEVICE') ?? '';
    final deviceos = sharedprefs.getString('DEVICEOS') ?? '';
    final screenres = sharedprefs.getString('SCREENRESOLUTION') ?? '';
    final deviceversion = sharedprefs.getString('DEVICEVERSION') ?? '';
    final packagename = sharedprefs.getString('PACKAGENAME') ?? '';
    final appversion = sharedprefs.getString('APPVERSION') ?? '';

    final infoshared = Deviceinfo(
        phone: device,
        phoneos: deviceos,
        screenresolution: screenres,
        osversion: deviceversion,
        packagename: packagename,
        appversion: appversion);

    return infoshared;
  }
}
