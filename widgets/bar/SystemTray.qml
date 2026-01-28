import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Widgets
import qs.ui.bar
import qs.services

RowLayout {
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
                    anchor.window: root
                    anchor.rect.x: rightbar.x + menuItem.x
                    anchor.rect.y: menuItem.y + rightbar.height
                    menu: menuItem.modelData.menu
                }
            }
        }
    }
}
