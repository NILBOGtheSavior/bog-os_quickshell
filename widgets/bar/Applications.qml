import QtQuick
import QtQuick.Layouts
import Quickshell
import qs.config
import qs.services
import qs.ui

RowLayout {
    id: root

    property var filteredWindows: TopLevel.windows.values.filter(window => {
        return window.workspace && window.workspace.monitor.name === screen.name && window.workspace.id === window.workspace.monitor.activeWorkspace.id;
    })

    spacing: 10

    Repeater {
        id: repeater
        model: root.filteredWindows
        delegate: Button {
            id: app
            required property var modelData
            implicitWidth: height
            RowLayout {
                id: layout
                spacing: Styles.spacing
                HoverHandler {
                    id: hover
                }
                LabelButton {
                    close: true
                    icon: Quickshell.iconPath(app.modelData.lastIpcObject.class)
                    iconWidth: 20
                    onClicked: TopLevel.focusWindow(app.modelData)
                }
            }
        }
    }
}
