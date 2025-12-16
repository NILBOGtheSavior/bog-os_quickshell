import Quickshell
import QtQuick
import QtQuick.Layouts

Scope {

    Variants {
        model: Quickshell.screens

        PanelWindow {
            required property var modelData
            screen: modelData
            color: Qt.rgba(0, 0, 0, 0.75)
            // color: 'transparent'

            anchors {
                top: true
                left: true
                right: true
            }

            implicitHeight: 30

            RowLayout {
                anchors.fill: parent
                anchors.margins: 8
                spacing: 12

                Layout.fillWidth: true

                BarLeft {

                    Layout.alignment: Qt.AlignLeft
                }
                BarCenter {}
                BarRight {}
            }
        }
    }
}
