// Menu Item

import QtQuick
import QtQuick.Layouts

Rectangle {
    id: root

    property bool active: true
    property string text: ""
    property font font

    property bool isHovered
    signal clicked

    implicitWidth: label.implicitWidth
    Layout.leftMargin: 10
    Layout.rightMargin: 10

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
        font: root.font
        anchors.centerIn: parent
    }
}
