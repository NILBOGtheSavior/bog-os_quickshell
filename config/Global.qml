pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io
import Quickshell.Hyprland

Singleton {
    id: root
    // Components
    property var bar
    property var controlPanel
    property var lockscreen

    // Settings
    property bool dnd: false

    GlobalShortcut {
        name: "lockscreen"
        description: "Lock the screen"
        onPressed: {
            const path = Quickshell.configDir + "/lockscreen.qml";
            Quickshell.execDetached(["quickshell", "-p", path]);
        }
    }
}
