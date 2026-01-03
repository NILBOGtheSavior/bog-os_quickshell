// System Menu

import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Hyprland
import qs.ui
import qs.config

PanelWindow {
    id: root
    visible: false
    implicitWidth: layout.implicitWidth * 2
    implicitHeight: layout.implicitHeight
    color: "transparent"

    anchors {
        top: true
        left: true
    }

    margins.left: 5

    Container {
        anchors.fill: parent
        implicitWidth: layout.implicitWidth * 2
        implicitHeight: layout.implicitHeight

        onFocusChanged: {
            console.log("Focus changed");
        }

        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
        }

        radius: 15
        ColumnLayout {
            id: layout
            anchors.fill: parent
            HoverHandler {
                id: pointer
                acceptedDevices: PointerDevice.AllDevices
                cursorShape: Qt.ArrowCursor

                onHoveredChanged: {
                    systemmenu.visible = hovered;
                    // console.log(hovered);
                }
            }
            MenuItem {
                text: "   Info"
            }
            MenuItem {
                text: "󰤄   Suspend"
            }
            MenuItem {
                text: "   Lock"
                onClicked: {
                    Quickshell.execDetached('hyprlock');
                }
            }
            MenuItem {
                text: "󰿅   Logout"
                onClicked: {
                    Quickshell.execDetached('sudo systemctl restart sddm');
                    // Qt.quit();
                }
            }
            MenuItem {
                text: "   Restart"
            }
            MenuItem {
                text: "⏻   Shutdown"
            }
        }
    }
}
