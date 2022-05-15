import 'dart:io';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:path/path.dart';
import 'model/discord_presence.dart';
import 'generated/bindings.dart' as bindings;

DynamicLibrary? _dynamicLibrary;

class DiscordRPC {
  final String applicationId;

  final String? steamId;

  late bindings.DiscordRPC _bindings;

  DiscordRPC({
    required this.applicationId,
    this.steamId,
  }) {
    final library = _dynamicLibrary;
    if (library == null) {
      throw Exception(
        "Discord RPC has not been initialized! Please run 'DiscordRPC.initialize()'.",
      );
    }
    _bindings = bindings.DiscordRPC(library);
  }

  void register(String command) {
    final ptr0 = applicationId.toNativeUtf8().cast<Int8>();
    final ptr1 = command.toNativeUtf8().cast<Int8>();
    _bindings.Discord_Register(ptr0, ptr1);
    calloc.free(ptr0);
    calloc.free(ptr1);
  }

  void registerSteamGame() {
    final ptr0 = applicationId.toNativeUtf8().cast<Int8>();
    final ptr1 = (steamId?.toNativeUtf8() ?? nullptr).cast<Int8>();
    _bindings.Discord_RegisterSteamGame(ptr0, ptr1);
    calloc.free(ptr0);
    calloc.free(ptr1);
  }

  void start({bool autoRegister = false}) {
    final ptr0 = applicationId.toNativeUtf8().cast<Int8>();
    final ptr1 = (steamId?.toNativeUtf8() ?? nullptr).cast<Int8>();
    _bindings.Discord_Initialize(
      ptr0,
      calloc<bindings.DiscordEventHandlers>(),
      autoRegister == false ? 0 : 1,
      ptr1,
    );
    calloc.free(ptr0);
    calloc.free(ptr1);
  }

  void updatePresence(DiscordPresence presence) {
    final ptr = calloc<bindings.DiscordRichPresence>();
    final state = presence.state?.toNativeUtf8() ?? nullptr;
    final details = presence.details?.toNativeUtf8() ?? nullptr;
    final startTimeStamp = presence.startTimeStamp ?? 0;
    final endTimeStamp = presence.endTimeStamp ?? 0;
    final largeImageKey = presence.largeImageKey?.toNativeUtf8() ?? nullptr;
    final largeImageText = presence.largeImageText?.toNativeUtf8() ?? nullptr;
    final smallImageKey = presence.smallImageKey?.toNativeUtf8() ?? nullptr;
    final smallImageText = presence.smallImageText?.toNativeUtf8() ?? nullptr;
    final partyId = presence.partyId?.toNativeUtf8() ?? nullptr;
    final partySize = presence.partySize ?? 0;
    final partyMax = presence.partySizeMax ?? 0;
    final matchSecret = presence.matchSecret?.toNativeUtf8() ?? nullptr;
    final joinSecret = presence.joinSecret?.toNativeUtf8() ?? nullptr;
    final spectateSecret = presence.spectateSecret?.toNativeUtf8() ?? nullptr;
    final button1Label = presence.button1Label?.toNativeUtf8() ?? nullptr;
    final button1Url = presence.button1Url?.toNativeUtf8() ?? nullptr;
    final button2Label = presence.button2Label?.toNativeUtf8() ?? nullptr;
    final button2Url = presence.button2Url?.toNativeUtf8() ?? nullptr;
    final instance = presence.instance ?? 0;
    print(button1Label.address);
    print(button1Url.address);
    print(button2Label.address);
    print(button2Url.address);
    ptr.ref.state = state.cast();
    ptr.ref.details = details.cast();
    ptr.ref.startTimestamp = startTimeStamp;
    ptr.ref.endTimestamp = endTimeStamp;
    ptr.ref.largeImageKey = largeImageKey.cast();
    ptr.ref.largeImageText = largeImageText.cast();
    ptr.ref.smallImageKey = smallImageKey.cast();
    ptr.ref.smallImageText = smallImageText.cast();
    ptr.ref.partyId = partyId.cast();
    ptr.ref.partySize = partySize;
    ptr.ref.partyMax = partyMax;
    ptr.ref.matchSecret = matchSecret.cast();
    ptr.ref.joinSecret = joinSecret.cast();
    ptr.ref.spectateSecret = spectateSecret.cast();
    ptr.ref.button_label_1 = button1Label.cast();
    ptr.ref.button_url_1 = button1Url.cast();
    ptr.ref.button_label_2 = button2Label.cast();
    ptr.ref.button_url_2 = button2Url.cast();
    ptr.ref.instance = instance;
    _bindings.Discord_UpdatePresence(ptr);
    calloc.free(ptr);
    if (state != nullptr) {
      calloc.free(state);
    }
    if (details != nullptr) {
      calloc.free(details);
    }
    if (largeImageKey != nullptr) {
      calloc.free(largeImageKey);
    }
    if (largeImageText != nullptr) {
      calloc.free(largeImageText);
    }
    if (smallImageKey != nullptr) {
      calloc.free(smallImageKey);
    }
    if (smallImageText != nullptr) {
      calloc.free(smallImageText);
    }
    if (partyId != nullptr) {
      calloc.free(partyId);
    }
    if (matchSecret != nullptr) {
      calloc.free(matchSecret);
    }
    if (joinSecret != nullptr) {
      calloc.free(joinSecret);
    }
    if (spectateSecret != nullptr) {
      calloc.free(spectateSecret);
    }
    if (button1Label != nullptr) {
      calloc.free(button1Label);
    }
    if (button1Url != nullptr) {
      calloc.free(button1Url);
    }
    if (button2Label != nullptr) {
      calloc.free(button2Label);
    }
    if (button2Url != nullptr) {
      calloc.free(button2Url);
    }
  }

  void shutDown() {
    _bindings.Discord_Shutdown();
  }

  void clearPresence() {
    _bindings.Discord_ClearPresence();
  }

  void respond(String userId, int reply) {
    final ptr = userId.toNativeUtf8().cast<Int8>();
    _bindings.Discord_Respond(
      ptr,
      reply,
    );
    calloc.free(ptr);
  }

  static void initialize() {
    if (_dynamicLibrary != null) {
      throw Exception("DiscordRPC has already been initialized.");
    }
    if (Platform.isLinux) {
      _dynamicLibrary = DynamicLibrary.open(
        join(
          dirname(Platform.resolvedExecutable),
          'lib',
          'libdiscord-rpc.so',
        ),
      );
    } else if (Platform.isWindows) {
      _dynamicLibrary = DynamicLibrary.open(
        join(
          dirname(Platform.resolvedExecutable),
          'discord-rpc.dll',
        ),
      );
    } else {
      throw Exception(
        "Unsupported DiscordRPC platform: '${Platform.operatingSystem}'.",
      );
    }
  }
}
