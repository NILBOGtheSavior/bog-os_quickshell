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
                        return " ";
                    else
                        return " ";
                }
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
                model: Audio.devices.outputs
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
                            Audio.setOutputDevice(menu_item.modelData);
                        }
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
