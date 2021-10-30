import 'dart:io';
import 'dart:ffi';
import 'package:dart_discord_rpc_ffi/dart_discord_rpc_ffi.dart';

void main(List<String> args) {
  var discord = DiscordClient(
    dynamicLibrary: DynamicLibrary.open(
      '/absolute/path/to/libdiscord-rpc.so',
    ),
    applicationId: 877853131025809438,
  );
  discord.start();
  discord.updatePresence(
    DiscordPresence(
      state: 'Discord Rich Presence from Dart. 🎯',
      details: 'github.com/alexmercerind/dart_discord_rpc',
      startTimeStamp: DateTime.now().millisecondsSinceEpoch,
      largeImageKey: 'large_image',
      largeImageText: 'This text describes the large image.',
      smallImageKey: 'small_image',
      smallImageText: 'This text describes the small image.',
    ),
  );
  stdin.readLineSync();
}
