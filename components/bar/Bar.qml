import Quickshell
import QtQuick
import qs.components.systemmenu

// Variants {
//     model: Quickshell.screens

PanelWindow {
    id: root
    required property var modelData
    screen: modelData
    color: 'transparent'

    anchors {
        top: true
        left: true
        right: true
    }

    margins {
        top: 3
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
        screen: root.screen
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
// }
