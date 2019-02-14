if not file.Exists("letters_system", "DATA") then file.CreateDir( "letters_system" ) end

function mailboxes.NewLetter(sender,receiver, message, money, anonymous_letter )
	local tbl = {}
	tbl.sender = sender:SteamID()
	if anonymous_letter then
		tbl.sendername = "???"
	else
		tbl.sendername = sender:Nick()
	end
	tbl.receiver = receiver
	tbl.message = message
	tbl.money = money
	tbl.UID = "CRC" .. tbl.receiver .. util.CRC(message) ..  util.CRC(sender:SteamID()) .. tostring(os.time())
	mailboxes.mails[tbl.UID] = tbl;
	mailboxes.SaveLetters()
	for k, v in pairs(player.GetAll()) do
		if v:SteamID() == tbl.receiver then 
			mailboxes.SentNetLetter(v, tbl.UID)
			break
		end
	end
end

function mailboxes.OpenedLetter(client, UID)
	if not mailboxes.mails[UID] then return end
	if client:SteamID() !=  mailboxes.mails[UID].receiver then ErrorNoHalt(Format("Player : %s with SteamID  : %s tried to remove a mail he does not own")) return end
	if mailboxes.mails[UID].money > 0 then client:addMoney(mailboxes.mails[UID].money) end
	mailboxes.mails[UID] = nil;
	mailboxes.SaveLetters()
end

hook.Add("PlayerInitialSpawn", "Spawn send messages",mailboxes.SentNetLetters )

function mailboxes.SaveLetters()
	file.Write("letters_system/letters.txt",util.TableToJSON(mailboxes.mails))
end

function mailboxes.RestoreLetters()
	if not file.Exists("letters_system/letters.txt","DATA") then file.Write("letters_system/letters.txt",util.TableToJSON({})) return end
	local filetxt = file.Read("letters_system/letters.txt", "DATA")
	mailboxes.mails = util.JSONToTable(filetxt)
end

net.Receive("permapro-openedletter",function(len, ply)
	local UID = net.ReadString()
	mailboxes.OpenedLetter(ply, UID)
end)

function mailboxes.SentNetLetters(ply)
	local tbl = {}
	for k, v in pairs(mailboxes.mails) do
		if ply:SteamID() == v.receiver then
			tbl[k] = v
		end
	end
	net.Start("permapro-lettersenttableplayer")
	net.WriteTable(tbl)
	net.Send(ply)
end
	
function mailboxes.SentNetLetter(ply, UID)
	local tbl = mailboxes.mails[UID]
	net.Start("permapro-lettersenttableplayersingle")
	net.WriteString(UID)
	net.WriteTable(tbl)
	net.Send(ply)
end

mailboxes.RestoreLetters()

