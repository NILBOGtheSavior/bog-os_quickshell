import QtQuick
import QtQuick.Layouts
import qs.ui.bar
import qs.widgets.bar
import qs.components.controlpanel

RowLayout {
    SystemTray {
        id: tray
    }
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
                visible: !tray.empty
                text: {
                    if (tray.visible)
                        return "󱗼";
                    else
                        return "󱗽";
                }
                onClicked: {
                    tray.visible = !tray.visible;
                }
            }

            Audio {}
            Network {}
            // Battery {}
            Clock {}
            ControlPanel {}
        }
    }
}
