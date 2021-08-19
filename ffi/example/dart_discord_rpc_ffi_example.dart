import 'dart:ffi';
import 'dart:io';
import 'package:dart_discord_rpc_ffi/src/ffi.dart';
import 'package:dart_discord_rpc_ffi/dart_discord_rpc_ffi.dart';

void main(List<String> args) {
  dynamicLibrary = DynamicLibrary.open(args.first);
  var discord = DiscordRPC(
    applicationId: '877853131025809438',
  );
  discord.start(autoRegister: true);
  discord.updatePresence(DiscordPresence(
      state: 'Discord Rich Presence from Dart. 🎯',
      details: 'github.com/alexmercerind/dart_discord_rpc',
      startTimeStamp: DateTime.now().millisecondsSinceEpoch,
      endTimeStamp: 0,
      largeImageKey: 'large_image',
      largeImageText: 'This text describes the large image.',
      smallImageKey: 'small_image',
      smallImageText: 'This text describes the small image.',
      partyId: '',
      partySize: 0,
      partySizeMax: 0,
      matchSecret: '',
      joinSecret: '',
      spectateSecret: '',
      instance: 0));
  stdin.readLineSync();
}
