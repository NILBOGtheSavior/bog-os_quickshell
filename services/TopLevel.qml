pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Wayland

Singleton {
    property var activeWindow: ToplevelManager.activeToplevel
    readonly property var windows: ToplevelManager.toplevels

    function focusWindow(window) {
        if (!window)
            return;

        if (window.activated) {
            window.minimized = true;
        } else {
            window.minimized = false;
            window.activate();
        }
    }
}
