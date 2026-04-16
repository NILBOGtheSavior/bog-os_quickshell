pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Hyprland
import qs.config

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
        onPressed: root.lockscreen.locked = true
    }
}
