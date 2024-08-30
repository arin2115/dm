#pragma once

#include <string>

const std::string& GetDiscordAPI();
const std::string& GetDiscordCDN();

#define DISCORD_API_VERSION "9"
#define OFFICIAL_DISCORD_API "https://alts.boo/api/v" DISCORD_API_VERSION "/"
#define OFFICIAL_DISCORD_CDN "https://cdn.alts.boo/"
