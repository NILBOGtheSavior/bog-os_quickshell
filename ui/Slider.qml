import QtQuick
import QtQuick.Controls
import qs.config

Slider {
    id: control
    value: 0.5

    background: Rectangle {
        x: control.leftPadding
        y: control.topPadding + control.availableHeight / 2 - height / 2
        implicitWidth: 100
        implicitHeight: 3
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
        x: control.leftPadding + control.visualPosition * (control.availableWidth - width)
        y: control.topPadding + control.availableHeight / 2 - height / 2
        implicitWidth: 5
        implicitHeight: 10
        radius: 5
        color: Colors.accent1
    }
}
