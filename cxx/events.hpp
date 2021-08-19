#include <string>
#include <vector>
#include <memory>

#include "include/dart_api/dart_api_dl.h"

#ifdef __cplusplus
extern "C" {
#endif

typedef bool (*Dart_PostCObjectType)(Dart_Port port_id, Dart_CObject* message);
Dart_PostCObjectType g_dart_post_C_object;
Dart_Port g_callback_port;

void SendEvent(const std::vector<std::string>& values) {
  auto length = values.size();
  auto value_objects =
      std::unique_ptr<Dart_CObject[]>(new Dart_CObject[length]);
  auto value_object_refs =
      std::unique_ptr<Dart_CObject* []>(new Dart_CObject*[length]);
  for (int32_t i = 0; i < length; i++) {
    Dart_CObject* value_object = &value_objects[i];
    value_object->type = Dart_CObject_kString;
    value_object->value.as_string = const_cast<char*>(values[i].c_str());
    value_object_refs[i] = value_object;
  }
  Dart_CObject dart_object;
  dart_object.type = Dart_CObject_kArray;
  dart_object.value.as_array.length = length;
  dart_object.value.as_array.values = value_object_refs.get();
  g_dart_post_C_object(g_callback_port, &dart_object);
}

void Ready(const DiscordUser* user) {
  SendEvent({"ready", user->userId, user->username, user->discriminator,
             user->avatar});
}

void Disconnected(int error_code, const char* message) {
  SendEvent({"disconnected", std::to_string(error_code), message});
}

void Errored(int error_code, const char* message) {
  SendEvent({"errored", std::to_string(error_code), message});
}

void JoinGame(const char* join_secret) {
  SendEvent({"join_game", join_secret});
}

void SpectateGame(const char* spectate_secret) {
  SendEvent({"spectate_game", spectate_secret});
}

void JoinRequest(const DiscordUser* user) {
  SendEvent({"join_request", user->userId, user->username, user->discriminator,
             user->avatar});
}

#ifdef __cplusplus
}
#endif