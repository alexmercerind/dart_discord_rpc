#include "include/discord_rpc/discord_register.h"
#include "include/discord_rpc/discord_rpc.h"

#include "events.hpp"

#ifdef __cplusplus
extern "C" {
#endif
#ifdef _WIN32
#define DLLEXPORT __declspec(dllexport)
#else
#define DLLEXPORT
#endif

/* The primary purpose of this shared library is to handle async callbacks from
 * the client.
 * Because of current limitations in Dart FFI, we cannot call callbacks from
 * another thread (results in crash as of Dart FFI 1.1.0).
 * To deal with this, we send events through NativePorts, by explicitly
 * registering with `Discord_Initialize` within C itself.
 * Other functions are already exposed by the headers.
 */

/* The three arguments in this function correspond to `NativeApi.postCObject` &
 * `receiver.sendPort.nativePort` (of a ReceivePort). */
DLLEXPORT void DartInitialize(Dart_PostCObjectType dart_post_C_object,
                              Dart_Port callback_port) {
  g_dart_post_C_object = dart_post_C_object;
  g_callback_port = callback_port;
}

DLLEXPORT void DiscordRegister(const char* application_id,
                               const char* command) {
  Discord_Register(application_id, command);
};

DLLEXPORT void DiscordRegisterSteamGame(const char* application_id,
                                        const char* steam_id) {
  Discord_RegisterSteamGame(application_id, steam_id);
};

DLLEXPORT void DiscordInitialize(const char* application_id, int auto_register,
                                 const char* optional_steam_id) {
  struct DiscordEventHandlers event_handlers;
  event_handlers.ready = Ready;
  event_handlers.disconnected = Disconnected;
  event_handlers.errored = Errored;
  event_handlers.joinGame = JoinGame;
  event_handlers.spectateGame = SpectateGame;
  event_handlers.joinRequest = JoinRequest;
  Discord_Initialize(application_id, &event_handlers, auto_register,
                     optional_steam_id);
  Discord_RunCallbacks();
}

DLLEXPORT void DiscordShutdown() { Discord_Shutdown(); };

DLLEXPORT void DiscordUpdatePresence(
    const char* state, const char* details, int64_t start_time_stamp,
    int64_t end_time_stamp, const char* large_image_key,
    const char* large_image_text, const char* small_image_key,
    const char* small_image_text, const char* party_id, int party_size,
    int party_max, const char* match_secret, const char* join_secret,
    const char* spectate_secret, int8_t instance) {
  struct DiscordRichPresence rich_presence;
  rich_presence.state = state;
  rich_presence.details = details;
  rich_presence.startTimestamp = start_time_stamp;
  rich_presence.endTimestamp = end_time_stamp;
  rich_presence.largeImageKey = large_image_key;
  rich_presence.largeImageText = large_image_text;
  rich_presence.smallImageKey = small_image_key;
  rich_presence.smallImageText = small_image_text;
  rich_presence.partyId = party_id;
  rich_presence.partySize = party_size;
  rich_presence.partyMax = party_max;
  rich_presence.matchSecret = match_secret;
  rich_presence.joinSecret = join_secret;
  rich_presence.instance = instance;
  Discord_UpdatePresence(&rich_presence);
}

DLLEXPORT void DiscordClearPresence() { Discord_ClearPresence(); };

DLLEXPORT void DiscordRespond(const char* user_id, int reply) {
  Discord_Respond(user_id, reply);
};

#ifdef __cplusplus
}
#endif