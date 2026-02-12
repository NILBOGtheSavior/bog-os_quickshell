import QtQuick
import QtQuick.Layouts
import qs.config
import qs.services
import qs.ui

RowLayout {
    Label {
        font: Fonts.small
        text: ""
    }
    Slider {
        from: 0
        value: Audio.default_output.audio.volume
        to: 1

        onMoved: Audio.setOutputVolume(position)
    }
}
