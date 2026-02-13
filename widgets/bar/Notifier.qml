import QtQuick
import QtQuick.Layouts
import qs.config
import qs.services
import qs.ui

Container {
    id: root
    property var currentNotification: null
    property string displayText: ""
    property string displayIcon: ""
    visible: root.currentNotification !== null || scaleAnim.running
    implicitWidth: layout.implicitWidth + Styles.padding * 2
    Layout.fillHeight: true
    color: Colors.secondary

    LabelButton {
        id: layout
        property var notificationData
        anchors.centerIn: parent

        icon: root.currentNotification ? root.displayIcon : ""
        iconHeight: 15
        iconWidth: 15
        text: root.displayText
        font: Fonts.small
    }

    Connections {
        target: Notifications
        function onNotifier(notif: var) {
            root.currentNotification = notif;
            root.displayText = Utils.truncateString(notif.body, 25);
            root.displayIcon = notif.image;
        }
    }
    Timer {
        id: dismissTimer
        interval: 5000
        running: root.currentNotification !== null
        onTriggered: root.currentNotification = null
    }

    transform: Scale {
        origin.x: root.width
        origin.y: root.height / 2
        xScale: root.currentNotification !== null ? 1 : 0
        yScale: 1

        Behavior on xScale {
            NumberAnimation {
                id: scaleAnim
                duration: 300
                easing.type: Easing.OutCubic
            }
        }
    }
}
