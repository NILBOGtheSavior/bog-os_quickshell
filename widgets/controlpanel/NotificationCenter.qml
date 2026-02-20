pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Controls
import QtQuick.Effects
import QtQuick.Layouts
import Quickshell
import Quickshell.Widgets
import qs.config
import qs.services
import qs.ui

ColumnLayout {
    id: root
    Layout.topMargin: Styles.padding * 2
    RowLayout {
        Label {
            Layout.fillWidth: true
            font: Fonts.large
            text: "Notification Center"
        }
        LabelButton {
            Layout.rightMargin: Styles.padding
            font: Fonts.large
            text: ""
            onClicked: Notifications.clearAllNotifications()
        }
    }
    Container {
        Layout.maximumHeight: 500
        Layout.preferredHeight: layout.implicitHeight + Styles.spacing * 2
        Layout.fillWidth: true
        color: Colors.secondary
        ScrollView {
            anchors {
                fill: parent
                leftMargin: 10
                topMargin: 10
                bottomMargin: 10
            }
            ColumnLayout {
                id: layout
                anchors.fill: parent
                anchors.rightMargin: 10
                spacing: Styles.spacing
                Item {
                    visible: Notifications.trackedNotifications.values.length == 0
                    Layout.fillWidth: true
                    implicitHeight: placeholder.implicitHeight
                    onVisibleChanged: {
                        if (visible)
                            placeholder.randomPlaceholder();
                    }
                    Label {
                        id: placeholder
                        anchors.centerIn: parent
                        color: Colors.background
                        font: Fonts.medium_bold
                        Component.onCompleted: randomPlaceholder()
                        function randomPlaceholder() {
                            var options = ["No notifications", "All clear", "You're all caught up", "Nothing to see here", "Inbox zero!", "Peace and quiet", "Enjoy the silence", "No news is good news", "Clean slate", "Nothing new", "You're up to date", "All done here", "Take a break", "Radio silence", "Blissfully empty", "No alerts", "Everything's handled", "Nothing pending", "Looking good", "Zen mode activated", "Distraction-free zone", "No interruptions", "Crystal clear", "Smooth sailing"];
                            text = options[Math.floor(Math.random() * options.length)];
                        }
                    }
                }

                Repeater {
                    model: Notifications.trackedNotifications.values.slice().reverse()
                    delegate: notification
                }
            }
        }
    }

    Component {
        id: notification
        Container {
            id: notificationRoot
            required property var modelData
            Layout.fillWidth: true
            implicitHeight: notificationLayout.implicitHeight + Styles.padding * 2
            ColumnLayout {
                id: notificationLayout
                anchors.fill: parent
                Rectangle {
                    Layout.fillWidth: true
                    Layout.leftMargin: 1
                    Layout.topMargin: 1
                    Layout.rightMargin: 1
                    implicitHeight: title.implicitHeight
                    topLeftRadius: Styles.radius / 2
                    topRightRadius: Styles.radius / 2
                    color: {
                        switch (notificationRoot.modelData.urgency) {
                        case 0:
                            return Colors.primary;
                        case 1:
                            return Colors.accent1;
                        case 2:
                            return Colors.accent2;
                        }
                    }

                    RowLayout {
                        id: title
                        anchors.fill: parent

                        IconImage {
                            Layout.leftMargin: Styles.padding
                            height: 15
                            width: 15
                            source: Quickshell.iconPath(notificationRoot.modelData.appIcon, "start-here-symbolic")
                        }
                        Label {

                            color: Colors.background
                            font: Fonts.medium_bold
                            text: notificationRoot.modelData.summary
                        }
                        Label {
                            visible: false
                            text: notificationRoot.modelData.expireTimeout
                        }
                        Label {
                            Layout.fillWidth: true
                            font: Fonts.small
                            color: Colors.secondary
                            text: notificationRoot.modelData.lastGeneration ? "" : Notifications.getNotificationTime(notificationRoot.modelData.id)
                        }
                        LabelButtonDark {
                            Layout.rightMargin: Styles.padding
                            text: "󰅙"
                            onClicked: notificationRoot.modelData.dismiss()
                        }
                    }
                }
                RowLayout {
                    Layout.fillWidth: true
                    Item {
                        visible: notificationImage.source != ""
                        Layout.alignment: Qt.AlignTop
                        Layout.leftMargin: Styles.padding
                        width: 50
                        height: 50
                        Rectangle {
                            id: mask
                            layer.enabled: true
                            anchors.fill: notificationImage
                            radius: Styles.radius
                            color: Colors.background
                        }
                        IconImage {
                            id: notificationImage
                            height: 50
                            width: 50
                            layer.enabled: true
                            source: notificationRoot.modelData.image
                            layer.effect: MultiEffect {
                                maskSource: mask
                                maskEnabled: true
                            }
                        }
                    }
                    Label {
                        Layout.alignment: Qt.AlignTop
                        Layout.leftMargin: Styles.padding
                        Layout.preferredWidth: notificationImage.visible ? 240 : 300
                        wrapMode: Text.WordWrap
                        text: notificationRoot.modelData.body
                    }
                }

                RowLayout {
                    Layout.fillWidth: true
                    Layout.leftMargin: Styles.padding * 2
                    Layout.bottomMargin: Styles.padding * 2
                    Repeater {
                        model: notificationRoot.modelData.actions
                        delegate: Button {
                            required property var modelData
                            text: modelData.text
                            color: Colors.secondary
                            onClicked: modelData.invoke()
                        }
                    }
                    Button {
                        visible: notificationRoot.modelData.hasInlineReply
                        text: "Reply"
                    }
                }
                Container {
                    Layout.fillWidth: true
                    visible: false
                    color: Colors.secondary
                    height: 50
                    width: 300
                    InputLabel {
                        id: inputLabel
                        anchors.fill: parent
                        placeholder: notificationRoot.modelData.inlineReplyPlaceholder
                    }
                }
            }
        }
    }
}
