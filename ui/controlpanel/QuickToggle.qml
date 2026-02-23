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

    color: Colors.background
    border.width: 1
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
        implicitWidth: 15
        anchors {
            top: parent.top
            topMargin: 1
            right: parent.right
            rightMargin: 1
            bottom: parent.bottom
            bottomMargin: 1
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
        border.width: 1
        border.color: Colors.secondary
        topRightRadius: Styles.radius
        bottomRightRadius: Styles.radius
        states: [
            State {
                name: "hovered"
                when: dropperHover.hovered
                PropertyChanges {
                    dropper {
                        border.color: Colors.accent1
                    }
                }
            },
            State {
                name: "active"
                when: root.active
                PropertyChanges {
                    root {
                        color: Colors.accent1
                        border.color: Colors.accent1
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
                        border.color: Colors.secondary
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
                    border.color: Colors.accent1
                }
                label {
                    color: Colors.accent1
                }
                icon {
                    color: Colors.accent1
                }
            }
        },
        State {
            name: "active"
            when: root.active
            PropertyChanges {
                root {
                    color: Colors.accent1
                    border.color: Colors.accent1
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
                    border.color: Colors.secondary
                }
            }
        }
    ]
    transitions: [
        Transition {
            ParallelAnimation {
                ColorAnimation {
                    property: "color"
                    duration: 100
                }
                ColorAnimation {
                    property: "border.color"
                    duration: 100
                }
            }
        }
    ]
}
