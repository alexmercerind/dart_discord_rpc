import 'package:dart_discord_rpc_ffi/src/models/discord_user.dart';

/// Describes an event from Discord Rich Presence.
class DiscordEvent {}

/// Event showing that Discord Rich Presence is ready.
class DiscordReady extends DiscordEvent {
  /// User.
  final DiscordUser user;

  DiscordReady(this.user);
}

class DiscordDisconnected extends DiscordEvent {
  /// Error code.
  final int errorCode;

  /// Error message.
  final String message;

  DiscordDisconnected(this.errorCode, this.message);
}

class DiscordErrored extends DiscordEvent {
  /// Error code.
  final int errorCode;

  /// Error message.
  final String message;

  DiscordErrored(this.errorCode, this.message);
}

class DiscordJoinGame extends DiscordEvent {
  /// Joining secret.
  final String joinSecret;

  DiscordJoinGame(this.joinSecret);
}

class DiscordSpectateGame extends DiscordEvent {
  /// Spectating secret.
  final String spectateSecret;

  DiscordSpectateGame(this.spectateSecret);
}

class DiscordJoinRequest extends DiscordEvent {
  /// User.
  final DiscordUser user;

  DiscordJoinRequest(this.user);
}
