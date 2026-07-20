pragma ComponentBehavior: Bound
import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland
import qs.config
import qs.ui

RowLayout {
    id: root

    Repeater {
        model: Hyprland.workspaces.values.filter(ws => {
            return ws.monitor && ws.monitor.name == screen.name;
        })
        delegate: workspace
    }

    Component {
        id: workspace
        Button {
            id: button
            radius: height / 2

            required property var modelData

            implicitHeight: 20
            implicitWidth: implicitHeight

            active: modelData.focused
            ghost: !active && modelData.active

            font: Fonts.small
            color: Colors.secondary

            onClicked: {
                modelData.activate();
            }

            text: modelData.name
        }
    }
}
