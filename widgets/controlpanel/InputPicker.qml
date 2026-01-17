import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import qs.ui.controlpanel
import qs.services

Container {
    Layout.alignment: Qt.AlignCenter
    Layout.preferredHeight: layout.implicitHeight + 25
    Layout.fillWidth: true

    ColumnLayout {
        id: layout
        anchors.fill: parent
        RowLayout {
            Layout.alignment: Qt.AlignLeft
            Layout.leftMargin: 20
            Layout.rightMargin: 20
            IconButton {
                text: {
                    if (Audio.default_input.audio.muted)
                        return "";
                    else
                        return "";
                }

                onClicked: {
                    Audio.toggleInputMute();
                }
            }
            Label {
                Layout.alignment: Qt.AlignCenter
                Layout.fillWidth: true
                text: Utils.truncateString(Audio.default_input.nickname, 20)
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
            visible: false
            Repeater {
                model: Audio.devices.inputs
                delegate: Item {
                    id: menu_item
                    required property var modelData
                    implicitHeight: label.implicitHeight

                    Button {
                        id: button
                        Layout.fillWidth: true
                        implicitHeight: label.implicitHeight
                        implicitWidth: 290
                        Label {
                            id: label
                            text: `${menu_item.modelData.nickname}`
                        }
                        onClicked: {
                            Audio.setInputDevice(menu_item.modelData);
                        }
                    }
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
