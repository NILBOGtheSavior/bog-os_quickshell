pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Services.Pam
import qs.config

Singleton {

    property bool lock: false
    readonly property alias pam: pam

    PamContext {
        id: pam
        config: "quickshell"

        onCompleted: result => {
            if (result === PamResult.Success) {
                if (Global.lockscreen)
                    Global.lockscreen.locked = false;
            } else {
                pam.start();
            }
        }
    }
}
