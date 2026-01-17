// System Menu

import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Hyprland
import qs.ui.bar
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
                    Quickshell.execDetached('hyprctl dispatch exit');
                }
            }
            MenuItem {
                text: "   Restart"
                onClicked: {
                    Quickshell.execDetached("hyprshutdown --post-cmd 'reboot'");
                }
            }
            MenuItem {
                text: "⏻   Shutdown"
                onClicked: {
                    Quickshell.execDetached("hyprshutdown --post-cmd 'shutdown -P 0'");
                }
            }
        }
    }
}
