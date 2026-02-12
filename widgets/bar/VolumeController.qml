import QtQuick
import QtQuick.Layouts
import qs.config
import qs.services
import qs.ui

RowLayout {
    id: root
    state: "default"

    property var speaker: Audio.default_output?.audio

    LabelButton {
        font: Fonts.small
        text: {
            if (root.speaker.volume == 0 || root.speaker.muted)
                return " ";
            else if (root.speaker.volume < 0.33)
                return " ";
            else if (root.speaker.volume < 0.67)
                return " ";
            else
                return " ";
        }
        onClicked: root.speaker.muted = !root.speaker.muted
    }
    Slider {
        id: slider
        from: 0
        value: root.speaker.volume || 0
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
            SequentialAnimation {
                NumberAnimation {
                    target: slider
                    properties: "implicitWidth,opacity"
                    duration: 100
                    easing.type: Easing.InOutQuad
                }
                PauseAnimation {
                    duration: 750
                }
            }
        }
    ]
}
