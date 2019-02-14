houses = houses or {}
houses.list = houses.list or  {}
houses.debug = true -- enable or disable console messages, don't ask for support if you can't tell me how to reproduce a bug or if you don't have the debug message enabled
houses.rgb = Color(42,242,42) -- serverside debug messages colors
houses.rgbname =  Color(255,255,255,255) -- clientside house color ownername/housename
houses.rgbpanel =  Color(255,255,255,255)
houses.scanpropsdelay = 1
houses.scanexpiredrentalagreement = 1
-- ^^^^ lower -> takes less time between scan for bad props in properties, but eats more performance
-- actualy, almost no addon on scriptfodder is performance friendly, lot of un-optimized shit, i'm optimizing my addon, it should *not* analrape your server.





--[[  Not used anymore, i'm on a more complex render dystem       ]] --[[houses.UglyOptimizationsClients = true]] -- fps boost for drawing panels, they will not draw at certains angles, but if you stay close to them and turn the head , you'll see they will disappear
-- depending on the map, the number of addon you're using you can disable the optimization for better experience

houses.HeyItsMeOpenTheDoor = false -- make the player say( sound ) "Hey it's me open the door" when ringing the bell
houses.BuyhouseforHowmanydays = 3 -- rent how many days the houses you can rent -- 15 secs = 0.000173611 day

houses.sellratio = 0.9 -- from 0 to 1 , tell how many % of the house price you get back when selling it

--[[
**** If you don't know what you're doing, don't touch anything after this comment or in any other file
--]]

-- forced lang , supported : "EN", "RU", "FR", "SW", "DE", "CH", "ESP", "KO"
-- example : local lang = "RU"
local lang = "EN"
houses.lang = lang -- for russian text resize, just ignore it

if SERVER then
	if not game.IsDedicated() then Error("ONLY DEDICATED SERVER ARE SUPPORTED") return end -- no no no my friend scriptenforcer is not happy because you don't have static ip
	AddCSLuaFile()
	AddCSLuaFile( "houses_system/client/network.lua" )
	AddCSLuaFile( "houses_system/client/rendernames.lua" )
	AddCSLuaFile( "houses_system/client/3d2dvgui.lua" ) -- 3d vgui, modded by me
	AddCSLuaFile( "houses_system/client/dermabuddy.lua" ) -- derma popup
	AddCSLuaFile( "houses_system/ezlibs.lua")
	include("houses_system/ezlibs.lua" )
	--[[ vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv ]]
	include("houses_system/server/houses_list.lua") --  <------------------- where you add and create houses see the video there, https://www.youtube.com/watch?v=5-iauLbOWGM vars list may be un-updated 
	--[[ ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ ]]

	include("houses_system/server/houses.lua") -- houses functions with right system
	include("houses_system/server/save.lua") -- houses save (vars)
	include("houses_system/server/propsave.lua") -- prop saving system
	resource.AddWorkshop("614420214") -- icons and bell sound
	hook.Add("Think", "force registerperma", function()
	if errorReporter_registerAddon then
		errorReporter_registerAddon("5", "Permanent Properties", "76561198001451981")
		hook.Remove("Think", "force registerperma")
	end
end)
end




if CLIENT then
	if not lang then lang = "EN" end -- default is english
	include("houses_system/client/network.lua")
	include("houses_system/client/rendernames.lua")
	include("houses_system/client/dermabuddy.lua" )
	include("houses_system/ezlibs.lua" )
	if lang == "EN" then
		houses.rentalagreementmessage = "Your Rental agreement expires in %.2f days"
		houses.rentalagreementmessagedead = "Your Rental agreement has expired !"
		houses.ringbell = "Ring the bell"
		houses.rentfor = "Rent for %i days"
		houses.buyhouse = "Buy the house"
		houses.sellhouse = "Sell the house"
		houses.lockalldors = "Lock all doors"
		houses.unlockalldors = "Unlock all doors"
		houses.managebuddies = "Manage Buddies"
		houses.saveprops = "Save props"
		houses.transferrights = "Transfer rights"
		houses.titlerights = "So... you want to give the keys to someone else ?"
		houses.textrights = "Are you sure ? Once you have given the keys to someone else, you will lost the rights on the house .\nThe new owner will get your props and the current buddies list !"
		houses.buttond = "Give my house to\n ....................."
		houses.buttons = "Give my house to\n"
		houses.sellhousederma = "Ah man, that's a lot of money you have there ..."
		houses.sellhousedermatext = "Are you sure ? Do you really want to sell this house and get your money back ?\nAll the buddies and props of this property will be removed !"
		houses.selldermayes = "Yes, give me\nmy money back !"
		houses.selldermano = "Nope, not today"
		houses.buddiestitle = "Manage Buddy list"
		houses.buddiestitle2 = "Players connected on the server"
		houses.buddiestitle3 = "Players in your Buddy list"
		houses.buddiestitlego = "Send updated list"
	end
	if lang == "RU" then
		houses.rentalagreementmessage = "Ваш договор аренды истекает через %.2f дней "
		houses.rentalagreementmessagedead = "Ваш Договор аренды истек!"
		houses.ringbell = "Позвонить в дом"
		houses.rentfor = "Арендовать дом в течение %i дней"
		houses.buyhouse = "Купить дом"
		houses.sellhouse = "Продать дом"
		houses.lockalldors = "Закрыть все двери"
		houses.unlockalldors = "Открыть все дверей"
		houses.managebuddies = "Управ.совладельцами"
		houses.saveprops = "Сохранить пропы"
		houses.transferrights = "Передача права"
		houses.titlerights = "Итак ... Вы хотите, отдать ключи кому-то другому? (выберите его в списке)"
		houses.textrights = "Вы уверены ? После того как вы отдадите ключи кому-то другому, вы потеряете свои права на дом.\nНовый владелец получит свой реквизит и текущий список совладелецов!"
		houses.buttond = "Отдать дом, Выбирите кому вы бы хотели отдать свой дом \n ....................."
		houses.buttons = "Отдать дом, Выбирите кому вы бы хотели отдать свой дом\n"
		houses.sellhousederma = "Вау чувак, У тебя таак много денег ..."
		houses.sellhousedermatext = "Вы уверены ? Вы действительно хотите, продать дом и получить свои деньги обратно?\nВсе совладельци и реквизиты этого дома будут удалены!"
		houses.selldermayes = "Да, дайте мне \nмои деньги назад!"
		houses.selldermano = "Нет, не сегодня"
		houses.buddiestitle = "Управление совладельцем список"
		houses.buddiestitle2 = "Выберите игрока, которого хотели добавить в свои пропы:"
		houses.buddiestitle3 = "Игроки которые могут двигать ваши пропы:"
		houses.buddiestitlego = "Все хорошо."
	end
	if lang == "FR" then
		houses.rentalagreementmessage = "Le contrat de location expire dans %.2f jours"
		houses.rentalagreementmessagedead = "Le contrat de location a expiré !"
		houses.ringbell = "Sonnette"
		houses.rentfor = "Louer pour %i jours"
		houses.buyhouse = "Acheter la maison"
		houses.sellhouse = "Vendre la maison"
		houses.lockalldors = "Verrouiller les portes"
		houses.unlockalldors = "Déverrouiller les portes"
		houses.managebuddies = "Liste d'amis"
		houses.saveprops = "Sauvegarder props"
		houses.transferrights = "Donner les droits"
		houses.titlerights = "Alors... tu veux laisser tes clés à quelqu'un d'autre ?"
		houses.textrights = "Es-tu bien sûr ? Une fois tes clés données, tu perdra tes droits sur la maison .\nLe nouveau propriétaire aura tes props et ta liste de co-proprio !"
		houses.buttond = "Donner ma maison à\n ....................."
		houses.buttons = "Donner ma maison à\n"
		houses.sellhousederma = "Hé bein, ca en fait du fric ..."
		houses.sellhousedermatext = "Es-tu bien sûr ? Veux-tu vraiment la vendre et récupérer ton argent ?\nLa liste des co-proprio et tes props seront R.À.Z !"
		houses.selldermayes = "Oui ! rend moi\nmon argent !"
		houses.selldermano = "Non, pas aujourd'hui"
		houses.buddiestitle = "Gère ta liste de co-proprio"
		houses.buddiestitle2 = "Joueurs sur le serveur"
		houses.buddiestitle3 = "Joueurs dans la liste des co-proprio"
		houses.buddiestitlego = "Envoyer la liste"
	end
	if lang == "SW" then
		houses.rentalagreementmessage = "Din hyrning går ut om %.2f dagar"
		houses.rentalagreementmessagedead = "Din hyrning har gått ut !"
		houses.ringbell = "Ring klockan"
		houses.rentfor = "Hyr i %i dagar"
		houses.buyhouse = "Köp huset"
		houses.sellhouse = "Sälj huset"
		houses.lockalldors = "Lås alla dörrar"
		houses.unlockalldors = "Lås upp alla dörrar"
		houses.managebuddies = "Hantera vänner"
		houses.saveprops = "Spara inredning"
		houses.transferrights = "Transfer rights"
		houses.titlerights = "Så... du vill ge nycklarna till någon annan ?"
		houses.textrights = "Är du säker ? När du hgar gett nycklarna till någon annan, så kommer du förlora huset .\nDen nya ägaren kommer att få din inredning och din kompis lista and  !"
		houses.buttond = "Ge mitt hus till\n ....................."
		houses.buttons = "Ge mitt hus till\n"
		houses.sellhousederma = "Oj, det var mycket pengar du har där ..."
		houses.sellhousedermatext = "Är dun säker ? Vill du verkligen sälja huset och få dina pengar tillbaka ?\nAlla kompisar och inredning kommer att försvinna !"
		houses.selldermayes = "Ja, ge mig\nmina pengar tillbaka !"
		houses.selldermano = "Nej, inte i dag"
		houses.buddiestitle = "Hantera kompis lista"
		houses.buddiestitle2 = "Spelare anslutna till servern"
		houses.buddiestitle3 = "Spelare i din kompis lista"
		houses.buddiestitlego = "Skicka uppdaterad lista"
	end
	 if lang == "DE" then
		houses.rentalagreementmessage = "Dein Mietvertrag läuft in %.2f Tagen ab."
		houses.rentalagreementmessagedead = "Dein Mietvertrag ist abgelaufen!"
		houses.ringbell = "Klingeln"
		houses.rentfor = "Für %i Tage mieten"
		houses.buyhouse = "Grundstück kaufen"
		houses.sellhouse = "Grundstück verkaufen"
		houses.lockalldors = "Alle Türen verriegeln"
		houses.unlockalldors = "Alle Türen entriegeln"
		houses.managebuddies = "Freunde verwalten"
		houses.saveprops = "Props speichern"
		houses.transferrights = "Übertragungsrechte"
		houses.titlerights = "Nun.. du willst also deinen Schlüssel abgeben?"
		houses.textrights = "Bist du dir sicher? Einmal abgegeben haben diese dann volle Besitzrechte am Haus. \nDer neue Besitzer erhält außerdem deine Props und die Freundesliste!"
		houses.buttond = "Gebe mein Haus an\n ....................."
		houses.buttons = "Gebe mein Haus an\n"
		houses.sellhousederma = "Oh mann, das ist ein ganz schön großer Haufen an Geld den du da hast..."
		houses.sellhousedermatext = "Bist du sicher? Willst du wirklich dein Haus verkaufen?\nAlle Props und Freunde werden dadurch entfernt!"
		houses.selldermayes = "Ja, gib mir\nmein Geld zurück!"
		houses.selldermano = "Nope, nicht heute."
		houses.buddiestitle = "Freundesliste verwalten"
		houses.buddiestitle2 = "Spieler auf dem Server"
		houses.buddiestitle3 = "Spieler in der Freundesliste"
		houses.buddiestitlego = "Liste aktualisieren."
	end
	if lang == "CH" then
		houses.rentalagreementmessage = "你的租赁合同会在 %.2f 天后到期"
		houses.rentalagreementmessagedead = "你的租赁合同已经过期了 !"
		houses.ringbell = "响铃"
		houses.rentfor = "租赁 %i 天"
		houses.buyhouse = "买房子"
		houses.sellhouse = "卖房子"
		houses.lockalldors = "锁上所有的门"
		houses.unlockalldors = "解锁所有的门"
		houses.managebuddies = "管理兄弟"
		houses.saveprops = "保存物体"
		houses.transferrights = "转让"
		houses.titlerights = "所以说... 你希望把钥匙给别人 ?"
		houses.textrights = "你确定吗 ? 一旦你把钥匙给别人, 你将会失去它的所有权 .\n新的拥有者会获得你的物体和兄弟清单 !"
		houses.buttond = "把房子给\n ....................."
		houses.buttons = "把房子给\n"
		houses.sellhousederma = "嘿兄弟, 你有很多钱 ..."
		houses.sellhousedermatext = "你确定吗 ? 你真的想要卖掉这个房子吗 ?\n这个房子的所有物体和兄弟都会消失 !"
		houses.selldermayes = "是, 把我钱拿回来 !"
		houses.selldermano = "算了,至少不是今天"
		houses.buddiestitle = "管理布娃娃列表"
		houses.buddiestitle2 = "玩家连接到了这个服务器"
		houses.buddiestitle3 = "玩家在你的兄弟列表里"
		houses.buddiestitlego = "发送更新后的列表"
	end

	if lang == "ESP" then
		houses.rentalagreementmessage = "Su alquiler expira en %.2f dias"
		houses.rentalagreementmessagedead = "¡ Su alquiler ha expirado !"
		houses.ringbell = "Llamar al timbre"
		houses.rentfor = "Alquilar por %i dias"
		houses.buyhouse = "Comprar casa"
		houses.sellhouse = "Vender casa"
		houses.lockalldors = "Bloquear puertas"
		houses.unlockalldors = "Desbloquear puertas"
		houses.managebuddies = "Gestionar amigos"
		houses.saveprops = "Guardar props"
		houses.transferrights = "Permisos"
		houses.titlerights = "¨Así que ¿Quieres darle las llaves de casa a alguien más?"
		houses.textrights = "¿Estás seguro? Una vez des las llaves a otra persona, se pierde los derechos sobre la casa .\nEl nuevo dueño tendrá sus permisos y su lista de amigos !"
		houses.buttond = "Dar a mi casa\n ....................."
		houses.buttons = "Dar a mi casa\n"
		houses.sellhousederma = "Ah hombre, eso es un monton de dinero..."
		houses.sellhousedermatext = "¿Estás seguro? ¿De verdad quieres vender la casa y recuperar tu dinero?\nTodos los props y permisos serán borrados !"
		houses.selldermayes = "Si, dame\nmi dinero de vuelta!"
		houses.selldermano = "No, hoy no"
		houses.buddiestitle = "Administrar lista de amigos"
		houses.buddiestitle2 = "Jugadores conectado al servidor"
		houses.buddiestitle3 = "Jugadores en tu lista de amigos"
		houses.buddiestitlego = "Enviar lista actualizada"
	end


	--                    ~~The glorious land of Skyrim mods~~
	--       ~~~the mysterious naver cafe forum where only Koreans can get~~~
	if lang == "KO" then
		houses.rentalagreementmessage = "임대 계약은 %.2f 일 후에 만료됩니다"
		houses.rentalagreementmessagedead = "임대 계약이 만료되었습니다!"
		houses.ringbell = "종 울리기"
		houses.rentfor = "%i 일 동안 임대"
		houses.buyhouse = "집 구입"
		houses.sellhouse = "집 판매"
		houses.lockalldors = "모든 문 잠그기"
		houses.unlockalldors = "모든 문 잠금 해제"
		houses.managebuddies = "친구 관리"
		houses.saveprops = "프롭 저장"
		houses.transferrights = "권리양도"
		houses.titlerights = "그래서.. 다른 사람에게 열쇠를 주고 싶습니까?"
		houses.textrights = "확실합니까? 일단 다른 사람에게 열쇠를 주면 집에 대한 권리를 잃을 것입니다.\n새 주인이 프롭과 현재 친구 목록을 얻을 것입니다!"
		houses.buttond = "다음에게 내 집 주기\n....................."
		houses.buttons = "다음에게 내 집 주기\n"
		houses.sellhousederma = "아, 그건 당신이 가진 돈입니다..."
		houses.sellhousedermatext = "확실합니까? 이 집을 팔고 돈을 돌려 받고 싶습니까?\n이 집의 모든 친구와 프롭이 제거됩니다!"
		houses.selldermayes = "예, 돈을 돌려주세요!"
		houses.selldermano = "아니오, 오늘은 아닙니다."
		houses.buddiestitle = "친구 목록 관리"
		houses.buddiestitle2 = "서버에 연결된 플레이어"
		houses.buddiestitle3 = "친구 목록에 있는 플레이어"
		houses.buddiestitlego = "업데이트 된 목록 보내기"
	end
end