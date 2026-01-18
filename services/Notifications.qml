pragma Singleton
pragma ComponentBehavior: Bound

import QtQuick
import Quickshell
import Quickshell.Services.Notifications

Singleton {
    id: root

    property var notifications: []
    property var notificationServer: server

    NotificationServer {
        id: server
        onNotification: notification => {
            root.notifications.push({
                id: notification.id,
                popup: notification.transient,
                application: notification.appName,
                urgency: notification.urgency,
                timeout: notification.expireTimeout,
                image: notification.image,
                summary: notification.summary,
                appName: notification.appName,
                appIcon: notification.appIcon,
                body: notification.body
            });
        }
    }
}
