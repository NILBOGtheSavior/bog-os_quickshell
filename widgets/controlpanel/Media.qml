import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import Quickshell.Widgets
import qs.ui.controlpanel
import qs.services

Item {
    Layout.fillWidth: true
    Layout.fillHeight: false
    implicitHeight: layout.implicitHeight

    Layout.topMargin: 5
    Layout.leftMargin: 5
    Layout.rightMargin: 5
    Layout.bottomMargin: 5

    Component.onCompleted: {
        Media.testMedia();
    }

    Container {
        anchors.fill: parent

        ColumnLayout {
            id: layout

            anchors.fill: parent

            RowLayout {
                IconImage {
                    id: coverart

                    Layout.topMargin: 10
                    Layout.leftMargin: 10
                    Layout.rightMargin: 5
                    Layout.bottomMargin: 5

                    width: 75
                    height: 75
                    source: Media.players[0].trackArtUrl
                }
                ColumnLayout {
                    Label {
                        text: Media.players[0].trackTitle
                        font.weight: 800
                    }
                    Label {
                        text: Media.players[0].trackArtist
                    }
                }
            }
            Slider {
                Layout.fillWidth: true
                Layout.leftMargin: 10
                Layout.rightMargin: 10
            }
            RowLayout {
                Button {
                    Label {
                        text: ""
                    }
                }
            }
        }
    }
}
