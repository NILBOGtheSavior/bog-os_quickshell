import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland
import qs.ui

Item {
    Layout.preferredWidth: layout.implicitWidth
    Layout.fillHeight: true

    RowLayout {
        id: layout
        anchors.fill: parent
        implicitWidth: layout.implicitWidth

        Repeater {
            // model: Hyprland.workspaces
            model: Hyprland.workspaces.values.filter(ws => {
                return ws.monitor && ws.monitor.name === screen.name;
            })
            delegate: Workspace {
                id: workspace

                Layout.alignment: Qt.AlignCenter
                required property var modelData
                text: `${modelData.name}`
                state: {
                    if (modelData.focused)
                        return "ACTIVE";
                    else if (button.isHovered)
                        return "HOVERED";
                    else
                        return "DEFAULT";
                }

                Button {
                    id: button
                    anchors.fill: parent
                    onClicked: {
                        Hyprland.dispatch(`workspace ${workspace.modelData.id}`);
                    }
                }
            }
        }
    }
}
