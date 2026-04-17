pragma Singleton

import QtQuick
import Quickshell

Singleton {
    id: root
    // Components
    property var bar
    property var controlPanel
    property var lockscreen

    // Settings
    property bool dnd: false
}
