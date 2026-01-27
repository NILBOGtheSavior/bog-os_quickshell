// Menu Item

import QtQuick
import QtQuick.Layouts
import qs.ui
import qs.config

Rectangle {
    id: root

    property bool active: true
    property string text: ""
    property font font

    property bool isHovered
    signal clicked
    // signal hovered

    implicitWidth: label.implicitWidth
    // Layout.leftMargin: 10
    // Layout.rightMargin: 10

    radius: 15
    Layout.preferredHeight: 30
    Layout.fillWidth: true

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

    onIsHoveredChanged: {
        if (isHovered) {
            state = "HOVERED";
        } else {
            state = "DEFAULT";
        }
    }

    states: [
        State {
            name: "HOVERED"
            PropertyChanges {
                target: root
                color: Colors.primary
                border.color: "transparent"
            }
            PropertyChanges {
                target: label
                color: Colors.background
            }
        },
        State {
            name: "DEFAULT"
            PropertyChanges {
                target: root
                color: "transparent"
                border.color: "transparent"
            }
            PropertyChanges {
                target: label
                color: Colors.foreground
            }
        }
    ]

    transitions: [
        Transition {
            from: "HOVERED"
            to: "DEFAULT"
            ColorAnimation {
                target: root
                duration: 100
            }
            ColorAnimation {
                target: label
                duration: 100
            }
        },
        Transition {
            from: "DEFAULT"
            to: "HOVERED"
            ColorAnimation {
                target: root
                duration: 100
            }
            ColorAnimation {
                target: label
                duration: 100
            }
        },
        Transition {
            from: "ACTIVE"
            to: "DEFAULT"
            ColorAnimation {
                target: root
                duration: 100
            }
            ColorAnimation {
                target: label
                duration: 100
            }
        },
        Transition {
            from: "DEFAULT"
            to: "ACTIVE"
            ColorAnimation {
                target: root
                duration: 100
            }
            ColorAnimation {
                target: label
                duration: 100
            }
        }
    ]
}
