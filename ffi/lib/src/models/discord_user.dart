class DiscordUser {
  /// ID of the user.
  final String userId;

  /// User's username.
  final String username;

  /// Discriminator.
  final String discriminator;

  /// Avatar.
  final String avatar;
  DiscordUser(this.userId, this.username, this.discriminator, this.avatar);
}
