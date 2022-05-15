import 'dart:ffi' as ffi;

class DiscordRPC {
  final ffi.Pointer<T> Function<T extends ffi.NativeType>(String symbolName)
      _lookup;

  DiscordRPC(ffi.DynamicLibrary dynamicLibrary)
      : _lookup = dynamicLibrary.lookup;

  DiscordRPC.fromLookup(
      ffi.Pointer<T> Function<T extends ffi.NativeType>(String symbolName)
          lookup)
      : _lookup = lookup;

  void Discord_Register(
    ffi.Pointer<ffi.Int8> applicationId,
    ffi.Pointer<ffi.Int8> command,
  ) {
    return _Discord_Register(
      applicationId,
      command,
    );
  }

  late final _Discord_RegisterPtr = _lookup<
      ffi.NativeFunction<
          ffi.Void Function(ffi.Pointer<ffi.Int8>,
              ffi.Pointer<ffi.Int8>)>>('Discord_Register');
  late final _Discord_Register = _Discord_RegisterPtr.asFunction<
      void Function(ffi.Pointer<ffi.Int8>, ffi.Pointer<ffi.Int8>)>();

  void Discord_RegisterSteamGame(
    ffi.Pointer<ffi.Int8> applicationId,
    ffi.Pointer<ffi.Int8> steamId,
  ) {
    return _Discord_RegisterSteamGame(
      applicationId,
      steamId,
    );
  }

  late final _Discord_RegisterSteamGamePtr = _lookup<
      ffi.NativeFunction<
          ffi.Void Function(ffi.Pointer<ffi.Int8>,
              ffi.Pointer<ffi.Int8>)>>('Discord_RegisterSteamGame');
  late final _Discord_RegisterSteamGame =
      _Discord_RegisterSteamGamePtr.asFunction<
          void Function(ffi.Pointer<ffi.Int8>, ffi.Pointer<ffi.Int8>)>();

  void Discord_Initialize(
    ffi.Pointer<ffi.Int8> applicationId,
    ffi.Pointer<DiscordEventHandlers> handlers,
    int autoRegister,
    ffi.Pointer<ffi.Int8> optionalSteamId,
  ) {
    return _Discord_Initialize(
      applicationId,
      handlers,
      autoRegister,
      optionalSteamId,
    );
  }

  late final _Discord_InitializePtr = _lookup<
      ffi.NativeFunction<
          ffi.Void Function(
              ffi.Pointer<ffi.Int8>,
              ffi.Pointer<DiscordEventHandlers>,
              ffi.Int32,
              ffi.Pointer<ffi.Int8>)>>('Discord_Initialize');
  late final _Discord_Initialize = _Discord_InitializePtr.asFunction<
      void Function(ffi.Pointer<ffi.Int8>, ffi.Pointer<DiscordEventHandlers>,
          int, ffi.Pointer<ffi.Int8>)>();

  void Discord_Shutdown() {
    return _Discord_Shutdown();
  }

  late final _Discord_ShutdownPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function()>>('Discord_Shutdown');
  late final _Discord_Shutdown =
      _Discord_ShutdownPtr.asFunction<void Function()>();

  void Discord_RunCallbacks() {
    return _Discord_RunCallbacks();
  }

  late final _Discord_RunCallbacksPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function()>>('Discord_RunCallbacks');
  late final _Discord_RunCallbacks =
      _Discord_RunCallbacksPtr.asFunction<void Function()>();

  void Discord_UpdatePresence(
    ffi.Pointer<DiscordRichPresence> presence,
  ) {
    return _Discord_UpdatePresence(
      presence,
    );
  }

  late final _Discord_UpdatePresencePtr = _lookup<
      ffi.NativeFunction<
          ffi.Void Function(
              ffi.Pointer<DiscordRichPresence>)>>('Discord_UpdatePresence');
  late final _Discord_UpdatePresence = _Discord_UpdatePresencePtr.asFunction<
      void Function(ffi.Pointer<DiscordRichPresence>)>();

