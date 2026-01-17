import QtQuick
import QtQuick.Layouts
import qs.config

Rectangle {
    id: root
    state: "DEFAULT"
    color: Colors.background

    border.width: 1
    radius: 25

    Layout.fillHeight: true

    HoverHandler {
        id: mouse
        acceptedDevices: PointerDevice.Mouse | PointerDevice.TouchPad
        cursorShape: Qt.ArrowCursor

        onHoveredChanged: {
            if (hovered) {
                root.state = "HOVERED";
            } else {
                root.state = "DEFAULT";
            }
        }
    }

    states: [
        State {
            name: "HOVERED"
            PropertyChanges {
                target: root
                border.color: Colors.primary
            }
        },
        State {
            name: "DEFAULT"
            PropertyChanges {
                target: root
                border.color: Colors.secondary
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
