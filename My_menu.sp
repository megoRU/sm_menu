#include <sourcemod>

public Plugin:myinfo = 
{
    name        = "My_menu",
    author      = "mego",
    description = "Server_menu",
    version     = "1.2",
    url         = "https://eternalserver.ru/bans"
}

new Handle: g_Eternal_Server;

public OnPluginStart()
{
    RegConsoleCmd("sm_menu", Command_OpenMenu_Eternal_Server);

    g_Eternal_Server = CreateMenu(Handler_Eternal_Server);
    SetMenuTitle(g_Eternal_Server, "Полезные ссылки")
    AddMenuItem(g_Eternal_Server, "1", "Ссылка на группу ВК")
    AddMenuItem(g_Eternal_Server, "2", "Ссылка на создателя")
    AddMenuItem(g_Eternal_Server, "3", "Действующий промокод")
}


public Action:Command_OpenMenu_Eternal_Server(client, argc)
{
    DisplayMenu(g_Eternal_Server, client, MENU_TIME_FOREVER);
    return Plugin_Handled;
}

public Handler_Eternal_Server(Handle:menu, MenuAction:action, client, slot)
{
    switch (action)
    {
        case MenuAction_Select:
        {
            decl String:info[64];
            GetMenuItem(menu, slot, info, sizeof(info));
            
            if (StrEqual(info, "1"))
            {
                new userid = GetClientUserId(client);
                
                ServerCommand("sm_psay #%d \"vk.com/eternalcsgo\"", userid);
            }
            else if (StrEqual(info, "2"))
            {
                new userid = GetClientUserId(client);
                
                ServerCommand("sm_psay #%d \"steamcommunity.com/id/megoRU\"", userid);
            }
            else if (StrEqual(info, "3"))
            {
                new userid = GetClientUserId(client);
                
                ServerCommand("sm_psay #%d \"Промокод: учеба | vk.com/eternalcsgo\"", userid);
            }
        }
    }
}