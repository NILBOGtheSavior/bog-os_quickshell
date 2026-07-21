pragma Singleton

import QtQuick
import Quickshell

Singleton {
    readonly property font small: ({
            family: "Monofur Nerd Font",
            pixelSize: 12
        })

    readonly property font medium: ({
            family: "Monofur Nerd Font",
            pixelSize: 16
        })

    readonly property font medium_bold: ({
            family: "Monofur Nerd Font",
            pixelSize: 16,
            weight: 800
        })

    readonly property font large: ({
            family: "Monofur Nerd Font",
            pixelSize: 18
        })

    readonly property font xlarge: ({
            family: "Monofur Nerd Font",
            pixelSize: 24
        })
}
