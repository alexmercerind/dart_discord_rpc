
import 'dart:async';

import 'package:flutter/services.dart';

class DartDiscordRpc {
  static const MethodChannel _channel =
      const MethodChannel('dart_discord_rpc');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
