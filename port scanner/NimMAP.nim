import scanner, os, strutils

let numParams = paramCount()

proc usage() =
  echo "Usage: ./NimMAP <IP> <Start Port> <End Port> "

proc main() = 
  if numParams > 0:
    var targetIP: string = paramStr(1)
    let startPort = paramStr(2)
    let endPort = paramStr(3)

    let startPort_INT = parseInt(startPort)
    let endPort_INT = parseInt(endPort)


    if startPort_INT > endPort_INT:
      echo "[!] The start port can not be higher than the end port"
      echo "" 
      usage()
    else:
      echo "" 
      echo "Nim Port Scanner"
      echo "================"
      for PNUM in startPort_INT .. endPort_INT:
        portScan(PNUM, targetIP)
  else:
    write(stdout, "Target IP: ")
    let targetIP = readline(stdin)
    write(stdout, "Start Port: ")
    let startPort = readline(stdin)
    write(stdout, "END Port: ")
    let endPort = readLine(stdin)

    let startPort_INT = parseInt(startPort)
    let endPort_INT = parseInt(endPort)
    echo ""
    echo "Nim Port Scanner"
    echo "================"
    for PNUM in startPort_INT .. endPort_INT:
      portScan(PNUM, targetIP)

main()