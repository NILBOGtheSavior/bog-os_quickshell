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

            required property var modelData

            implicitHeight: 22.5
            implicitWidth: implicitHeight

            active: modelData.focused
            ghost: !active && modelData.active

            font: Fonts.small
            color: Colors.secondary

            onClicked: {
                Hyprland.dispatch(`workspace ${modelData.id}`);
            }

            text: modelData.name
        }
    }
}
