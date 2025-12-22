pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
    id: root

    property bool wifiEnabled: false

    Process {
        id: getNetworks

        running: true
        command: ["nmcli", "-g", "ACTIVE,SIGNAL,SSID,SECURITY", "d", "w"]
        stdout: StdioCollector {
            onStreamFinished: {
                console.log(text);
            }
        }
    }

    component AccessPoint: QtObject {
        required property var ap
        readonly property string ssid: ap.ssid
        readonly property int strength: ap.strength
        readonly property bool active: ap.active
        readonly property string security: ap.security
        readonly property bool isSecure: security.length > 0
    }
}
