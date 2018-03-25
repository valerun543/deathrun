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

#define DR_VERSION   "1.0 DEV"

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
    LoadTranslations("deathrun.phrases");

   dr_active = CreateConar("dr_enable", "1", "Enable/Disable Deathrun Manager?");
   HookEvent("round_start", Event_RoundStart);

   	HookEventEx("player_death", DR_Action_Death, EventHookMode_Pre);
	HookEventEx("round_end", DR_Action_RoundEnd, EventHookMode);
	HookEventEx("round_start", DR_Action_RoundStart, EventHookMode);
	HookEvent("player_spawn", DR_Action_Spawn, EventHookMode);
	HookEvent("player_disconnect", DR_Action_Disconnect, EventHookMode_Pre);
	HookEvent("player_team", DR_BlockTeamMessage, EventHookMode_Pre);
	HookEvent("player_jump", DR_PlayerJump);

    RegConsoleCmd("jointeam", DR_Player_JoinTeam);
	RegConsoleCmd("spectate", DR_Player_Spectate);
	RegConsoleCmd("kill", DR_BlockSuicide);
    RegConsoleCmd("killserver", DR_BlockSuicide);
	RegConsoleCmd("joinclass", DR_BlockSuicide);
	RegConsoleCmd("explode", DR_BlockSuicide);
	RegConsoleCmd("say", DR_Say_Commands);
	RegConsoleCmd("say_team", DR_Say_Commands);
}
