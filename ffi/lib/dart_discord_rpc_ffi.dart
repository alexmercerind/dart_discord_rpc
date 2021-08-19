import 'dart:async';
import 'package:ffi/ffi.dart';
import 'package:dart_discord_rpc_ffi/src/ffi.dart';
import 'package:dart_discord_rpc_ffi/src/models/discord_event.dart';
import 'package:dart_discord_rpc_ffi/src/models/discord_user.dart';
import 'package:dart_discord_rpc_ffi/src/models/discord_presence.dart';

export 'package:dart_discord_rpc_ffi/src/models/discord_event.dart';
export 'package:dart_discord_rpc_ffi/src/models/discord_presence.dart';
export 'package:dart_discord_rpc_ffi/src/models/discord_user.dart';

/// ## Discord Rich Presence for Dart & Flutter.
///
/// For integrating Discord Rich Presence into your application or game, you must create an
/// application at [Discord Developer Portal](https://discord.com/developers/applications).
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
class DiscordRPC {
  /// ID of your application at Discord Developer Portal.
  final String applicationId;

  /// Steam ID.
  final String? steamId;

  /// [Stream] to listen to events related to Discord RPC.
  late Stream<DiscordEvent> events;

  DiscordRPC({required this.applicationId, this.steamId}) {
    events = eventsController.stream;
    receiver.listen((event) {
      if (event is List) {
        String type = event.first;
        switch (type) {
          case 'ready':
            {
              if (!eventsController.isClosed) {
                eventsController.add(
                  DiscordReady(
                    DiscordUser(event[1], event[2], event[3], event[4]),
                  ),
                );
              }
              break;
            }
          case 'disconnected':
            {
              if (!eventsController.isClosed) {
                eventsController.add(
                  DiscordDisconnected(
                    int.parse(event[1]),
                    event[2],
                  ),
                );
              }
              break;
            }
          case 'errored':
            {
              if (!eventsController.isClosed) {
                eventsController.add(
                  DiscordErrored(
                    int.parse(event[1]),
                    event[2],
                  ),
                );
              }
              break;
            }
          case 'join_game':
            {
              if (!eventsController.isClosed) {
                eventsController.add(
                  DiscordJoinGame(event[2]),
                );
              }
              break;
            }
          case 'spectate_game':
            {
              if (!eventsController.isClosed) {
                eventsController.add(
                  DiscordSpectateGame(event[2]),
                );
              }
              break;
            }
          case 'join_request':
            {
              if (!eventsController.isClosed) {
                eventsController.add(
                  DiscordJoinRequest(event[2]),
                );
              }
              break;
            }
          default:
            break;
        }
      }
    });
  }

  /// Registers the rich presence.
  void register(String command) {
    DiscordRPCFFI.register(
        applicationId.toNativeUtf8(), command.toNativeUtf8());
  }

  /// Registers the steam game.
  void registerSteamGame() {
    DiscordRPCFFI.register(
        applicationId.toNativeUtf8(), (steamId ?? '').toNativeUtf8());
  }

  /// Starts the Discord Rich Presence.
  void start({bool autoRegister = false}) {
    DiscordRPCFFI.start(applicationId.toNativeUtf8(),
        autoRegister == false ? 0 : 1, (steamId ?? '').toNativeUtf8());
  }

  /// Updates the presence of the [DiscordUser], takes [DiscordPresence] as argument.
  /// Describing current user presence inside the application or game.
  ///
  /// For showing the user's start time from present, you must pass [DiscordPresence.startTimeStamp] as `DateTime.now().millisecondsSinceEpoch`.
  ///
  void updatePresence(DiscordPresence presence) {
    DiscordRPCFFI.updatePresence(
        (presence.state ?? '').toNativeUtf8(),
        (presence.details ?? '').toNativeUtf8(),
        presence.startTimeStamp ?? 0,
        presence.endTimeStamp ?? 0,
        (presence.largeImageKey ?? '').toNativeUtf8(),
        (presence.largeImageText ?? '').toNativeUtf8(),
        (presence.smallImageKey ?? '').toNativeUtf8(),
        (presence.smallImageText ?? '').toNativeUtf8(),
        (presence.partyId ?? '').toNativeUtf8(),
        presence.partySize ?? 0,
        presence.partySizeMax ?? 0,
        (presence.matchSecret ?? '').toNativeUtf8(),
        (presence.joinSecret ?? '').toNativeUtf8(),
        (presence.spectateSecret ?? '').toNativeUtf8(),
        presence.instance ?? 0);
  }

  /// Shuts down the Discord RPC.
  void shutDown() {
    DiscordRPCFFI.shutDown();
  }

  /// Clears the previously set [DiscordPresence] for the user.
  void clearPresence() {
    DiscordRPCFFI.clearPresence();
  }

  /// Responds to the user.
  void respond(String userId, int reply) {
    DiscordRPCFFI.respond(userId.toNativeUtf8(), reply);
  }

  /// Internally used stream controller for event handling.
  StreamController<DiscordEvent> eventsController =
      StreamController<DiscordEvent>.broadcast();
}
