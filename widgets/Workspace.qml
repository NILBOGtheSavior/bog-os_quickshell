import QtQuick
import QtQuick.Layouts
import qs.ui

Container {
    id: root
    property string background
    property string text
    property string textColor
    width: 22
    height: 22
    Layout.fillHeight: false

    color: background
    border.color: "transparent"

    Label {
        text: root.text
        anchors.centerIn: parent
        color: root.textColor
    }
}
