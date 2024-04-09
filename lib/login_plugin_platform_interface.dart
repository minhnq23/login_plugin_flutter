import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'login_plugin_method_channel.dart';

abstract class LoginPluginPlatform extends PlatformInterface {
  /// Constructs a LoginPluginPlatform.
  LoginPluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static LoginPluginPlatform _instance = MethodChannelLoginPlugin();

  /// The default instance of [LoginPluginPlatform] to use.
  ///
  /// Defaults to [MethodChannelLoginPlugin].
  static LoginPluginPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [LoginPluginPlatform] when
  /// they register themselves.
  static set instance(LoginPluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<void> login(String email, String password);
}
