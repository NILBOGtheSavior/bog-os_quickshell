import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Widgets
import qs.components
import qs.ui.bar
import qs.services

Container {
    id: tray

    readonly property bool empty: {
        return (SystemTray.items.values.length < 1);
    }

    visible: !empty

    implicitWidth: systemTray.implicitWidth + systemTray.anchors.leftMargin + systemTray.anchors.rightMargin

    RowLayout {
        id: systemTray

        anchors {
            fill: parent
            leftMargin: 15
            rightMargin: 15
        }

        Repeater {
            model: SystemTray.items.values
            delegate: Button {
                id: menuItem

                required property var modelData

                onClicked: {
                    menu.open();
                }
                IconImage {
                    anchors.centerIn: parent

                    width: 15
                    height: 15
                    source: menuItem.modelData?.icon

                    QsMenuAnchor {
                        id: menu
                        anchor.window: WindowManager.bar
                        anchor.rect.x: rightbar.x + menuItem.x
                        anchor.rect.y: menuItem.y + rightbar.height
                        menu: menuItem.modelData.menu
                    }
                }
            }
        }
    }
}
