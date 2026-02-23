pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
    id: root

    property bool hasBacklight: false
    property int level
    property int max

    Process {
        id: checkBacklight
        running: true
        command: ["brightnessctl", "--class=backlight", "--list"]
        stdout: StdioCollector {
            onStreamFinished: root.hasBacklight = this.text != ""
        }
    }

    Process {
        command: ["brightnessctl", "max"]
        running: true
        stdout: SplitParser {
            onRead: data => root.max = parseInt(data)
        }
    }
    Process {
        command: ["brightnessctl", "get"]
        running: true
        stdout: SplitParser {
            onRead: data => root.level = parseInt(data)
        }
    }
    Process {
        id: setBrightnessProcess
        command: ["brightnessctl", "set", root.level]
    }

    function setPercentage(value) {
        root.level = value * root.max;
        setBrightnessProcess.running = true;
    }
    function getPercentage() {
        return root.level / root.max;
    }

    function getIcon() {
        switch (Math.floor(getPercentage() * 14)) {
        case 0:
            return "";
        case 1:
            return "";
        case 2:
            return "";
        case 3:
            return "";
        case 4:
            return "";
        case 5:
            return "";
        case 6:
            return "";
        case 7:
            return "";
        case 8:
            return "";
        case 9:
            return "";
        case 10:
            return "";
        case 11:
            return "";
        case 12:
            return "";
        case 13:
            return "";
        case 14:
            return "";
        }
    }
}
