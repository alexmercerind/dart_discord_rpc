import 'package:flutter/material.dart';
import 'package:dart_discord_rpc/dart_discord_rpc.dart';

void main() {
  DiscordRPC.initialize();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final rpc = DiscordRPC(applicationId: '877853131025809438');

  @override
  void initState() {
    super.initState();
    rpc.start(autoRegister: true);
    rpc.updatePresence(
      DiscordPresence(
        state: 'dart_rpc_rpc',
        details: 'github.com/alexmercerind',
        startTimeStamp: DateTime.now().millisecondsSinceEpoch,
        largeImageKey: 'large_image',
        largeImageText: 'This text describes the large image.',
        smallImageKey: 'small_image',
        smallImageText: 'This text describes the small image.',
        button1Label: 'GitHub',
        button1Url: 'https://github.com/alexmercerind',
        button2Label: 'Google',
        button2Url: 'https://www.google.com',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('dart_rpc_rpc'),
        ),
        body: Center(
          child: Text('Open Discord to see the plugin working.'),
        ),
      ),
    );
  }
}
