import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Hyprland
import Quickshell.Io
import qs.ui

PopupWindow {
    id: root
    color: "transparent"

    property var menuItems
    readonly property var grab: grab

    implicitHeight: layout.implicitHeight
    implicitWidth: layout.implicitWidth

    Container {
        implicitHeight: layout.height
        implicitWidth: layout.width
        ColumnLayout {
            id: layout

            Spacer {}
            Repeater {
                id: repeater
                model: root.menuItems
                delegate: LabelButton {
                    Layout.fillWidth: true
                    Layout.leftMargin: 10
                    Layout.rightMargin: 10
                    text: modelData.title

                    onClicked: {
                        root.visible = !root.visible;
                        proc.running = true;
                    }

                    Process {
                        id: proc
                        running: false
                        command: modelData.command
                    }
                }
            }
            Spacer {}
        }
    }
    HyprlandFocusGrab {
        id: grab
        windows: [root]

        onCleared: {
            root.visible = false;
        }
    }
}
