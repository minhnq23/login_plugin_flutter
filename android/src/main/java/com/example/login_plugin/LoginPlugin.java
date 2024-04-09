package com.example.login_plugin;

import androidx.annotation.NonNull;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;

import com.example.plugin.login_sdk.LoginInterface;
import  com.example.plugin.login_sdk.LoginSdkPlugin;

/** LoginPlugin */
public class LoginPlugin implements FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private MethodChannel channel;
  public LoginSdkPlugin sdk;


  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "login_plugin");
    channel.setMethodCallHandler(this);
    sdk = new LoginSdkPlugin();
    sdk.setLoginDelegate(new LoginInterface() {
      @Override
      public void onLoginSuccess(String s) {
        channel.invokeMethod("loginSuccess", s);
      }

      @Override
      public void onLoginFailure(String s) {
        channel.invokeMethod("loginFailure", s);
      }
    });
  }

  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
    if (call.method.equals("login")) {
      sdk.login("minh","123");

    } else {
      result.notImplemented();
    }
  }

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    channel.setMethodCallHandler(null);
    sdk = null;
  }
}
