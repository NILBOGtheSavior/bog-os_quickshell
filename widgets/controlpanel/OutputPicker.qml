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
                    if (Audio.default_output.audio.muted == true)
                        return " ";
                    else
                        return " ";
                }
                font.pixelSize: 20
                onClicked: {
                    Audio.toggleOutputMute();
                }
            }
            Label {
                Layout.alignment: Qt.AlignCenter
                Layout.fillWidth: true
                text: {
                    var name = Audio.default_output.nickname;
                    if (name.length > 20)
                        return `${name.slice(0, 19)}...`;
                    else
                        return name;
                }
            }
            Button {
                Layout.alignment: Qt.AlignRight
                text: ""
                font.pixelSize: 20
            }
        }
        ColumnLayout {
            Repeater {
                model: Audio.devices.outputs
                delegate: Label {
                    required property var modelData
                    text: `${modelData.nickname}`
                }
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

            onMoved: {
                Audio.setOutputVolume(position);
            }
        }
    }
}
