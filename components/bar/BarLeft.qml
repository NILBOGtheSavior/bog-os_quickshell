import QtQuick
import QtQuick.Layouts
import Quickshell
import qs.ui.bar
import qs.widgets.bar

Container {
    implicitWidth: layout.implicitWidth + layout.anchors.leftMargin + layout.anchors.rightMargin
    RowLayout {
        id: layout
        anchors {
            fill: parent
            leftMargin: 15
            rightMargin: 15
        }

        SystemMenu {}
        Button {
            font: "JetBrainsMono Nerd Font"
            text: ''
            onClicked: {
                Quickshell.execDetached("hyprlauncher");
            }
        }
        ActiveWindow {}
    }
}
