import Quickshell
import QtQuick
import QtQuick.Layouts

Variants {
    model: Quickshell.screens

    PanelWindow {
        id: root
        required property var modelData
        screen: modelData
        // color: Qt.rgba(0, 0, 0, 0.75)
        color: 'transparent'

        anchors {
            top: true
            left: true
            right: true
        }

        margins {
            top: 5
            left: 5
            right: 5
        }

        implicitHeight: 35

        BarLeft {
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.bottom: parent.bottom
        }
        BarCenter {
            anchors.top: parent.top
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
        }
        BarRight {
            anchors.top: parent.top
            anchors.right: parent.right
            anchors.bottom: parent.bottom
        }
    }
}
