import QtQuick
import qs.config
import qs.services
import qs.ui

Label {
    visible: Weather.code != -1
    font: Fonts.small
    text: `${Weather.icon} ${Weather.temperature}${Weather.unit}`
}
