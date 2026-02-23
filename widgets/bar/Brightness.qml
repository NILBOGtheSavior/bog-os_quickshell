import QtQuick
import QtQuick.Layouts
import qs.config
import qs.services
import qs.ui
import qs.ui.bar

RowLayout {
    id: root
    state: "default"
    visible: Brightness.hasBacklight

    LabelButton {
        font: Fonts.small
        text: Brightness.getIcon()
        // onClicked: root.speaker.muted = !root.speaker.muted
    }
    Slider {
        id: slider
        from: 0.01
        value: Brightness.getPercentage()
        to: 1

        onMoved: Brightness.setPercentage(value)
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
