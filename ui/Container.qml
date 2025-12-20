import QtQuick
import QtQuick.Layouts

Rectangle {
    // color: 'transparent'
    color: Qt.rgba(0, 0, 0, 0.75)

    border.width: 1
    border.color: Qt.rgba(0.35, 0.35, 0.35, 0.75)
    radius: 25

    // Layout.preferredWidth: children.implicitWidth + 10
    Layout.fillHeight: true
}
