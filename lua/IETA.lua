local socket = require("socket")
local mime   = require("mime")
local ip   = assert(socket.dns.toip("localhost"))
local tcp  = assert(socket.tcp())
local port = 12345

assert(tcp:connect(ip, port))
assert(tcp:settimeout(10, "b"))

function send_to_socket ( text )
	local text_b64 = mime.unb64
	tcp:send(text)
end

-- called when game inits
-- sets the module name
function et_InitGame( levelTime, randomSeed, restart )
		et.RegisterModname( "PS IETA" .. et.FindSelf() )
		send_to_socket("Game Init!")
end

-- runs for all printed text
function et_Print(text)
	send_to_socket(text)
end
