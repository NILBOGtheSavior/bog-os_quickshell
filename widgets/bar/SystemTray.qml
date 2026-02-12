pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Widgets
import qs.config
import qs.services
import qs.ui

Container {
    id: root
    visible: SystemTray.applications.length > 0
    color: Colors.secondary
    implicitWidth: layout.implicitWidth + Styles.padding * 2
    Layout.fillHeight: true
    RowLayout {
        id: layout
        anchors.fill: parent
        Repeater {
            model: SystemTray.applications
            delegate: LabelButton {
                id: menuItem
                required property var modelData
                Layout.alignment: Qt.AlignCenter
                implicitWidth: icon.width
                implicitHeight: icon.height

                onClicked: menu.open()
                IconImage {
                    id: icon
                    width: 13
                    height: 13
                    source: menuItem.modelData?.icon

                    QsMenuAnchor {
                        id: menu
                        anchor.item: root
                        anchor.rect.y: Global.bar.height
                        menu: menuItem.modelData.menu
                    }
                }
            }
        }
    }
}
