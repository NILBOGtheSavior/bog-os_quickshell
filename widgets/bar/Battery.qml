import QtQuick
import qs.ui
import qs.services

Loader {
    active: Battery.hasBattery
    sourceComponent: Component {
        Label {
            text: Battery.getIcon
        }
    }
}
