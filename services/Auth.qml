pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Services.Pam
import Quickshell.Hyprland
import qs.config

Singleton {
    id: root

    readonly property alias pam: pam
    property bool authFailed: false

    PamContext {
        id: pam
        config: "quickshell"

        onCompleted: result => {
            if (result === PamResult.Success) {
                Global.lockscreen.locked = false;
                root.authFailed = false;
            } else {
                root.authFailed = true;
                pam.start();
            }
        }
    }
}
