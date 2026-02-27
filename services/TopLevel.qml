pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Hyprland

Singleton {
    property var activeWindow: Hyprland.activeToplevel
    readonly property var windows: Hyprland.toplevels

    Connections {
        target: Hyprland
        function onActiveToplevelChanged() {
            Hyprland.refreshToplevels();
        }
    }

    function focusWindow(window) {
        Hyprland.dispatch("focuswindow address:0x" + window.address);
    }

    function closeWindow(window) {
        Hyprland.dispatch("closewindow address:0x" + window.address);
    }
}
