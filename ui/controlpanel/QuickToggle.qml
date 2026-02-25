import QtQuick
import QtQuick.Layouts
import qs.config
import qs.ui

Rectangle {
    id: root

    state: "default"

    signal clicked
    signal dropperClicked

    property bool active
    property bool dropdown: false

    default property alias contents: contentItem.data
    property alias icon: icon.text
    property alias text: label.text
    property alias font: label.font

    Layout.fillWidth: true
    implicitHeight: contentItem.height + (Styles.padding * 2)

    color: Colors.surface
    radius: Styles.radius

    MouseArea {
        anchors.fill: parent
        HoverHandler {
            id: hover
            acceptedDevices: PointerDevice.AllDevices
            cursorShape: Qt.PointingHandCursor
        }
        onClicked: {
            root.clicked();
        }
    }

    ColumnLayout {
        id: contentItem
        anchors.centerIn: parent

        Label {
            id: icon
            Layout.alignment: Qt.AlignCenter
            font: Fonts.large
        }

        Label {
            id: label
            Layout.alignment: Qt.AlignCenter
            font: Fonts.small
            visible: text !== ""
        }
    }

    Rectangle {
        id: dropper
        visible: root.dropdown
        implicitHeight: 20
        anchors {
            left: parent.left
            right: parent.right
            bottom: parent.bottom
        }
        MouseArea {
            anchors.fill: parent
            HoverHandler {
                id: dropperHover
                acceptedDevices: PointerDevice.AllDevices
                cursorShape: Qt.PointingHandCursor
            }
            onClicked: {
                root.dropperClicked();
            }
        }
        color: Colors.secondary
        bottomLeftRadius: Styles.radius - 2
        bottomRightRadius: Styles.radius - 2
        Label {
            anchors.centerIn: parent
            font: Fonts.small
            text: `${root.text} 󱞣`
        }
        states: [
            State {
                name: "hovered"
                when: dropperHover.hovered
                PropertyChanges {
                    dropper {
                        color: Colors.hover
                    }
                }
            },
            State {
                name: "default"
                when: !dropperHover.hovered
                PropertyChanges {
                    dropper {
                        color: Colors.surface
                    }
                }
            }
        ]
    }

    states: [
        State {
            name: "hovered"
            when: hover.hovered && !root.active
            PropertyChanges {
                root {
                    color: Colors.hover
                }
            }
        },
        State {
            name: "active"
            when: root.active
            PropertyChanges {
                root {
                    color: Colors.primary
                }
                label {
                    color: Colors.background
                }
                icon {
                    color: Colors.background
                }
            }
        },
        State {
            name: "default"
            when: !hover.hovered && !root.active
            PropertyChanges {
                root {
                    color: Colors.surface
                }
                label {
                    color: Colors.foreground
                }
                icon {
                    color: Colors.foreground
                }
            }
        }
    ]
    transitions: [
        Transition {
            ColorAnimation {
                property: "color"
                duration: 100
            }
        }
    ]
}
