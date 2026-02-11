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

            Layout.fillHeight: true
            Layout.topMargin: Styles.padding
            Layout.bottomMargin: Styles.padding
            implicitWidth: implicitHeight

            active: modelData.focused

            font: Fonts.small
            color: Colors.secondary

            onClicked: {
                Hyprland.dispatch(`workspace ${modelData.id}`);
            }

            text: modelData.name
        }
    }
}
