import QtQuick
import QtQuick.Layouts
import qs.ui.bar
import qs.widgets.bar

RowLayout {
    Container {
        id: tray

        visible: false

        implicitWidth: systemtray.implicitWidth + systemtray.anchors.leftMargin + systemtray.anchors.rightMargin

        SystemTray {
            id: systemtray
            anchors {
                fill: parent
                leftMargin: 15
                rightMargin: 15
            }
        }
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
            Button {
                text: {
                    if (controlpanel.visible)
                        return " ";
                    else
                        return "󰍜 ";
                }
                onClicked: {
                    controlpanel.visible = !controlpanel.visible;
                }
            }
        }
    }
}
