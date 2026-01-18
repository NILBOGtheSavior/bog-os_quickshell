pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import qs.ui.controlpanel
import qs.services

Container {
    Layout.alignment: Qt.AlignCenter
    Layout.fillWidth: true
    Layout.preferredHeight: layout.implicitHeight + 25
    ColumnLayout {
        id: layout
        anchors.fill: parent
        RowLayout {
            Layout.alignment: Qt.AlignLeft
            Layout.leftMargin: 20
            Layout.rightMargin: 20
            IconButton {
                text: {
                    if (Audio.default_output.audio.muted == true)
                        return "";
                    else
                        return "";
                }
                onClicked: {
                    Audio.toggleOutputMute();
                }
            }
            Label {
                Layout.alignment: Qt.AlignCenter
                Layout.fillWidth: true
                text: Utils.truncateString(Audio.default_output.nickname, 20)
            }
            Button {
                id: arrow
                Layout.alignment: Qt.AlignRight
                text: {
                    if (dropdown.visible)
                        return "";
                    else
                        return "";
                }
                font.pixelSize: 20

                onClicked: {
                    dropdown.visible = !dropdown.visible;
                }
            }
        }
        ColumnLayout {
            id: dropdown

            Layout.leftMargin: 15
            Layout.rightMargin: 15
            visible: false
            Repeater {
                model: Audio.devices.outputs
                delegate: LabelButton {
                    required property var modelData

                    active: Audio.default_output == modelData

                    Layout.fillWidth: true
                    text: `${modelData.nickname}`
                    onClicked: {
                        Audio.setOutputDevice(modelData);
                        dropdown.visible = false;
                    }
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
