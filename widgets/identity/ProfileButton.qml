import QtQuick
import QtQuick.Layouts
import Quickshell.Widgets
import qs.config
import qs.ui

Rectangle {
    id: root

    state: "default"

    signal clicked
    property bool active

    property bool close: false

    color: "transparent"
    default property alias contents: contentItem.data
    property alias text: label.text
    property alias font: label.font
    required property string user

    implicitWidth: contentItem.childrenRect.width
    implicitHeight: contentItem.childrenRect.height

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

        RowLayout {
            ProfileIcon {
                id: icon
                user: root.user
                size: 50
            }
            Label {
                id: label
                text: root.user
            }
        }
    }

    states: [
        State {
            name: "hovered"
            when: hover.hovered
            PropertyChanges {
                label {
                    color: Colors.hover
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
    transitions: [
        Transition {
            ColorAnimation {
                property: "color"
                duration: 100
                easing.type: Easing.OutCubic
            }
        }
    ]
}
