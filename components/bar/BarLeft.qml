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
                console.log("System tray clicked!");
                Quickshell.execDetached("kitty");
            }
        }
        Button {
            text: ''
            onClicked: {
                Quickshell.execDetached("hyprlauncher");
            }
        }
        ActiveWindow {}
    }
}
