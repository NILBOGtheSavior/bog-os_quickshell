import QtQuick
import QtQuick.Controls
import qs.config

Slider {
    id: control

    background: Rectangle {
        x: control.leftPadding
        y: control.topPadding + control.availableHeight / 2 - height / 2
        implicitWidth: 200
        implicitHeight: 4
        width: control.availableWidth
        height: implicitHeight
        radius: 2
        color: Colors.secondary

        Rectangle {
            width: control.visualPosition * parent.width
            height: parent.height
            color: Colors.foreground
            radius: 2
        }
    }

    handle: Rectangle {
        visible: control.hovered || control.pressed
        x: control.leftPadding + control.visualPosition * (control.availableWidth - width)
        y: control.topPadding + control.availableHeight / 2 - height / 2
        implicitWidth: 15
        implicitHeight: 15
        radius: 13
        color: Colors.primary
    }
}
