import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Widgets
import qs.ui.bar
import qs.services

RowLayout {
    Repeater {
        model: SystemTray.items.values
        delegate: IconImage {
            required property var modelData

            width: 15
            height: 15
            source: modelData.icon
        }
    }
}
