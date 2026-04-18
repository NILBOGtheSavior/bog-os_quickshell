import QtQuick
import QtQuick.Layouts
import Quickshell.Io
import qs.config
import qs.ui

RowLayout {
    Process {
        id: process
        running: false
    }
    Button {
        Layout.fillWidth: true
        font: Fonts.xlarge
        text: "󰐥"
        onClicked: {
            process.command = ["systemctl", "poweroff"];
            process.running = true;
        }
    }
    Button {
        Layout.fillWidth: true
        font: Fonts.xlarge
        text: ""
        onClicked: {
            process.command = ["systemctl", "reboot"];
            process.running = true;
        }
    }
    Button {
        Layout.fillWidth: true
        font: Fonts.xlarge
        text: "󰍷"
        onClicked: {
            process.command = ["systemctl", "suspend"];
            process.running = true;
        }
    }
}
