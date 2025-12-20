import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Hyprland
import qs.ui

Container {
    Layout.preferredWidth: layout.implicitWidth + 20

    // Layout.preferredWidth: 100
    RowLayout {
        id: layout
        anchors.fill: parent
        anchors.leftMargin: 10
        anchors.rightMargin: 10
        implicitWidth: layout.implicitWidth

        Repeater {
            model: Hyprland.workspaces
            delegate: Workspace {
                Layout.alignment: Qt.AlignCenter
                // Layout.preferredWidth: 30
                required property var modelData
                // text: `${Hyprland.focusedWorkspace ? Hyprland.focusedWorkspace.id : "?"}`
                text: `${modelData.id}`
                textColor: modelData.focused ? "#000000" : "#898989c0"
                background: modelData.focused ? "#80A961" : "transparent"
            }
        }
    }
}
