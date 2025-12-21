import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland
import qs.ui

// import qs.ui

Item {
    Layout.preferredWidth: layout.implicitWidth
    Layout.fillHeight: true

    RowLayout {
        id: layout
        anchors.fill: parent
        implicitWidth: layout.implicitWidth

        Repeater {
            model: Hyprland.workspaces
            delegate: Workspace {
                Layout.alignment: Qt.AlignCenter
                required property var modelData
                text: `${modelData.id}`
                textColor: modelData.focused ? "#000000" : "#898989c0"
                background: modelData.focused ? "#80A961" : "transparent"
            }
        }
    }
}
