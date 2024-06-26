import 'package:utils/src/device_info/device_info_utils.dart';

/// {@template utils}
/// PackageDescription
/// {@endtemplate}
class Utils {
  /// {@macro utils}
  const Utils();

  static Future<String?> get deviceId => DeviceInfoUtils.getDeviceId();

}
