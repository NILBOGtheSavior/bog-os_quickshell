import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Widgets
import qs.config
import qs.services
import qs.ui

RowLayout {
    id: root

    spacing: 10

    Repeater {
        id: repeater
        model: TopLevel.windows.values
        delegate: Button {
            id: app
            required property var modelData
            // implicitWidth: height
            onClicked: TopLevel.focusWindow(modelData)
            RowLayout {
                id: layout
                spacing: Styles.spacing
                IconImage {
                    source: Quickshell.iconPath(app.modelData.appId)
                    implicitSize: 20
                }
                Label {
                    text: Utils.truncateString(app.modelData.title, 10)
                }
            }
        }
    }
}
