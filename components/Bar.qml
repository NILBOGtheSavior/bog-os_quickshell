import QtQuick
import QtQuick.Layouts
import Quickshell
import qs.widgets.bar
import qs.config
import qs.ui

Variants {
    model: Quickshell.screens

    PanelWindow {
        id: root
        required property var modelData
        screen: modelData

        implicitHeight: 30
        color: "transparent"

        Component.onCompleted: {
            Global.bar = root;
        }

        anchors {
            left: true
            top: true
            right: true
        }

        margins {
            left: 5
            top: 4
            right: 5
        }

        Container {
            anchors.fill: parent
            RowLayout {
                id: leftIsland
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: Styles.padding * 2

                spacing: Styles.spacing * 2

                SystemMenu {}
                ActiveWindow {}
            }
            RowLayout {
                id: centerIsland
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter

                height: root.implicitHeight
                Workspaces {}
            }
            RowLayout {
                id: rightIsland
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                anchors.rightMargin: Styles.padding * 2
                spacing: Styles.spacing

                SystemTray {}
                MediaController {}
                VolumeController {}
                Battery {}
                Calendar {}
                Clock {}
            }
        }
    }
}
