// System Menu

import QtQuick
import QtQuick.Layouts
import Quickshell
import qs.ui
import qs.config

PanelWindow {
    visible: false
    // height: 200
    implicitWidth: layout.implicitWidth * 2
    implicitHeight: layout.implicitHeight
    color: "transparent"

    margins.left: 5

    Container {
        anchors.fill: parent
        radius: 15
        ColumnLayout {
            id: layout
            anchors.fill: parent
            MenuOption {
                text: "   Info"
            }
            MenuOption {
                text: "󰤄   Suspend"
            }
            MenuOption {
                text: "   Lock"
            }
            MenuOption {
                text: "󰗽   Logout"
            }
            MenuOption {
                text: "   Restart"
            }
            MenuOption {
                text: "⏻   Shutdown"
            }
        }
    }
}
