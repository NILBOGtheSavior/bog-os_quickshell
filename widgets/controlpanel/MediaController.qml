pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Layouts
import QtQuick.Effects
import Quickshell.Widgets
import qs.config
import qs.services
import qs.ui
import qs.ui.controlpanel

StackLayout {
    id: stack
    visible: Media.players.length > 0
    Repeater {
        id: players
        model: Media.players
        delegate: mediaController
    }
    Component {
        id: mediaController
        Container {
            id: root
            required property var modelData
            Layout.fillWidth: true
            implicitHeight: layout.implicitHeight
            Rectangle {
                id: mask
                layer.enabled: true
                anchors.fill: backgroundImage
                radius: Styles.radius
                color: Colors.background
            }
            Image {
                id: backgroundImage
                layer.enabled: true
                anchors.fill: parent
                anchors.margins: 1
                opacity: 0.5
                fillMode: Image.PreserveAspectCrop
                source: root.modelData.trackArtUrl
                layer.effect: MultiEffect {
                    maskSource: mask
                    maskEnabled: true
                    blurEnabled: true
                    blurMax: 64
                    blur: 1.0
                    autoPaddingEnabled: false
                }
            }
            ColumnLayout {
                id: layout
                anchors.fill: parent
                RowLayout {
                    visible: Media.players.length > 1
                    Layout.leftMargin: Styles.padding
                    Layout.topMargin: Styles.padding
                    spacing: Styles.padding
                    Repeater {
                        model: Media.players
                        delegate: Button {
                            required property var modelData
                            required property int index
                            font: Fonts.small
                            text: modelData.identity
                            active: stack.currentIndex == index
                            onClicked: stack.currentIndex = index
                        }
                    }
                }
                RowLayout {
                    Layout.margins: Styles.spacing
                    IconImage {
                        width: 75
                        height: 75
                        source: root.modelData.trackArtUrl
                    }
                    ColumnLayout {
                        Label {
                            font: Fonts.medium_bold
                            text: Utils.truncateString(root.modelData.trackTitle, 23)
                        }
                        Label {
                            text: root.modelData.trackAlbum
                        }
                        Label {
                            font: Fonts.small
                            text: Utils.truncateString(root.modelData.trackArtist, 30)
                        }
                    }
                }
                Slider {
                    visible: root.modelData.canSeek
                    Layout.fillWidth: true
                    Layout.leftMargin: 25
                    Layout.rightMargin: 25
                    live: false
                    from: 0
                    value: root.modelData.position
                    to: root.modelData.length
                    onMoved: {
                        // This needs to be fixed.
                        root.modelData.position = valueAt(position);
                    }
                }
                RowLayout {
                    Layout.fillWidth: true
                    Layout.alignment: Qt.AlignCenter
                    Layout.bottomMargin: Styles.spacing
                    LabelButton {
                        Layout.rightMargin: 10
                        text: ""
                    }
                    LabelButton {
                        text: ""
                        onClicked: root.modelData.previous()
                    }
                    LabelButton {
                        Layout.leftMargin: 10
                        Layout.rightMargin: 10
                        text: {
                            switch (root.modelData.playbackState) {
                                case 0:
                                return "";
                                case 1:
                                return "";
                                case 2:
                                return "";
                            }
                        }
                        onClicked: root.modelData.togglePlaying()
                    }
                    LabelButton {
                        text: ""
                        onClicked: root.modelData.next()
                    }
                    LabelButton {
                        Layout.leftMargin: 10
                        text: ""
                    }
                }
            }
        }
    }
}
