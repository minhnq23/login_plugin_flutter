import 'package:flutter_test/flutter_test.dart';
import 'package:login_plugin/login_plugin.dart';
import 'package:login_plugin/login_plugin_platform_interface.dart';
import 'package:login_plugin/login_plugin_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockLoginPluginPlatform
    with MockPlatformInterfaceMixin
    implements LoginPluginPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future<void> login(String username, String password) {
    // TODO: implement login
    throw UnimplementedError();
  }
}

void main() {
  final LoginPluginPlatform initialPlatform = LoginPluginPlatform.instance;

  test('$MethodChannelLoginPlugin is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelLoginPlugin>());
  });

  test('getPlatformVersion', () async {
    LoginPlugin loginPlugin = LoginPlugin();
    MockLoginPluginPlatform fakePlatform = MockLoginPluginPlatform();
    LoginPluginPlatform.instance = fakePlatform;

    expect(await loginPlugin.getPlatformVersion(), '42');
  });
}
