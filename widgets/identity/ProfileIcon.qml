pragma ComponentBehavior: Bound
import QtQuick
import QtQuick.Effects
import Quickshell.Widgets

Item {
    id: root
    implicitWidth: size
    implicitHeight: size

    property int size: 100
    required property string user

    IconImage {
        id: avatar
        visible: status == Image.Ready
        anchors.fill: parent
        source: "file:///var/lib/AccountsService/icons/" + root.user
        layer.enabled: true
        layer.effect: MultiEffect {
            maskSource: mask
            maskEnabled: true
        }
    }
    IconImage {
        visible: !avatar.visible
        anchors.fill: parent
        source: 'root:/assets/profile.svg'
        layer.enabled: true
        layer.effect: MultiEffect {
            maskSource: mask
            maskEnabled: true
        }
    }
    Rectangle {
        id: mask
        width: avatar.width
        height: avatar.height
        radius: width / 2
        visible: false
        layer.enabled: true
    }
}
