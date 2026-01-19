pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Services.Notifications

Singleton {
    id: root

    property var notifications: []
    readonly property var trackedNotifications: server.trackedNotifications

    property NotificationServer server: NotificationServer {
        id: server

        persistenceSupported: true
        bodySupported: true
        actionsSupported: true

        onNotification: notification => {
            notification.tracked = true;
        }
    }
}
