pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Layouts
import Quickshell.Widgets
import qs.ui
import qs.ui.controlpanel
import qs.services

Item {
    Layout.fillWidth: true
    Layout.fillHeight: false
    implicitHeight: layout.implicitHeight

    Container {
        anchors.fill: parent

        ColumnLayout {
            id: layout
            anchors.fill: parent

            StackLayout {
                id: stack
                currentIndex: 0

                Repeater {

                    model: Media.players
                    delegate: ColumnLayout {
                        id: player

                        required property var modelData

                        IconButton {
                            visible: stack.count > 1
                            Layout.topMargin: 15
                            Layout.leftMargin: 25
                            Layout.rightMargin: 5

                            text: {
                                switch (player.modelData.desktopEntry) {
                                case "firefox":
                                    return "󰈹";
                                case "spotify":
                                    return "";
                                default:
                                    return "";
                                }
                            }

                            onClicked: {
                                if (stack.currentIndex > stack.count - 2)
                                    stack.currentIndex = 0;
                                else
                                    stack.currentIndex++;
                            }
                        }

                        RowLayout {

                            IconImage {
                                id: coverart

                                visible: coverart.status == Image.Ready

                                Layout.topMargin: 15
                                Layout.leftMargin: 25
                                Layout.rightMargin: 5
                                Layout.bottomMargin: 15

                                width: 75
                                height: 75
                                source: player.modelData.trackArtUrl
                            }

                            IconImage {
                                id: mediaart

                                visible: coverart.status != Image.Ready

                                Layout.topMargin: 15
                                Layout.leftMargin: 25
                                Layout.rightMargin: 5
                                Layout.bottomMargin: 15

                                width: 75
                                height: 75
                                source: 'root:/assets/media-icon.png'
                            }

                            ColumnLayout {
                                Label {
                                    text: Utils.truncateString(player.modelData.trackTitle, 25)
                                    font.weight: 800
                                }
                                Label {
                                    text: Utils.truncateString(player.modelData.trackArtist, 25)
                                }
                            }
                        }
                        Slider {
                            visible: player.modelData.positionSupported
                            Layout.fillWidth: true
                            Layout.leftMargin: 25
                            Layout.rightMargin: 25
                            live: false
                            from: 0
                            value: player.modelData.position
                            to: player.modelData.length
                            onMoved: {
                                // This needs to be fixed.
                                player.modelData.position = valueAt(position);
                            }
                        }
                        RowLayout {
                            Layout.alignment: Qt.AlignCenter

                            Layout.topMargin: 10
                            Layout.bottomMargin: 10

                            IconButton {
                                active: player.modelData.shuffle
                                disabled: !player.modelData.shuffleSupported
                                text: ""
                                onClicked: {
                                    player.modelData.shuffle = !player.modelData.shuffle;
                                }
                            }
                            // IconButton {
                            //     text: ""
                            // }
                            IconButton {
                                disabled: !player.modelData.canGoPrevious
                                text: ""
                                onClicked: player.modelData.previous()
                            }
                            IconButton {
                                text: player.modelData.isPlaying ? "" : ""
                                onClicked: player.modelData.isPlaying = !player.modelData.isPlaying
                            }
                            IconButton {
                                disabled: !player.modelData.canGoNext
                                text: ""
                                onClicked: player.modelData.next()
                            }
                            // IconButton {
                            //     text: ""
                            // }
                            IconButton {
                                active: player.modelData.loopState
                                disabled: !player.modelData.loopSupported
                                text: {
                                    if (player.modelData.loopState == 1)
                                        return "";
                                    else
                                        return "";
                                }
                                onClicked: {
                                    if (player.modelData.loopState < 2)
                                        player.modelData.loopState += 1;
                                    else
                                        player.modelData.loopState = 0;
                                }
                            }
                        }
                    }
                }

                function switchStack(index: int) {
                    currentIndex: index;
                }
            }
        }
    }
}