  void Discord_ClearPresence() {
    return _Discord_ClearPresence();
  }

  late final _Discord_ClearPresencePtr =
      _lookup<ffi.NativeFunction<ffi.Void Function()>>('Discord_ClearPresence');
  late final _Discord_ClearPresence =
      _Discord_ClearPresencePtr.asFunction<void Function()>();

  void Discord_Respond(
    ffi.Pointer<ffi.Int8> userid,
    int reply,
  ) {
    return _Discord_Respond(
      userid,
      reply,
    );
  }

  late final _Discord_RespondPtr = _lookup<
      ffi.NativeFunction<
          ffi.Void Function(
              ffi.Pointer<ffi.Int8>, ffi.Int32)>>('Discord_Respond');
  late final _Discord_Respond = _Discord_RespondPtr.asFunction<
      void Function(ffi.Pointer<ffi.Int8>, int)>();

  void Discord_UpdateHandlers(
    ffi.Pointer<DiscordEventHandlers> handlers,
  ) {
    return _Discord_UpdateHandlers(
      handlers,
    );
  }

  late final _Discord_UpdateHandlersPtr = _lookup<
      ffi.NativeFunction<
          ffi.Void Function(
              ffi.Pointer<DiscordEventHandlers>)>>('Discord_UpdateHandlers');
  late final _Discord_UpdateHandlers = _Discord_UpdateHandlersPtr.asFunction<
      void Function(ffi.Pointer<DiscordEventHandlers>)>();
}

class DiscordRichPresence extends ffi.Struct {
  external ffi.Pointer<ffi.Int8> state;

  external ffi.Pointer<ffi.Int8> details;
  @ffi.Int64()
  external int startTimestamp;
  @ffi.Int64()
  external int endTimestamp;
  external ffi.Pointer<ffi.Int8> largeImageKey;
  external ffi.Pointer<ffi.Int8> largeImageText;
  external ffi.Pointer<ffi.Int8> smallImageKey;
  external ffi.Pointer<ffi.Int8> smallImageText;
  external ffi.Pointer<ffi.Int8> partyId;
  @ffi.Int32()
  external int partySize;
  @ffi.Int32()
  external int partyMax;
  @ffi.Int32()
  external int partyPrivacy;
  external ffi.Pointer<ffi.Int8> matchSecret;
  external ffi.Pointer<ffi.Int8> joinSecret;
  external ffi.Pointer<ffi.Int8> spectateSecret;
  external ffi.Pointer<ffi.Int8> button_label_1;
  external ffi.Pointer<ffi.Int8> button_url_1;
  external ffi.Pointer<ffi.Int8> button_label_2;
  external ffi.Pointer<ffi.Int8> button_url_2;
  @ffi.Int8()
  external int instance;
}

class DiscordUser extends ffi.Struct {
  external ffi.Pointer<ffi.Int8> userId;

  external ffi.Pointer<ffi.Int8> username;

  external ffi.Pointer<ffi.Int8> discriminator;

  external ffi.Pointer<ffi.Int8> avatar;
}

class DiscordEventHandlers extends ffi.Struct {
  external ffi.Pointer<
      ffi.NativeFunction<ffi.Void Function(ffi.Pointer<DiscordUser>)>> ready;

  external ffi.Pointer<
      ffi.NativeFunction<
          ffi.Void Function(ffi.Int32, ffi.Pointer<ffi.Int8>)>> disconnected;

  external ffi.Pointer<
      ffi.NativeFunction<
          ffi.Void Function(ffi.Int32, ffi.Pointer<ffi.Int8>)>> errored;

  external ffi
          .Pointer<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Int8>)>>
      joinGame;

  external ffi
          .Pointer<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Int8>)>>
      spectateGame;

  external ffi.Pointer<
          ffi.NativeFunction<ffi.Void Function(ffi.Pointer<DiscordUser>)>>
      joinRequest;
}

const int DISCORD_REPLY_NO = 0;

const int DISCORD_REPLY_YES = 1;

const int DISCORD_REPLY_IGNORE = 2;
