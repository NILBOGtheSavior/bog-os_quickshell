import QtQuick
import QtQuick.Layouts
import qs.ui

Wrapper {
    id: root

    property string background
    property string text
    property string textColor
    width: 22
    height: 22
    radius: height / 2
    Layout.fillHeight: false

    color: background
    border.color: "transparent"

    Button {
        anchors.fill: parent
        Label {
            text: root.text
            anchors.centerIn: parent
            color: root.textColor
        }
    }
}
