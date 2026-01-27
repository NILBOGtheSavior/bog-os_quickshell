import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Io
import qs.ui
import qs.ui.bar

PopupWindow {
    id: root

    // visible: false
    color: "transparent"
    implicitWidth: 200
    implicitHeight: layout.implicitHeight

    required property var menuItems

    Container {
        anchors.fill: parent

        ColumnLayout {
            id: layout

            Repeater {
                model: root.menuItems
                delegate: MenuItem {
                    id: menuItem
                    required property var modelData

                    implicitWidth: 200
                    // Layout.fillWidth: true
                    text: menuItem.modelData.title

                    onClicked: {
                        proc.running = true;
                    }

                    Process {
                        id: proc
                        running: false
                        command: menuItem.modelData.command
                    }
                }
            }
        }
    }
}
