import QtQuick
import Quickshell.Hyprland
import qs.ui

Label {
    property var activeWindow: Hyprland.activeToplevel
    text: activeWindow ? activeWindow.lastIpcObject.class : "BogOS"

    Connections {
        target: Hyprland
        function onActiveToplevelChanged() {
            Hyprland.refreshToplevels();
        }
    }
}
