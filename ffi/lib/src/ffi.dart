import 'dart:ffi';
import 'dart:isolate';
import 'package:dart_discord_rpc_ffi/src/typedefs.dart';

late DynamicLibrary dynamicLibrary;
ReceivePort receiver = ReceivePort();

abstract class DiscordRPCFFI {
  DiscordRPCInitializeDart initialize = dynamicLibrary.lookupFunction<
      DiscordRPCInitializeCXX,
      DiscordRPCInitializeDart>('DiscordRPCInitialize');

  static DiscordRPCRegisterDart register = dynamicLibrary.lookupFunction<
      DiscordRPCRegisterCXX, DiscordRPCRegisterDart>('DiscordRPCRegister');

  static DiscordRPCRegisterSteamGameDart registerSteamGame =
      dynamicLibrary.lookupFunction<DiscordRPCRegisterSteamGameCXX,
          DiscordRPCRegisterSteamGameDart>('DiscordRPCRegisterSteamGame');

  static DiscordRPCStartDart start =
      dynamicLibrary.lookupFunction<DiscordRPCStartCXX, DiscordRPCStartDart>(
          'DiscordRPCStart');

  static DiscordRPCShutDownDart shutDown = dynamicLibrary.lookupFunction<
      DiscordRPCShutDownCXX, DiscordRPCShutDownDart>('DiscordRPCShutdown');

  static DiscordRPCUpdatePresenceDart updatePresence =
      dynamicLibrary.lookupFunction<DiscordRPCUpdatePresenceCXX,
          DiscordRPCUpdatePresenceDart>('DiscordRPCUpdatePresence');

  static DiscordRPCClearPresenceDart clearPresence = dynamicLibrary
      .lookupFunction<DiscordRPCClearPresenceCXX, DiscordRPCClearPresenceDart>(
          'DiscordRPCClearPresence');

  static DiscordRPCRespondDart respond = dynamicLibrary.lookupFunction<
      DiscordRPCRespondCXX, DiscordRPCRespondDart>('DiscordRPCRespond');
}
