pragma Singleton

import QtQuick
import Quickshell

Singleton {
    readonly property font bogos: ({
            family: "BogOS",
            pixelSize: 18
        })

    readonly property font small: ({
            family: "BlexMono Nerd Font",
            pixelSize: 12
        })

    readonly property font medium: ({
            family: "BlexMono Nerd Font",
            pixelSize: 15
        })

    readonly property font large: ({
            family: "BlexMono Nerd Font",
            pixelSize: 18
        })
}
