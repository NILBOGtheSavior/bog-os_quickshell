import QtQuick
import QtQuick.Layouts
import qs.config
import qs.ui

Rectangle {
    id: root

    state: "default"

    signal clicked
    property bool active

    default property alias contents: contentItem.data
    property alias text: label.text
    property alias font: label.font

    width: 25
    height: 25

    color: Colors.background
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

    Item {
        id: contentItem
        anchors.centerIn: parent
        width: childrenRect.width
        height: childrenRect.height

        Label {
            id: label
            visible: text !== ""
        }
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
            }
        }
    ]
}
