// ignore_for_file: implementation_imports
import 'dart:io';
import 'dart:ffi';
import 'package:dart_discord_rpc_ffi/src/ffi.dart';
import 'package:path/path.dart' as path;
import 'package:dart_discord_rpc_ffi/dart_discord_rpc_ffi.dart' as FFI;
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
/// DiscordRPC discord = DiscordRPC(
///   applicationId: '877853131025809438',
/// );
/// discord.start(autoRegister: true);
/// discord.updatePresence(
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
class DiscordRPC extends FFI.DiscordRPC {
  DiscordRPC({required String applicationId, String? steamId})
      : super(applicationId: applicationId, steamId: steamId);

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
    if (Platform.isWindows) {
      final libraryPath = path.join(
          path.dirname(Platform.resolvedExecutable), 'dart_discord_rpc.dll');
      dynamicLibrary = DynamicLibrary.open(libraryPath);
      DiscordRPCFFI.initialize(
          NativeApi.postCObject, receiver.sendPort.nativePort);
    }
  }
}
