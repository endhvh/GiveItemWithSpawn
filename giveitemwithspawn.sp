#include <sourcemod>
#include <sdktools>
#include <cstrike>
public Plugin myinfo = 
{
	name = "Spawn Armor/ssg /grenade ",
	author = "c",
	description = "",
	version = "",
	url = ""
};

public void OnPluginStart()
{
	HookEvent("player_spawn", Event_Spawn, EventHookMode_Post);
}

public Action Event_Spawn(Event gEventHook, const char[] gEventName, bool iDontBroadcast)
{
		new client = GetClientOfUserId(GetEventInt(gEventHook, "userid"));
        CreateTimer(1.0, ssg08, client);
}

public Action:ssg08(Handle:timer, any:client)
{

	if (IsClientConnected(client) && IsPlayerAlive(client))
	{
		SetEntProp(client, Prop_Send, "m_ArmorValue", 100);
		SetEntProp(client, Prop_Send, "m_bHasHelmet", 1);
		GivePlayerItem(client, "weapon_ssg08");             //给予鸟狙./手雷组合    
        GivePlayerItem(client, "weapon_hegrenade");
        GivePlayerItem(client, "weapon_smokegrenade");
        GivePlayerItem(client, "weapon_incgrenade");

}



}