pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
    id: root

    property string provider: "nordvpn"
    property bool connected: false

    Process {
        id: connection
        running: false
    }

    Process {
        id: check
        running: false
        stdout: StdioCollector {
            onStreamFinished: {
                var output = this.text.trim();
                var lines = output.split('\n');
                for (var i = 0; i < lines.length; i++) {
                    var line = lines[i];
                    if (line.startsWith("Status:")) {
                        var status = line.split(":")[1].trim().toLowerCase();
                        switch (status) {
                        case "disconnected":
                            root.connected = false;
                            break;
                        case "connected":
                            root.connected = true;
                            break;
                        }
                    }
                }
            }
        }
    }

    function checkStatus() {
        check.command = commands[provider].status;
        check.running = true;
    }
    function toggleVpn() {
        if (root.connected) {
            connection.command = commands[provider].disconnect;
            connection.running = true;
            connected = false;
        } else {
            connection.command = commands[provider].connect;
            connection.running = true;
            connected = true;
        }
    }

    readonly property var commands: ({
            "nordvpn": {
                connect: ["nordvpn", "connect"],
                disconnect: ["nordvpn", "disconnect"],
                status: ["nordvpn", "status"]
            }
        })
}
