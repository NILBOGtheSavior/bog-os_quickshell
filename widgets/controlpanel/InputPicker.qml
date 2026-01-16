import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import qs.ui
import qs.services

Container {
    Layout.alignment: Qt.AlignCenter
    Layout.preferredWidth: 290
    Layout.preferredHeight: layout.implicitHeight + 25

    ColumnLayout {
        id: layout
        anchors.fill: parent
        RowLayout {
            Layout.alignment: Qt.AlignLeft
            Layout.leftMargin: 20
            Layout.rightMargin: 20
            Button {
                text: {
                    if (Audio.default_input.audio.muted)
                        return " ";
                    else
                        return " ";
                }
                font.pixelSize: 20

                onClicked: {
                    Audio.toggleInputMute();
                }
            }
            Label {
                Layout.alignment: Qt.AlignCenter
                Layout.fillWidth: true
                text: {
                    var name = Audio.default_input.nickname;
                    if (name.length > 20)
                        return `${name.slice(0, 19)}...`;
                    else
                        return name;
                }
            }
            Button {
                Layout.alignment: Qt.AlignRight
                text: ""
                // ""
                font.pixelSize: 20
            }
        }
        ColumnLayout {
            Repeater {
                model: Audio.devices.inputs
                delegate: Label {
                    required property var modelData
                    text: `${modelData.nickname}`
                }
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

            onMoved: {
                Audio.setInputVolume(position);
            }
        }
    }
}
