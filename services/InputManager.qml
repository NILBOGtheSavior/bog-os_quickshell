pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Wayland
import qs.config

Singleton {
    function grabKeyboardFocus() {
        Global.bar.WlrLayershell.keyboardFocus = WlrKeyboardFocus.OnDemand;
    }

    function releaseKeyboardFocus() {
        Global.bar.WlrLayershell.keyboardFocus = WlrKeyboardFocus.None;
    }
}
