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
            left: 5
            right: 5
        }

        implicitHeight: 30

        RowLayout {
            anchors.fill: parent
            // anchors.margins: 8
            spacing: 12

            Layout.fillWidth: true
            Layout.fillHeight: true

            BarLeft {
                Layout.alignment: Qt.AlignLeft
                Layout.fillWidth: false
            }
            BarCenter {
                // Layout.fillWidth: true
                Layout.alignment: Qt.AlignCenter
            }
            BarRight {
                Layout.alignment: Qt.AlignRight
                Layout.fillWidth: false
            }
        }
    }
}
