import QtQuick
import QtQuick.Layouts
import qs.ui
import qs.ui.bar
import qs.config

Wrapper {
    id: root
    state: "DEFAULT"

    property string text

    width: 22
    height: 22
    radius: height / 2
    Layout.fillHeight: false

    border.color: "transparent"

    Label {
        id: label
        text: root.text
        anchors.centerIn: parent
    }

    states: [
        State {
            name: "ACTIVE"
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
            name: "HOVERED"
            PropertyChanges {
                target: root
                color: "transparent"
                border.color: Colors.primary
            }
            PropertyChanges {
                target: label
                color: Colors.primary
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
