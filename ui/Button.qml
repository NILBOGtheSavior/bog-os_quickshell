// Buton.qml

import QtQuick
import QtQuick.Layouts

Rectangle {
    id: root

    property bool active: true
    property string text: ""
    property font font

    signal clicked

    implicitWidth: label.implicitWidth + 10
    // Layout.preferredWidth: label.implicitWidth
    Layout.fillHeight: true

    // Layout.fillWidth: true

    color: 'transparent'

    MouseArea {
        // property bool disabled

        anchors.fill: parent

        HoverHandler {
            id: pointer
            acceptedDevices: PointerDevice.AllDevices
            cursorShape: Qt.PointingHandCursor
        }

        onClicked: {
            if (root.active)
                console.log("Button Clicked!");
        }
    }

    Text {
        id: label
        color: 'white'
        text: root.text
        font: root.font
        anchors.centerIn: parent
    }
}
