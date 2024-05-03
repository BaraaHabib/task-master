import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:uuid/uuid.dart';


enum OsType{
  android,
  ios,
  windows,
}


final class DeviceInfoUtils {
  DeviceInfoUtils._();

  //#region device info
  static Future<AndroidDeviceInfo> get androidInfo async =>
      await DeviceInfoPlugin().androidInfo;


  static Future<IosDeviceInfo> get iosInfo async =>
      await DeviceInfoPlugin().iosInfo;

  static Future<String?> getDeviceId() async {
    if (Platform.isAndroid) {
      var androidDeviceInfo = await androidInfo;
      return '${androidDeviceInfo.model}-${androidDeviceInfo.id}';
    } else if (Platform.isIOS) {
      var iosDeviceInfo = await iosInfo;
      return '${iosDeviceInfo.utsname.machine}-${iosDeviceInfo
          .identifierForVendor}';
    } else if (kIsWeb) {
      return const Uuid().v4();
    } else {
      return null;
    }
  }

  static String getPlatformName() {
    if (Platform.isIOS) {
      return 'IOS';
    } else if (Platform.isAndroid) {
      return 'ANDROID';
    } else if (kIsWeb) {
      return 'WEB';
    } else {
      return 'UNKNOWN';
    }
  }

  OsType get osType {
    if (Platform.isAndroid) {
      return OsType.android;
    }
    if (Platform.isIOS) {
      return OsType.ios;
    }
    if (Platform.isWindows) {
      return OsType.windows;
    }
    return OsType.android;
  }
}
