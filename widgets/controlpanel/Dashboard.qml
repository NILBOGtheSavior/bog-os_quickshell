import QtQuick
import QtQuick.Layouts
import qs.ui.controlpanel
import qs.services

Item {

    Layout.fillWidth: true
    implicitHeight: layout.implicitHeight

    Container {

        anchors.fill: parent

        ColumnLayout {
            id: layout

            anchors.fill: parent

            Label {
                Layout.topMargin: 10
                Layout.leftMargin: 20

                text: Time.time
                font.pixelSize: 48
                font.weight: 800
            }
            Label {
                Layout.leftMargin: 20
                Layout.bottomMargin: 10

                text: Time.date
                font.pixelSize: 24
            }
            NotificationCenter {}
        }
    }
}
