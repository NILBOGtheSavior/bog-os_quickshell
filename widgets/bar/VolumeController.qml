import QtQuick
import QtQuick.Layouts
import qs.config
import qs.services
import qs.ui

RowLayout {
    id: root
    state: "default"
    LabelButton {
        font: Fonts.small
        text: {
            if (Audio.default_output.audio.volume == 0 || Audio.default_output.audio.muted)
                return " ";
            else if (Audio.default_output.audio.volume < 0.33)
                return " ";
            else if (Audio.default_output.audio.volume < 0.67)
                return " ";
            else
                return " ";
        }
        onClicked: Audio.default_output.audio.muted = !Audio.default_output.audio.muted
    }
    Slider {
        id: slider
        from: 0
        value: Audio.default_output.audio.volume
        to: 1

        onMoved: Audio.setOutputVolume(position)
    }
    HoverHandler {
        id: hover
        acceptedDevices: PointerDevice.Mouse | PointerDevice.TouchPad
        cursorShape: Qt.ArrowCursor
    }
    states: [
        State {
            name: "hovered"
            when: hover.hovered
            PropertyChanges {
                slider {
                    implicitWidth: 75
                    opacity: 1
                }
            }
        },
        State {
            name: "default"
            when: !hover.hovered
            PropertyChanges {
                slider {
                    implicitWidth: 0
                    opacity: 0
                }
            }
        }
    ]
    transitions: [
        Transition {
            from: "hovered"
            to: "default"
            reversible: true
            NumberAnimation {
                target: slider
                properties: "implicitWidth,opacity"
                duration: 100
                easing.type: Easing.InOutQuad
            }
        }
    ]
}
