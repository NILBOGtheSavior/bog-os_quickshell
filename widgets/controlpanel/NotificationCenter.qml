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
    ScrollView {
        Layout.maximumHeight: 200
        Layout.fillWidth: true
        ColumnLayout {
            anchors.fill: parent
            spacing: Styles.spacing
            Repeater {
                model: Notifications.trackedNotifications
                delegate: notification
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
                        text: Utils.truncateString(root.modelData.body, 25)
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
