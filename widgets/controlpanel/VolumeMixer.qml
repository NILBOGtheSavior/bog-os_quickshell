import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Widgets
import qs.config
import qs.services
import qs.ui
import qs.ui.controlpanel

Container {
    id: root
    implicitHeight: layout.implicitHeight
    Layout.fillWidth: true
    ColumnLayout {
        id: layout
        anchors.fill: parent

        RowLayout {
            Layout.margins: Styles.spacing
            Layout.bottomMargin: streams.visible ? 0 : Styles.spacing
            Label {
                Layout.fillWidth: true
                font: Fonts.large
                text: "Volume Mixer"
            }
            LabelButton {
                font: Fonts.large
                text: streams.visible ? "" : ""
                onClicked: streams.visible = !streams.visible
            }
        }
        ColumnLayout {
            id: streams
            visible: false

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
                        source: Quickshell.iconPath(stream.modelData.properties["application.icon-name"], "audio-speakers-symbolic")
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
}
