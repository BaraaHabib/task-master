import 'package:package_info_plus/package_info_plus.dart';

final class PackageInfoUtils {
  PackageInfoUtils._();

  static PackageInfo? _packageInfo;

  static Future<PackageInfo> get packageInfo async {
    _packageInfo ??= await PackageInfo.fromPlatform();
    return _packageInfo!;
  }

  static Future<String?> getAppVersion() async => (await packageInfo).version;

  static Future<String> getAppName() async {
    return (await packageInfo).appName;
  }
}
