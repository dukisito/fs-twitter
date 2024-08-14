/* - FILTERSCRIPT DE TWITTER BY DUKI

   - Username Discord: duki.dev 

   - Se necesita el Include y plugin Pawn.CMD

   - Repositorio: https://github.com/katursis/Pawn.CMD/releases/tag/3.4.0

   - Se necesita plugin e include sscanf

   - Repositorio: https://github.com/Y-Less/sscanf/releases/tag/v2.13.8
*/

#include <a_samp>
#include <Pawn.CMD>
#include <sscanf2>

// ---- VARIABLES ---- //

new 
	TwitterTiempo[MAX_PLAYERS]
;

// ---- CALLBACKS ---- //

forward ColdownTwitter(playerid);
public ColdownTwitter(playerid)
{
	TwitterTiempo[playerid] = 0;
	return 1;
}


// ---- COMANDOS ---- //

CMD:tw(playerid, params[])
{
	new texto[128], string[128], Nombre[MAX_PLAYER_NAME+1];
	GetPlayerName(playerid,Nombre,sizeof(Nombre));
	if (TwitterTiempo[playerid] == 1) return SendClientMessage(playerid,-1, "Solo puedes usar el canal de twitter cada 10 segundos");
	if (sscanf(params,"s[128]",texto)) return SendClientMessage(playerid,-1,"Escribe {00aeff}/tw {FFFFFF}<Texto>");
	format(string,128,"{00aeff}[#Twitter] - [@%s]: {FFFFFF}%s", Nombre, texto);
    TwitterTiempo[playerid] = 1;
	SetTimerEx("ColdownTwitter", 10000, false, "i", playerid);
	SendClientMessageToAll(-1, string);
	return 1;
}