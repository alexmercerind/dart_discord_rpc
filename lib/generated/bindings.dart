// AUTO GENERATED FILE, DO NOT EDIT.
//
// Generated by `package:ffigen`.
import 'dart:ffi' as ffi;

/// Dart bindings to Discord RPC client.
class DiscordRPC {
  /// Holds the symbol lookup function.
  final ffi.Pointer<T> Function<T extends ffi.NativeType>(String symbolName)
      _lookup;

  /// The symbols are looked up in [dynamicLibrary].
  DiscordRPC(ffi.DynamicLibrary dynamicLibrary)
      : _lookup = dynamicLibrary.lookup;

  /// The symbols are looked up with [lookup].
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

class __fsid_t extends ffi.Struct {
  @ffi.Array.multi([2])
  external ffi.Array<ffi.Int32> __val;
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

  external ffi.Pointer<ffi.Int8> matchSecret;

  external ffi.Pointer<ffi.Int8> joinSecret;

  external ffi.Pointer<ffi.Int8> spectateSecret;

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

const int _STDINT_H = 1;

const int _FEATURES_H = 1;

const int _DEFAULT_SOURCE = 1;

const int __GLIBC_USE_ISOC2X = 1;

const int __USE_ISOC11 = 1;

const int __USE_ISOC99 = 1;

const int __USE_ISOC95 = 1;

const int _POSIX_SOURCE = 1;

const int _POSIX_C_SOURCE = 200809;

const int __USE_POSIX = 1;

const int __USE_POSIX2 = 1;

const int __USE_POSIX199309 = 1;

const int __USE_POSIX199506 = 1;

const int __USE_XOPEN2K = 1;

const int __USE_XOPEN2K8 = 1;

const int _ATFILE_SOURCE = 1;

const int __WORDSIZE = 64;

const int __WORDSIZE_TIME64_COMPAT32 = 1;

const int __SYSCALL_WORDSIZE = 64;

const int __TIMESIZE = 64;

const int __USE_MISC = 1;

const int __USE_ATFILE = 1;

const int __USE_FORTIFY_LEVEL = 0;

const int __GLIBC_USE_DEPRECATED_GETS = 0;

const int __GLIBC_USE_DEPRECATED_SCANF = 0;

const int _STDC_PREDEF_H = 1;

const int __STDC_IEC_559__ = 1;

const int __STDC_IEC_60559_BFP__ = 201404;

const int __STDC_IEC_559_COMPLEX__ = 1;

const int __STDC_IEC_60559_COMPLEX__ = 201404;

const int __STDC_ISO_10646__ = 201706;

const int __GNU_LIBRARY__ = 6;

const int __GLIBC__ = 2;

const int __GLIBC_MINOR__ = 35;

const int _SYS_CDEFS_H = 1;

const int __THROW = 1;

const int __THROWNL = 1;

const int __glibc_c99_flexarr_available = 1;

const int __LDOUBLE_REDIRECTS_TO_FLOAT128_ABI = 0;

const int __HAVE_GENERIC_SELECTION = 0;

const int __GLIBC_USE_LIB_EXT2 = 1;

const int __GLIBC_USE_IEC_60559_BFP_EXT = 1;

const int __GLIBC_USE_IEC_60559_BFP_EXT_C2X = 1;

const int __GLIBC_USE_IEC_60559_EXT = 1;

const int __GLIBC_USE_IEC_60559_FUNCS_EXT = 1;

const int __GLIBC_USE_IEC_60559_FUNCS_EXT_C2X = 1;

const int __GLIBC_USE_IEC_60559_TYPES_EXT = 1;

const int _BITS_TYPES_H = 1;

const int _BITS_TYPESIZES_H = 1;

const int __OFF_T_MATCHES_OFF64_T = 1;

const int __INO_T_MATCHES_INO64_T = 1;

const int __RLIM_T_MATCHES_RLIM64_T = 1;

const int __STATFS_MATCHES_STATFS64 = 1;

const int __KERNEL_OLD_TIMEVAL_MATCHES_TIMEVAL64 = 1;

const int __FD_SETSIZE = 1024;

const int _BITS_TIME64_H = 1;

const int _BITS_WCHAR_H = 1;

const int __WCHAR_MAX = 2147483647;

const int __WCHAR_MIN = -2147483648;

const int _BITS_STDINT_INTN_H = 1;

const int _BITS_STDINT_UINTN_H = 1;

const int INT8_MIN = -128;

const int INT16_MIN = -32768;

const int INT32_MIN = -2147483648;

const int INT64_MIN = -9223372036854775808;

const int INT8_MAX = 127;

const int INT16_MAX = 32767;

const int INT32_MAX = 2147483647;

const int INT64_MAX = 9223372036854775807;

const int UINT8_MAX = 255;

const int UINT16_MAX = 65535;

const int UINT32_MAX = 4294967295;

const int UINT64_MAX = -1;

const int INT_LEAST8_MIN = -128;

const int INT_LEAST16_MIN = -32768;

const int INT_LEAST32_MIN = -2147483648;

const int INT_LEAST64_MIN = -9223372036854775808;

const int INT_LEAST8_MAX = 127;

const int INT_LEAST16_MAX = 32767;

const int INT_LEAST32_MAX = 2147483647;

const int INT_LEAST64_MAX = 9223372036854775807;

const int UINT_LEAST8_MAX = 255;

const int UINT_LEAST16_MAX = 65535;

const int UINT_LEAST32_MAX = 4294967295;

const int UINT_LEAST64_MAX = -1;

const int INT_FAST8_MIN = -128;

const int INT_FAST16_MIN = -9223372036854775808;

const int INT_FAST32_MIN = -9223372036854775808;

const int INT_FAST64_MIN = -9223372036854775808;

const int INT_FAST8_MAX = 127;

const int INT_FAST16_MAX = 9223372036854775807;

const int INT_FAST32_MAX = 9223372036854775807;

const int INT_FAST64_MAX = 9223372036854775807;

const int UINT_FAST8_MAX = 255;

const int UINT_FAST16_MAX = -1;

const int UINT_FAST32_MAX = -1;

const int UINT_FAST64_MAX = -1;

const int INTPTR_MIN = -9223372036854775808;

const int INTPTR_MAX = 9223372036854775807;

const int UINTPTR_MAX = -1;

const int INTMAX_MIN = -9223372036854775808;

const int INTMAX_MAX = 9223372036854775807;

const int UINTMAX_MAX = -1;

const int PTRDIFF_MIN = -9223372036854775808;

const int PTRDIFF_MAX = 9223372036854775807;

const int SIG_ATOMIC_MIN = -2147483648;

const int SIG_ATOMIC_MAX = 2147483647;

const int SIZE_MAX = -1;

const int WCHAR_MIN = -2147483648;

const int WCHAR_MAX = 2147483647;

const int WINT_MIN = 0;

const int WINT_MAX = 4294967295;

const int DISCORD_REPLY_NO = 0;

const int DISCORD_REPLY_YES = 1;

const int DISCORD_REPLY_IGNORE = 2;
