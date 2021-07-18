import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:logifan/extensions/string.dart';

class DeviceUtils {
  static String get platform {
    if (Platform.isAndroid) {
      return 'Android';
    } else if (Platform.isIOS) {
      return 'IOS';
    }
    return 'Unknown';
  }

  static Future<String> get platformVersion async {
    return await _getDeviceInfo(
          (androidInfo) => androidInfo.version.sdkInt.toString(),
          (iosInfo) => iosInfo.systemVersion,
    );
  }

  static Future<String> get deviceId async {
    return await _getDeviceInfo(
          (androidInfo) => androidInfo.androidId,
          (iosInfo) => iosInfo.identifierForVendor,
    );
  }

  static Future<String> get deviceName async {
    return await _getDeviceInfo(
      (androidInfo) =>
          '${androidInfo.brand.capitalize()} ${androidInfo.model} ${androidInfo.device}',
      (iosInfo) => iosInfo.name,
    );
  }

  static Future<bool> get isEmulator async {
    final String isPhysical = await _getDeviceInfo(
          (androidInfo) => androidInfo.isPhysicalDevice.toString(),
          (iosInfo) => iosInfo.isPhysicalDevice.toString(),
    );
    if (isPhysical == 'true') {
      return false;
    }
    return true;
  }

  static Future<String> _getDeviceInfo(
    String Function(AndroidDeviceInfo) androidDeviceInfo,
    String Function(IosDeviceInfo) iosDeviceInfo,
  ) async {
    final deviceInfo = DeviceInfoPlugin();
    var identifier = 'null';
    if (Platform.isAndroid) {
      final androidInfo = await deviceInfo.androidInfo;
      identifier = androidDeviceInfo.call(androidInfo);
    } else if (Platform.isIOS) {
      final iosInfo = await deviceInfo.iosInfo;
      identifier = iosDeviceInfo.call(iosInfo);
    }
    if (identifier == '') {
      return 'null';
    }
    return identifier;
  }
}
