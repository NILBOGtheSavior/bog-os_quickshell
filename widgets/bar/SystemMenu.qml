import QtQuick
import QtQuick.Layouts
import Quickshell
import qs.services
import qs.config
import qs.ui

RowLayout {
    Label {
        font: Fonts.bogos
        text: ''

        PopupWindow {
            anchor.window: Global.bar
            // visible: true
        }
    }
}
