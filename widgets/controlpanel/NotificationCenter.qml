import QtQuick
import QtQuick.Layouts
import qs.services

ColumnLayout {
    id: root
    property var server: Notifications.server
    Layout.fillWidth: true
    Layout.bottomMargin: 10

    Repeater {
        model: Notifications.trackedNotifications.values
        delegate: Notification {
            required property var modelData

            objectModel: modelData
        }
    }
}
