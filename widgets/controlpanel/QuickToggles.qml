import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell
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
        icon: ""
        text: "Dark Mode"

        onDropperClicked: themeMenu.visible = !themeMenu.visible

        PopupWindow {
            id: themeMenu
            anchor {
                item: themes
                edges: Edges.Bottom | Edges.Right
                gravity: Edges.Bottom | Edges.Left
            }
            color: "transparent"
            implicitWidth: themeLayout.implicitWidth
            Container {
                anchors.fill: parent
                color: Colors.secondary
                ScrollView {
                    anchors.fill: parent
                    ColumnLayout {
                        id: themeLayout
                        Repeater {
                            model: Colors.getThemeNames()
                            delegate: LabelButton {
                                required property var modelData
                                text: modelData
                                onClicked: Colors.setTheme(modelData)
                            }
                        }
                    }
                }
            }
        }
    }
}
