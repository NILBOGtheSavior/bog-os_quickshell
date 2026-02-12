import QtQuick
import qs.ui
import qs.services

Loader {
    active: Battery.hasBattery
    visible: active
    sourceComponent: Label {
        text: Battery.getIcon()
    }
}
