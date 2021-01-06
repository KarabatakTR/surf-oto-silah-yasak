//////////////////////////////////////////
/*  Kaptain Phenix Jailbreak Sunucusu  */
/*    Discord : discord.gg/g5MBVbH    */
/*    İp Adresimiz: 185.198.75.21    */ 
//////////////////////////////////////


#include <sourcemod>
#include <cstrike> 
#include <sdktools>

////////////////////////////////////////

#pragma semicolon 1
#pragma newdecls required

////////////////////////////////////////

public Plugin myinfo =
{
	name = "[Karabatak] Surf Oto Silah Yasaklama",
	description = "Surf_ maplerinde oto silahi yasaklar.",
	author = "Karabatak || Discord: Karabatak#9521",
	version = "1.0",
	url = "https://steamcommunity.com/id/ozgur-karabatak  Discord: Karabatak#9521"
};


public void OnMapStart()
{
	char eklentiadi[512];
	char harita[PLATFORM_MAX_PATH];
	GetPluginFilename(INVALID_HANDLE, eklentiadi, sizeof(eklentiadi));
	GetCurrentMap(harita, sizeof(harita));
	if (StrContains(harita, "surf_", false) == -1)
	{
		ServerCommand("sm plugins unload %s", eklentiadi);
	}
}

public Action CS_OnBuyCommand(int client, const char[] chWeapon)
{
    if(StrEqual(chWeapon, "g3sg1") || StrEqual(chWeapon, "scar20") ||  StrEqual(chWeapon, "m249") || StrEqual(chWeapon, "negev")) 
	{ 
	    PrintHintText(client, "Dostum oto silah yasak."); 
	    return Plugin_Handled; 
	} 
    return Plugin_Continue;  
} 