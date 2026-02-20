pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Services.Notifications
import qs.services

Singleton {
    id: root

    readonly property var trackedNotifications: server.trackedNotifications
    property var notificationTimes: ({})

    signal notifier(var notification)

    property NotificationServer server: NotificationServer {
        id: server

        persistenceSupported: true
        bodySupported: true
        actionsSupported: true

        onNotification: notification => {
            notification.tracked = true;

            root.notifier(notification);

            var times = root.notificationTimes;
            times[notification.id] = Time.time24;
            root.notificationTimes = times;

            root.scheduleAutoDismiss(notification);
        }
    }

    function getNotificationTime(notificationId) {
        return notificationTimes[notificationId] || null;
    }

    function clearAllNotifications() {
        var notifications = server.trackedNotifications.values;
        for (var i = notifications.length - 1; i >= 0; i--) {
            notifications[i].dismiss();
        }
    }

    function scheduleAutoDismiss(notification) {
        if (notification.expireTimeout <= 0)
            return;

        var timer = Qt.createQmlObject('import QtQuick; Timer { interval: ' + notification.expireTimeout + '; running: true; repeat: false }', root);

        timer.triggered.connect(() => {
            notification.dismiss();
            timer.destroy();
        });
    }
}
