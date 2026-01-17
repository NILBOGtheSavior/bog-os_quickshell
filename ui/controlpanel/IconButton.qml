// Buton.qml

import QtQuick
import QtQuick.Layouts

Rectangle {
    id: root

    property bool active: true
    property string text: ""
    property font font

    property bool isHovered
    signal clicked

    implicitWidth: label.implicitWidth + 10
    Layout.fillHeight: true

    color: 'transparent'

    MouseArea {
        anchors.fill: parent

        HoverHandler {
            id: pointer
            acceptedDevices: PointerDevice.AllDevices
            cursorShape: Qt.PointingHandCursor

            onHoveredChanged: {
                root.isHovered = hovered;
            }
        }

        onClicked: {
            if (root.active)
                root.clicked();
        }
    }

    Label {
        id: label
        text: root.text
        font.pixelSize: 20
        anchors.centerIn: parent
    }
}
