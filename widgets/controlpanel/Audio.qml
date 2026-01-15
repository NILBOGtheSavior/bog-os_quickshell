import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import Quickshell
import qs.ui
import qs.services

Item {

    ColumnLayout {
        anchors.centerIn: parent

        Container {
            Layout.alignment: Qt.AlignCenter
            Layout.preferredWidth: 290
            Layout.preferredHeight: 75
            ColumnLayout {
                anchors.fill: parent
                RowLayout {
                    Layout.alignment: Qt.AlignLeft
                    Layout.leftMargin: 20
                    Layout.rightMargin: 20
                    Button {
                        text: {
                            if (Audio.default_output.audio.muted == true) {
                                return " ";
                            } else {
                                return " ";
                            }
                        }
                        font.pixelSize: 20
                        onClicked: {
                            if (Audio.default_output.audio.muted == true) {
                                Audio.default_output.audio.muted = false;
                            } else {
                                Audio.default_output.audio.muted = true;
                            }
                        }
                    }
                    Label {
                        Layout.alignment: Qt.AlignCenter
                        Layout.fillWidth: true
                        text: {
                            var name = Audio.default_output.nickname;
                            if (name.length > 20) {
                                return `${name.slice(0, 19)}...`;
                            } else {
                                return name;
                            }
                        }
                        font.family: "0xProto Nerd Font Mono"
                    }
                    Button {
                        Layout.alignment: Qt.AlignRight
                        text: ""
                        font.pixelSize: 20
                    }
                }
                Slider {
                    Layout.alignment: Qt.AlignCenter
                    Layout.fillWidth: true
                    Layout.leftMargin: 25
                    Layout.rightMargin: 25
                    Layout.bottomMargin: 15
                    from: 0
                    value: Audio.default_output.audio.volume
                    to: 1
                }
            }
        }
        Container {
            Layout.alignment: Qt.AlignCenter
            Layout.preferredWidth: 290
            Layout.preferredHeight: 75

            ColumnLayout {
                anchors.fill: parent
                RowLayout {
                    Layout.alignment: Qt.AlignLeft
                    Layout.leftMargin: 20
                    Layout.rightMargin: 20
                    Button {
                        text: " "
                        font.pixelSize: 20
                    }
                    Label {
                        Layout.alignment: Qt.AlignCenter
                        Layout.fillWidth: true
                        text: {
                            var name = Audio.default_input.nickname;
                            if (name.length > 20) {
                                return `${name.slice(0, 19)}...`;
                            } else {
                                return name;
                            }
                        }
                        font.family: "0xProto Nerd Font Mono"
                    }
                    Button {
                        Layout.alignment: Qt.AlignRight
                        text: ""
                        font.pixelSize: 20
                    }
                }
                Slider {
                    Layout.alignment: Qt.AlignCenter
                    Layout.leftMargin: 25
                    Layout.rightMargin: 25
                    Layout.bottomMargin: 15
                    Layout.fillWidth: true
                    from: 0
                    value: Audio.default_input.audio.volume
                    to: 1
                }
            }
        }
    }
}
