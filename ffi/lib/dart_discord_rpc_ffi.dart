import 'dart:ffi';

import 'package:ffi/ffi.dart';
import 'package:dart_discord_rpc_ffi/generated/bindings.dart' as ffi;
import 'package:dart_discord_rpc_ffi/src/models/discord_presence.dart';
export 'package:dart_discord_rpc_ffi/src/models/discord_presence.dart';

/// ## Discord Rich Presence
///
/// For integrating Discord Rich Presence into your application or game, you must create an
/// application at [Discord Developer Portal](https://discord.com/developers/applications).
///
/// Example
///
/// ```dart
///
/// void main() {
///   DiscordRPC.initialize();
///   runApp(MyApp());
/// }
///
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
class DiscordClient {
  /// ID of your application at Discord Developer Portal.
  final int applicationId;
  final DynamicLibrary dynamicLibrary;

  /// Steam ID.
  final String? steamId;

  DiscordClient({
    required this.dynamicLibrary,
    required this.applicationId,
    this.steamId,
  });

  /// Registers the rich presence client.
  void register(String command) {
    // _bindings.Discord_Register(
    //   applicationId.toNativeUtf8(),
    //   command.toNativeUtf8(),
    // );
  }

  /// Registers the steam game.
  void registerSteamGame() {
    // _bindings.Discord_RegisterSteamGame(
    //   applicationId.toNativeUtf8(),
    //   (steamId ?? '').toNativeUtf8(),
    // );
  }

  /// Starts the Discord Rich Presence.
  void start() {
    var discordCreateParams = calloc<ffi.DiscordCreateParams>();
    var discordCore = calloc<Pointer<ffi.IDiscordCore>>();

    discordCreateParams.ref.client_id = applicationId;
    discordCreateParams.ref.flags =
        ffi.EDiscordCreateFlags.DiscordCreateFlags_Default;

    _bindings = ffi.DiscordClient(dynamicLibrary);
    _bindings.DiscordCreate(1, discordCreateParams, discordCore);
  }

  /// Updates the presence of the [DiscordUser], takes [DiscordPresence] as argument.
  /// Describing current user presence inside the application or game.
  ///
  /// For showing the user's start time from present, you must pass [DiscordPresence.startTimeStamp] as `DateTime.now().millisecondsSinceEpoch`.
  ///
  void updatePresence(DiscordPresence presence) {
    // var presencePtr = calloc<ffi.DiscordRichPresence>();
    // presencePtr.ref.state = (presence.state ?? '').toNativeUtf8();
    // presencePtr.ref.details = (presence.details ?? '').toNativeUtf8();
    // presencePtr.ref.startTimestamp = presence.startTimeStamp ?? 0;
    // presencePtr.ref.endTimestamp = presence.endTimeStamp ?? 0;
    // presencePtr.ref.largeImageKey =
    //     (presence.largeImageKey ?? '').toNativeUtf8();
    // presencePtr.ref.largeImageText =
    //     (presence.largeImageText ?? '').toNativeUtf8();
    // presencePtr.ref.smallImageKey =
    //     (presence.smallImageKey ?? '').toNativeUtf8();
    // presencePtr.ref.smallImageText =
    //     (presence.smallImageText ?? '').toNativeUtf8();
    // presencePtr.ref.partySize = presence.partySize ?? 0;
    // presencePtr.ref.matchSecret = (presence.matchSecret ?? '').toNativeUtf8();
    // presencePtr.ref.joinSecret = (presence.joinSecret ?? '').toNativeUtf8();
    // presencePtr.ref.spectateSecret =
    //     (presence.spectateSecret ?? '').toNativeUtf8();
    // presencePtr.ref.instance = presence.instance ?? 0;
    // _bindings.Discord_UpdatePresence(presencePtr);
    // calloc.free(presencePtr);
  }

  /// Shuts down the Discord RPC.
  void shutDown() {
    // _bindings.Discord_Shutdown();
  }

  /// Clears the previously set [DiscordPresence] for the user.
  void clearPresence() {
    // _bindings.Discord_ClearPresence();
  }

  /// Responds to the user.
  void respond(String userId, int reply) {
    // _bindings.Discord_Respond(
    //   userId.toNativeUtf8(),
    //   reply,
    // );
  }

  late ffi.DiscordClient _bindings;
}
