import QtQuick
import QtQuick.Layouts
import Quickshell
import qs.ui
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

        Button {
            font: "BogOS"
            text: ''
            onClicked: {
                systemmenu.visible = !systemmenu.visible;
            }
        }
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
