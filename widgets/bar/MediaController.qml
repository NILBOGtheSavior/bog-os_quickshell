pragma ComponentBehavior: Bound
import QtQuick
import QtQuick.Controls
import QtQuick.Effects
import QtQuick.Layouts
import Quickshell.Widgets
import qs.config
import qs.services
import qs.ui

Repeater {
    model: Media.players
    delegate: Container {
        id: player
        required property var modelData
        implicitWidth: layout.width
        Layout.fillHeight: true
        Rectangle {
            id: backgroundMask
            layer.enabled: true
            anchors.fill: backgroundImage
            radius: Styles.radius
            color: Colors.background
        }
        Image {
            id: backgroundImage
            layer.enabled: true
            anchors.fill: parent
            opacity: 0.5
            fillMode: Image.PreserveAspectCrop
            source: player.modelData.trackArtUrl
            layer.effect: MultiEffect {
                maskSource: backgroundMask
                maskEnabled: true
                blurEnabled: true
                blurMax: 64
                blur: 1.0
                autoPaddingEnabled: false
            }
        }

        RowLayout {
            id: layout
            anchors.centerIn: parent
            IconImage {
                visible: status != coverart.visible
                Layout.leftMargin: Styles.padding
                width: 15
                height: 15
                source: 'root:/assets/media-icon.png'
            }
            IconImage {
                id: coverart
                visible: status == Image.Ready
                Layout.leftMargin: Styles.padding
                width: 15
                height: 15
                source: player.modelData.trackArtUrl
            }
            LabelButton {
                font: Fonts.small
                text: ""
                onClicked: player.modelData.previous()
            }
            LabelButton {
                font: Fonts.small
                text: {
                    switch (player.modelData.playbackState) {
                    case 0:
                        return "";
                    case 1:
                        return "";
                    case 2:
                        return "";
                    }
                }

                onClicked: player.modelData.togglePlaying()
            }
            LabelButton {
                Layout.rightMargin: Styles.padding
                font: Fonts.small
                text: ""
                onClicked: player.modelData.next()
            }
        }
    }
}
