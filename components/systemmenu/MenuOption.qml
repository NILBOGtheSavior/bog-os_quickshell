// Menu Option

import QtQuick
import QtQuick.Layouts
import qs.ui

MenuItem {
    Layout.fillWidth: true
    // Layout.fillHeight: false
    Layout.preferredHeight: 14

    states: [
        State {
            name: "Hovered"
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
