pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
    id: root

    PersistentProperties {
        id: persist
        property bool active: false
    }

    property bool active: persist.active

    property int temperature: root.active ? 4500 : 6000

    Process {
        id: toggleTemp
        command: ["hyprctl", "hyprsunset", "temperature", root.temperature]
    }

    function toggleNightLight() {
        persist.active = !persist.active;
        toggleTemp.exec(["hyprctl", "hyprsunset", "temperature", root.temperature.toString()]);
    }
}
