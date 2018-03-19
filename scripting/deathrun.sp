#pragma semicolon 1
#include <sourcemod>
#include <sdktools>
#include <sdkhooks>
#include <sourcebans>
#include <colors>

int dr_active;


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
   dr_active = CreateConar("dr_enable", "1", "Enable/Disable Deathrun Manager?")




}