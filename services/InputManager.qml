pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Wayland
import qs.config

Singleton {
    function grabKeyboardFocus() {
        console.log("Focus grabbed");
        Global.bar.WlrLayershell.keyboardFocus = WlrKeyboardFocus.OnDemand;
    }

    function releaseKeyboardFocus() {
        console.log("Focus released");
        Global.bar.WlrLayershell.keyboardFocus = WlrKeyboardFocus.None;
    }
}
