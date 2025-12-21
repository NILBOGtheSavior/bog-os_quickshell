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

        // RowLayout {
        //     anchors.fill: parent
        //     // anchors.margins: 8
        //     spacing: 12
        //
        //     Layout.fillWidth: true
        //     Layout.fillHeight: true
        //
        //     BarLeft {
        //         Layout.alignment: Qt.AlignLeft
        //         Layout.fillWidth: false
        //     }
        //     BarCenter {
        //         // Layout.fillWidth: true
        //         // Layout.alignment: Qt.AlignCenter
        //         anchors.verticalCenter: parent.verticalCenter
        //     }
        //     BarRight {
        //         Layout.alignment: Qt.AlignRight
        //         Layout.fillWidth: false
        //     }
        // }
    }
}
