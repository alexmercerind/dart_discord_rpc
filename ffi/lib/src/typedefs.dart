import 'dart:ffi';
import 'package:ffi/ffi.dart';

typedef DiscordRPCInitializeCXX = Void Function(
    Pointer<NativeFunction<Int8 Function(Int64, Pointer<Dart_CObject>)>>,
    Int64);
typedef DiscordRPCInitializeDart = void Function(
    Pointer<NativeFunction<Int8 Function(Int64, Pointer<Dart_CObject>)>>, int);

typedef DiscordRPCRegisterCXX = Void Function(Pointer<Utf8>, Pointer<Utf8>);
typedef DiscordRPCRegisterDart = void Function(Pointer<Utf8>, Pointer<Utf8>);

typedef DiscordRPCRegisterSteamGameCXX = Void Function(
    Pointer<Utf8>, Pointer<Utf8>);
typedef DiscordRPCRegisterSteamGameDart = void Function(
    Pointer<Utf8>, Pointer<Utf8>);

typedef DiscordRPCStartCXX = Void Function(Pointer<Utf8>, Int32, Pointer<Utf8>);
typedef DiscordRPCStartDart = void Function(Pointer<Utf8>, int, Pointer<Utf8>);

typedef DiscordRPCShutDownCXX = Void Function();
typedef DiscordRPCShutDownDart = void Function();

typedef DiscordRPCUpdatePresenceCXX = Void Function(
    Pointer<Utf8>,
    Pointer<Utf8>,
    Int64,
    Int64,
    Pointer<Utf8>,
    Pointer<Utf8>,
    Pointer<Utf8>,
    Pointer<Utf8>,
    Pointer<Utf8>,
    Int32,
    Int32,
    Pointer<Utf8>,
    Pointer<Utf8>,
    Pointer<Utf8>,
    Int8);
typedef DiscordRPCUpdatePresenceDart = void Function(
    Pointer<Utf8>,
    Pointer<Utf8>,
    int,
    int,
    Pointer<Utf8>,
    Pointer<Utf8>,
    Pointer<Utf8>,
    Pointer<Utf8>,
    Pointer<Utf8>,
    int,
    int,
    Pointer<Utf8>,
    Pointer<Utf8>,
    Pointer<Utf8>,
    int);

typedef DiscordRPCClearPresenceCXX = Void Function();
typedef DiscordRPCClearPresenceDart = void Function();

typedef DiscordRPCRespondCXX = Void Function(Pointer<Utf8>, Int32);
typedef DiscordRPCRespondDart = void Function(Pointer<Utf8>, int);
