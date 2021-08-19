import 'package:ffi/ffi.dart';
import 'package:dart_discord_rpc_ffi/src/ffi.dart';

class DiscordRPC {
  final String applicationId;
  final String? steamId;

  DiscordRPC({required this.applicationId, this.steamId});

  void register(String command) {
    DiscordRPCFFI.register(
        applicationId.toNativeUtf8(), command.toNativeUtf8());
  }

  void registerSteamGame() {
    DiscordRPCFFI.register(
        applicationId.toNativeUtf8(), (steamId ?? '').toNativeUtf8());
  }

  void start({bool autoRegister = false}) {
    DiscordRPCFFI.start(applicationId.toNativeUtf8(),
        autoRegister == false ? 0 : 1, (steamId ?? '').toNativeUtf8());
  }

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

  void shutDown() {
    DiscordRPCFFI.shutDown();
  }

  void clearPresence() {
    DiscordRPCFFI.clearPresence();
  }

  void respond(String userId, int reply) {
    DiscordRPCFFI.respond(userId.toNativeUtf8(), reply);
  }
}

class DiscordPresence {
  final String? state;
  final String? details;
  final int? startTimeStamp;
  final int? endTimeStamp;
  final String? largeImageKey;
  final String? largeImageText;
  final String? smallImageKey;
  final String? smallImageText;
  final String? partyId;
  final int? partySize;
  final int? partySizeMax;
  final String? matchSecret;
  final String? joinSecret;
  final String? spectateSecret;
  final int? instance;

  DiscordPresence(
      {this.state,
      this.details,
      this.startTimeStamp,
      this.endTimeStamp,
      this.largeImageKey,
      this.largeImageText,
      this.smallImageKey,
      this.smallImageText,
      this.partyId,
      this.partySize,
      this.partySizeMax,
      this.matchSecret,
      this.joinSecret,
      this.spectateSecret,
      this.instance});
}
