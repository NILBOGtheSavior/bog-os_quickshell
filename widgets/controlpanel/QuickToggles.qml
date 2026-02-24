import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell
import Quickshell.Hyprland
import qs.config
import qs.services
import qs.ui
import qs.ui.controlpanel

GridLayout {
    columns: 3
    rowSpacing: Styles.padding * 2
    columnSpacing: Styles.padding * 2

    QuickToggle {
        icon: "󰀂"
        text: "Network"
    }
    QuickToggle {
        active: VPN.connected
        icon: "󰖂"
        text: "VPN"
        onClicked: {
            VPN.toggleVpn();
        }
        Component.onCompleted: VPN.checkStatus()
    }
    QuickToggle {
        icon: ""
        text: "Bluetooth"
    }
    QuickToggle {
        active: Global.dnd
        icon: ""
        text: "DND"
        onClicked: {
            Global.dnd = !Global.dnd;
        }
    }
    QuickToggle {
        icon: "󰖨"
        text: "Night Light"
    }
    QuickToggle {
        id: themes
        dropdown: true
        active: Colors.mode === "dark"
        icon: ""
        text: Colors.name

        onClicked: Colors.switchMode()
        onDropperClicked: {
            themeMenu.visible = !themeMenu.visible;
            grab.active = !grab.active;
        }

        PopupWindow {
            id: themeMenu
            anchor {
                item: themes
                edges: Edges.Bottom
                gravity: Edges.Bottom
            }
            color: "transparent"
            implicitWidth: themeLayout.implicitWidth + 20
            Container {
                anchors.fill: parent
                clip: true
                ScrollView {
                    anchors {
                        fill: parent
                        margins: 5
                    }
                    ColumnLayout {
                        id: themeLayout
                        Repeater {
                            model: Colors.getThemeNames()
                            delegate: LabelButton {
                                required property var modelData
                                Layout.fillWidth: true
                                text: modelData
                                radius: Styles.radius
                                color: Colors.currentTheme == modelData ? Colors.secondary : Colors.background
                                onClicked: Colors.setTheme(modelData)
                            }
                        }
                    }
                }
            }
            HyprlandFocusGrab {
                id: grab
                windows: [themeMenu]

                onCleared: {
                    themeMenu.visible = false;
                }
            }
        }
    }
}
