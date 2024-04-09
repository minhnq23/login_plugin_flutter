import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'login_plugin_platform_interface.dart';

/// An implementation of [LoginPluginPlatform] that uses method channels.
class MethodChannelLoginPlugin extends LoginPluginPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('login_plugin');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  Future<void> login(String email, String password) async {
    try {
      var result = await methodChannel
          .invokeMethod('login', {"email": email, "password": password});

      print("result chanel: $result");
    } catch (e) {
      print('Error: $e');
    }
  }
}
