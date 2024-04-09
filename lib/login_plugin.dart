
import 'dart:convert';

import 'package:flutter/services.dart';

import 'login_plugin_platform_interface.dart';

class LoginPlugin {
  final MethodChannel _channel = const MethodChannel('login_plugin');
  Future<String?> getPlatformVersion() {
    return LoginPluginPlatform.instance.getPlatformVersion();
  }
  Future<void> login(String email, String password){
   return LoginPluginPlatform.instance.login(email, password);
  }




  LoginPlugin() {
    _channel.setMethodCallHandler(_handleMethod);
  }


  Future<dynamic> _handleMethod(MethodCall call) async {
    switch (call.method) {
      case 'loginSuccess':
        try{

          String arguments = call.arguments;
          print("email: $arguments");
          _channel.invokeMethod('loginSuccess', arguments);
        }catch(e){
          print("error: $e");
        }

      // Xử lý kết quả đăng nhập thành công ở đây
      print("Đăng nhập thành công gửi kq từ sdk lên  ");
        break;
      case 'loginFailure':
      // Xử lý kết quả đăng nhập thất bại ở đây
        print("Đăng nhập không thành công gửi kq từ sdk lên ");
        break;
    }
  }

}
