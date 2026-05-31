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
        Hyprland.dispatch(`hl.dsp.focus({ window = "address:0x${window.address}" })`);
    }

    function closeWindow(window) {
        Hyprland.dispatch(`hl.dsp.window.close({ window = "address:0x${window.address}" })`);
    }
}
