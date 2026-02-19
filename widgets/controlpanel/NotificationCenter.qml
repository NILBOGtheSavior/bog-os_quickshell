import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
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
        Button {
            font: Fonts.small
            text: "Clear"
            onClicked: Notifications.clearAllNotifications()
        }
    }
    Container {
        implicitHeight: 250
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
                    Label {
                        id: placeholder
                        anchors.centerIn: parent
                        color: Colors.background
                        font: Fonts.medium_bold
                        text: "No unread notifications"
                    }
                }

                Repeater {
                    model: Notifications.trackedNotifications
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
            implicitHeight: layout.implicitHeight
            Layout.fillWidth: true
            RowLayout {
                id: layout
                anchors.fill: parent
                IconImage {
                    width: 25
                    height: 25
                    Layout.leftMargin: Styles.padding
                    Layout.topMargin: Styles.padding * 2
                    Layout.alignment: Qt.AlignTop
                    source: root.modelData.image
                }
                ColumnLayout {
                    Layout.fillWidth: true
                    Label {
                        Layout.topMargin: Styles.padding
                        font: Fonts.medium_bold
                        text: root.modelData.summary
                    }
                    Label {
                        Layout.bottomMargin: Styles.padding
                        Layout.preferredWidth: 225
                        wrapMode: Text.WordWrap
                        text: root.modelData.body
                    }
                }
                LabelButton {
                    Layout.rightMargin: Styles.padding
                    font: Fonts.large
                    text: "󰅙"
                    onClicked: root.modelData.dismiss()
                }
            }
        }
    }
}
