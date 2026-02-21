pragma ComponentBehavior: Bound
import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Widgets
import qs.config
import qs.services
import qs.ui
import qs.ui.controlpanel

Container {
    implicitHeight: layout.implicitHeight
    Layout.fillWidth: true
    ColumnLayout {
        id: layout
        anchors.fill: parent

        RowLayout {
            Layout.margins: Styles.spacing
            Layout.bottomMargin: center.visible ? 0 : Styles.spacing
            Label {
                Layout.fillWidth: true
                font: Fonts.large
                text: "Audio Center"
            }
            LabelButton {
                font: Fonts.large
                text: center.visible ? "" : ""
                onClicked: center.visible = !center.visible
            }
        }

        ColumnLayout {
            id: center
            visible: false

            Spacer {}

            Controller {
                id: output
                mutedIcon: ""
                activeIcon: ""
                device: Audio.default_output
                input: false
            }
            Controller {
                id: input
                mutedIcon: ""
                activeIcon: ""
                device: Audio.default_input
                input: true
            }

            Spacer {}

            Repeater {
                model: Audio.devices.streams
                delegate: RowLayout {
                    id: stream
                    required property var modelData
                    Layout.margins: Styles.padding
                    IconImage {
                        width: 20
                        height: 20
                        source: Quickshell.iconPath(stream.modelData.properties["application.process.binary"] || stream.modelData.properties["application.icon-name"], "audio-ready")
                    }
                    Label {
                        Layout.fillWidth: true
                        text: Utils.truncateString(stream.modelData.properties["application.process.binary"] || stream.modelData.properties["application.name"], 7)
                    }
                    Slider {
                        Layout.leftMargin: 15
                        Layout.rightMargin: 15

                        from: 0
                        value: stream.modelData.audio.volume
                        to: 1
                        onMoved: {
                            // This needs to be fixed.
                            stream.modelData.audio.volume = valueAt(position);
                        }
                    }
                }
            }
        }
    }
    component Controller: ColumnLayout {
        id: root
        required property string activeIcon
        required property string mutedIcon
        required property var device
        required property bool input
        RowLayout {
            id: controllerLayout
            Layout.leftMargin: Styles.spacing
            Layout.rightMargin: Styles.spacing
            IconButton {
                id: icon
                radius: height / 2
                color: root.device.audio.muted ? "transparent" : Colors.secondary
                text: root.device.audio.muted ? root.mutedIcon : root.activeIcon

                onClicked: {
                    Audio.toggleMute(root.device);
                }
            }
            Label {
                Layout.alignment: Qt.AlignCenter
                Layout.fillWidth: true
                text: Utils.truncateString(root.device.nickname, 20)
            }
            LabelButton {
                id: arrow
                Layout.alignment: Qt.AlignRight
                text: {
                    if (dropdown.visible)
                        return "";
                    else
                        return "";
                }
                font: Fonts.large

                onClicked: {
                    dropdown.visible = !dropdown.visible;
                }
            }
        }

        Container {
            id: dropdown
            visible: false
            Layout.fillWidth: true
            implicitHeight: dropdownLayout.implicitHeight
            Layout.leftMargin: Styles.padding
            Layout.rightMargin: Styles.padding
            color: Colors.secondary
            ColumnLayout {
                id: dropdownLayout
                anchors.fill: parent
                Repeater {
                    model: root.input ? Audio.devices.inputs : Audio.devices.outputs
                    delegate: LabelButton {
                        required property var modelData
                        Layout.fillWidth: true
                        color: root.device == modelData ? Colors.accent2 : "transparent"
                        text: modelData.nickname
                        onClicked: {
                            Audio.setDevice(root.input, modelData);
                            dropdown.visible = false;
                        }
                    }
                }
            }
        }

        Slider {
            Layout.alignment: Qt.AlignCenter
            Layout.fillWidth: true
            Layout.leftMargin: Styles.spacing
            Layout.rightMargin: Styles.spacing
            from: 0
            value: root.device.audio.volume
            to: 1

            onMoved: {
                Audio.setVolume(root.device, position);
            }
        }
    }
}
