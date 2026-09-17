import 'package:flutter/services.dart';

class PlatformInfo {
  static const MethodChannel _channel = MethodChannel(
    'com.example.showcase/info',
  );

  static Future<String> getDeviceInfo() async {
    try {
      final String result = await _channel.invokeMethod('getDeviceInfo');
      return result;
    } on PlatformException catch (e) {
      return "Failed to get device info: '${e.message}'.";
    } on MissingPluginException {
      return "Method not implemented on this platform.";
    }
  }
}
