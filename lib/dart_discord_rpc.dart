// ignore_for_file: implementation_imports
import 'dart:io';
import 'dart:ffi';
import 'package:path/path.dart';
import 'package:dart_discord_rpc_ffi/dart_discord_rpc_ffi.dart' as ffi;
export 'package:dart_discord_rpc_ffi/dart_discord_rpc_ffi.dart' hide DiscordRPC;

/// ## Discord Rich Presence for Dart & Flutter.
///
/// For integrating Discord Rich Presence into your application or game, you must create an
/// application at [Discord Developer Portal](https://discord.com/developers/applications).
///
/// Initialize the plugin.
/// ```dart
/// void main() {
///   DiscordRPC.initialize();
///   runApp(MyApp());
/// }
/// ```
///
/// Example
///
/// ```dart
/// var rpc = DiscordRPC(
///   applicationId: '877853131025809438',
/// );
/// rpc.start(autoRegister: true);
/// rpc.updatePresence(
///   DiscordPresence(
///     state: 'Discord Rich Presence from Dart. 🎯',
///     details: 'github.com/alexmercerind/dart_discord_rpc',
///     startTimeStamp: DateTime.now().millisecondsSinceEpoch,
///     largeImageKey: 'large_image',
///     largeImageText: 'This text describes the large image.',
///     smallImageKey: 'small_image',
///     smallImageText: 'This text describes the small image.',
///   ),
/// );
/// ```
///
class DiscordRPC extends ffi.DiscordRPC {
  DiscordRPC({required String applicationId, String? steamId})
      : super(
          dynamicLibrary: _dynamicLibrary,
          applicationId: applicationId,
          steamId: steamId,
        );

  /// Initializes the plugin.
  ///
  /// ```dart
  /// void main() {
  ///   DiscordRPC.initialize();
  ///   runApp(MyApp());
  /// }
  /// ```
  ///
  static void initialize() {
    if (Platform.isLinux) {
      _dynamicLibrary = DynamicLibrary.open(
        join(
          dirname(Platform.resolvedExecutable),
          'lib',
          'discord_game_sdk.so',
        ),
      );
    } else if (Platform.isWindows) {
      _dynamicLibrary = DynamicLibrary.open(
        join(
          dirname(Platform.resolvedExecutable),
          'discord-rpc.dll',
        ),
      );
    } else if (Platform.isMacOS) {
      _dynamicLibrary = DynamicLibrary.open(
          join(dirname(dirname(Platform.resolvedExecutable)), "libdiscord-rpc.dylib"));
    }
  }
}

late DynamicLibrary _dynamicLibrary;
