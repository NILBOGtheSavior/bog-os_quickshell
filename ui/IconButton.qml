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
            when: hover.hovered
            PropertyChanges {
                root {
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
                    border.color: Colors.secondary
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
