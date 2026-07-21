import QtQuick
import QtQuick.Layouts
import Quickshell
import qs.widgets.dock
import qs.config
import qs.ui

Variants {
    model: Quickshell.screens

    PanelWindow {
        id: root
        required property var modelData
        screen: modelData

        implicitHeight: 50
        color: "transparent"

        Component.onCompleted: {
            Global.bar = root;
        }
        anchors {
            left: true
            bottom: true
            right: true
        }

        Container {
            anchors {
                fill: parent
            }
            RowLayout {
                id: leftIsland
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: Styles.padding * 2

                spacing: Styles.spacing * 2

                AppMenu {}
                Applications {}
            }
            RowLayout {
                id: centerIsland
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter

                implicitHeight: root.implicitHeight
            }
            RowLayout {
                id: rightIsland
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                anchors.rightMargin: Styles.padding * 2
                spacing: Styles.spacing

                SystemTray {}
                Battery {}
                Calendar {}
                Clock {}
            }
        }
    }
}
