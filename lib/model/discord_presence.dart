class DiscordPresence {
  final String? state;

  final String? details;

  final int? startTimeStamp;

  final int? endTimeStamp;

  final String? largeImageKey;

  final String? largeImageText;

  final String? smallImageKey;

  final String? smallImageText;

  final String? partyId;

  final int? partySize;

  final int? partySizeMax;

  final String? matchSecret;

  final String? joinSecret;

  final String? spectateSecret;

  final int? instance;

  final String? button1Label;
  final String? button1Url;
  final String? button2Label;
  final String? button2Url;

  DiscordPresence({
    this.state,
    this.details,
    this.startTimeStamp,
    this.endTimeStamp,
    this.largeImageKey,
    this.largeImageText,
    this.smallImageKey,
    this.smallImageText,
    this.partyId,
    this.partySize,
    this.partySizeMax,
    this.matchSecret,
    this.joinSecret,
    this.spectateSecret,
    this.instance,
    this.button1Label,
    this.button1Url,
    this.button2Label,
    this.button2Url,
  });
}
