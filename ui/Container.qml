import QtQuick
import qs.config

Rectangle {
    id: root
    color: Colors.background
    border.width: 1
    radius: Styles.radius
    state: "default"

    states: [
        State {
            name: "hovered"
            when: hover.hovered
            PropertyChanges {
                root {
                    border.color: Colors.accent1
                }
            }
        },
        State {
            name: "default"
            when: !hover.hovered
            PropertyChanges {
                root {
                    border.color: Colors.secondary
                }
            }
        }
    ]

    transitions: [
        Transition {
            from: "default"
            to: "hovered"
            reversible: true
            ColorAnimation {
                duration: 100
            }
        }
    ]

    HoverHandler {
        id: hover
        acceptedDevices: PointerDevice.AllDevices
    }
}
