import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell
import Quickshell.Widgets
import qs.config
import qs.services
import qs.ui

ColumnLayout {
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
        implicitHeight: 300
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
            id: root
            required property var modelData
            Layout.fillWidth: true
            implicitHeight: layout.implicitHeight + Styles.padding * 2
            ColumnLayout {
                id: layout
                implicitWidth: root.width
                Rectangle {
                    Layout.fillWidth: true
                    Layout.leftMargin: 1
                    Layout.topMargin: 1
                    Layout.rightMargin: 1
                    implicitHeight: title.implicitHeight
                    topLeftRadius: Styles.radius / 2
                    topRightRadius: Styles.radius / 2
                    color: {
                        switch (root.modelData.urgency) {
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
                            source: Quickshell.iconPath(root.modelData.appIcon, "start-here-symbolic")
                        }
                        Label {

                            color: Colors.background
                            font: Fonts.medium_bold
                            text: root.modelData.summary
                        }
                        Label {
                            visible: false
                            text: root.modelData.expireTimeout
                        }
                        Label {
                            Layout.fillWidth: true
                            font: Fonts.small
                            color: Colors.secondary
                            text: root.modelData.lastGeneration ? "" : Notifications.getNotificationTime(root.modelData.id)
                        }
                        LabelButtonDark {
                            Layout.rightMargin: Styles.padding
                            text: "󰅙"
                            onClicked: root.modelData.dismiss()
                        }
                    }
                }
                RowLayout {
                    Layout.fillWidth: true
                    IconImage {
                        id: notificationImage
                        visible: source != ""
                        Layout.alignment: Qt.AlignTop
                        Layout.leftMargin: Styles.padding
                        height: 50
                        width: 50
                        source: root.modelData.image
                    }
                    Label {
                        Layout.alignment: Qt.AlignTop
                        Layout.leftMargin: Styles.padding
                        Layout.preferredWidth: notificationImage.visible ? 240 : 300
                        wrapMode: Text.WordWrap
                        text: root.modelData.body
                    }
                }

                RowLayout {
                    Layout.leftMargin: Styles.padding * 2
                    Repeater {
                        model: root.modelData.actions
                        delegate: Button {
                            required property var modelData
                            text: modelData.text
                            onClicked: modelData.invoke()
                        }
                    }
                    Button {
                        visible: root.modelData.hasInlineReply
                        text: "Reply"
                    }
                }
                Container {
                    visible: false
                    color: Colors.secondary
                    height: 50
                    width: 300
                    InputLabel {
                        id: inputLabel
                        anchors.fill: parent
                        placeholder: root.modelData.inlineReplyPlaceholder
                    }
                }
            }
        }
    }
}
