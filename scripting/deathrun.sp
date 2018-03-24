#pragma semicolon 1
#include <sourcemod>
#include <sdktools>
#include <sdkhooks>
#include <cstrike>
#include <colors>

#undef REQUIRE_PLUGIN
#include <sourcebans>

#define SPECTOR_TEAM 0
#define CS_TEAM_SPEC 1
#define CS_TEAM_T 2
#define CS_TEAM_CT 3
//cvar list
Handle dr_active = INVALID_HANDLE;
Handle dr_fixfrags = INVALID_HANDLE;
Handle dr_respawn = INVALID_HANDLE;
Handle dr_fixgravity = INVALID_HANDLE;
Handle dr_scouts = INVALID_HANDLE;
Handle dr_scoutster = INVALID_HANDLE;
Handle dr_scoutsystem = INVALID_HANDLE;
Handle dr_autoban = INVALID_HANDLE;
Handle dr_banmessage = INVALID_HANDLE;
Handle dr_bantime = INVALID_HANDLE;
Handle dr_banmessagetimer = INVALID_HANDLE;
Handle dr_antisuicide = INVALID_HANDLE;
Handle dr_norestart = INVALID_HANDLE;
Handle dr_chooseter = INVALID_HANDLE;
Handle dr_numberofters = INVALID_HANDLE;
Handle dr_secondter = INVALID_HANDLE; 
Handle dr_SpamTime = INVALID_HANDLE; 
Handle dr_awpmod = INVALID_HANDLE;
Handle dr_blockpickup = INVALID_HANDLE;
Handle dr_forceroundend = INVALID_HANDLE;
Handle dr_spectate = INVALID_HANDLE;
Handle dr_autoforce = INVALID_HANDLE;

#define DMG_NERVEGA   "1.0 DEV"

#pragma newdecls required

public Plugin myinfo =
{
    "name" = "[CS:S/CS:GO] Deathrun";
    "author" = "valerun";
    "version" = "DR_VERSION";
    "url" = "http://online-wars.ru";
}

public void onPluginStart()
{
   dr_active = CreateConar("dr_enable", "1", "Enable/Disable Deathrun Manager?");
   HookEvent("round_start", Event_RoundStart);
}
public void 