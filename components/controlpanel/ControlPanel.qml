import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Hyprland
import qs.components
import qs.ui.controlpanel
import qs.widgets.controlpanel

Button {
    text: {
        if (controlpanel.visible)
            return " ";
        else
            return "󰍜 ";
    }

    onClicked: {
        controlpanel.visible = !controlpanel.visible;
        grab.active = !grab.active;
    }

    PopupWindow {
        id: controlpanel

        anchor.window: WindowManager.bar
        anchor.rect.x: WindowManager.bar.width
        anchor.rect.y: WindowManager.bar.height + 5
        visible: false
        color: "transparent"

        // anchors {
        //     top: true
        //     right: true
        //     // bottom: true
        // }

        // margins {
        //     top: 5
        //     right: 5
        //     bottom: 5
        // }

        implicitWidth: 400
        implicitHeight: layout.height

        Item {
            anchors.fill: parent

            Item {
                anchors.left: parent.left
                anchors.right: parent.right
                implicitHeight: layout.implicitHeight

                ColumnLayout {
                    id: layout

                    anchors.fill: parent

                    Dashboard {}
                    Media {}
                    Audio {}
                }
            }
        }

        HyprlandFocusGrab {
            id: grab
            windows: [controlpanel, WindowManager.bar]

            onCleared: controlpanel.visible = false
        }
    }
}
