auth_token = "Test123456576"
host = "192.168.178.3"
port = 12345


local socket    = require("socket")
local mime      = require("mime")
local ip        = assert(socket.dns.toip(host))
local tcp       = assert(socket.tcp())
local connected = 0;

function send_to_socket ( tag, text )
	if connected == 1 then
		local text_b64 = (mime.b64(text))
		tcp:send(tag .. ":" .. text_b64 .. "\n")
	end
end

-- called when game inits
-- sets the module name
function et_InitGame( levelTime, randomSeed, restart )
	et.RegisterModname( "PS IETA" .. et.FindSelf() )
	assert(tcp:connect(ip, port))
	connected=1
	assert(tcp:settimeout(2, "b"))

	send_to_socket("Auth", auth_token)

	if tcp:receive("*l")  then
		print "Auth Successful"
		connected=1
	else 
		print "Auth failed"
		connected=0
		tcp:close()
	end
	
	if connected then
		if restart == 1 then
			send_to_socket("InitGame", "MapRestart")
		else
			send_to_socket("InitGame", "NoMapRestart")
		end
	end
	
end

function et_ShutdownGame( restart ) 
	if restart == 1 then
		send_to_socket("ShutdownGame", "MapRestart")
	else
		send_to_socket("ShutdownGame", "NoMapRestart")
	end
	tcp:close()
end

-- runs for all printed text
function et_Print(text)
	send_to_socket("Print", text)
end
