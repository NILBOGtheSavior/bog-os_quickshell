import QtQuick
import QtQuick.Layouts

Rectangle {
    id: root
    state: "DEFAULT"
    color: Qt.rgba(0, 0, 0, 0.75)

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
                border.color: "#80A961"
            }
        },
        State {
            name: "DEFAULT"
            PropertyChanges {
                target: root
                border.color: Qt.rgba(0.3, 0.3, 0.3, 0.75)
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
