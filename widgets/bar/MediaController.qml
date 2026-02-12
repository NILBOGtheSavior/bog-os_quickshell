import QtQuick
import QtQuick.Controls
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
        color: Colors.secondary
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
            }
            LabelButton {
                font: Fonts.small
                text: player.modelData.isPlaying ? "" : ""
                onClicked: player.modelData.isPlaying = !player.modelData.isPlaying
            }
            LabelButton {
                Layout.rightMargin: Styles.padding
                font: Fonts.small
                text: ""
            }
        }
    }
}
