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

    spacing: 20
    Label {
        visible: root.filteredWindows.length > 0
        text: "|"
    }
    Repeater {
        id: repeater
        model: root.filteredWindows
        delegate: RowLayout {
            id: app
            required property var modelData
            spacing: Styles.spacing
            HoverHandler {
                id: hover
            }
            LabelButton {
                close: true
                text: app.modelData.lastIpcObject.class
                icon: Quickshell.iconPath(app.modelData.lastIpcObject.class)
                iconWidth: 15
                onClicked: TopLevel.focusWindow(app.modelData)
            }
            LabelButton {
                opacity: hover.hovered ? 1 : 0
                font: Fonts.small
                text: ""
                onClicked: TopLevel.closeWindow(app.modelData)
                Behavior on opacity {
                    NumberAnimation {
                        duration: 100
                    }
                }
            }
        }
    }
}
