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

    implicitWidth: contentItem.childrenRect.width + (Styles.padding * 2)
    implicitHeight: contentItem.childrenRect.height

    color: "transparent"

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
                label {
                    color: Colors.accent1
                }
            }
        },
        State {
            name: "default"
            when: !hover.hovered && !root.active
            PropertyChanges {
                label {
                    color: Colors.foreground
                }
            }
        }
    ]
}
