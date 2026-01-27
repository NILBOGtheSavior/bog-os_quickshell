// Buton.qml

import QtQuick
import QtQuick.Layouts
import qs.ui
import qs.config

Rectangle {
    id: root

    state: "DEFAULT"

    property bool active
    property bool disabled

    property string text: ""
    property font font

    property bool isHovered
    signal clicked

    implicitWidth: 30
    implicitHeight: 30

    radius: 15

    color: Colors.background

    MouseArea {
        anchors.fill: parent

        HoverHandler {
            id: pointer
            acceptedDevices: PointerDevice.AllDevices
            cursorShape: root.disabled ? Qt.ArrowCursor : Qt.PointingHandCursor

            onHoveredChanged: {
                if (!root.active && !root.disabled) {
                    if (hovered) {
                        root.state = "HOVERED";
                    } else {
                        root.state = "DEFAULT";
                    }
                }
            }
        }

        onClicked: {
            if (!root.disabled)
                root.clicked();
        }
    }

    Label {
        id: label
        text: root.text
        font.pixelSize: 24
        anchors.centerIn: parent
    }

    onActiveChanged: {
        if (active)
            state: "ACTIVE";
        else
            state: "DEFAULT";
    }

    states: [
        State {
            name: "HOVERED"
            PropertyChanges {
                target: root
                border.color: Colors.primary
            }
            PropertyChanges {
                target: label
                color: Colors.primary
            }
        },
        State {
            name: "DEFAULT"
            when: (!root.active && !root.disabled)
            PropertyChanges {
                target: root
                border.color: Colors.secondary
            }
        },
        State {
            name: "ACTIVE"
            when: (root.active)
            PropertyChanges {
                target: root
                color: Colors.primary
            }
            PropertyChanges {
                target: label
                color: Colors.secondary
            }
        },
        State {
            name: "DISABLED"
            when: (root.disabled)
            PropertyChanges {
                target: root
            }
            PropertyChanges {
                target: label
                color: Colors.secondary
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
        }
    ]
}
