import QtQuick
import QtQuick.Effects
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

        exclusiveZone: 35

        implicitHeight: 40
        color: "transparent"

        Component.onCompleted: {
            Global.bar = root;
        }
        anchors {
            left: true
            top: true
            right: true
        }

        Container {
            anchors {
                fill: parent
                margins: 5
            }
            layer.enabled: true
            layer.effect: MultiEffect {
                shadowEnabled: true
                shadowColor: Colors.shadow
                shadowBlur: 0.4
            }
            RowLayout {
                id: leftIsland
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: Styles.padding * 2

                spacing: Styles.spacing * 2

                SystemMenu {}
                ApplicationLauncher {}
                ActiveWindow {}
            }
            RowLayout {
                id: centerIsland
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter

                implicitHeight: root.implicitHeight
                Workspaces {}
            }
            RowLayout {
                id: rightIsland
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                anchors.rightMargin: Styles.padding * 2
                spacing: Styles.spacing

                Notifier {}
                SystemTray {}
                MediaController {}
                Battery {}
                VolumeController {}
                Brightness {}
                Weather {}
                Calendar {}
                Clock {}
                LabelButton {
                    font: Fonts.large
                    text: Global.controlPanel.visible ? "" : ""
                    onClicked: Global.controlPanel.visible = !Global.controlPanel.visible
                }
            }
        }
    }
}
