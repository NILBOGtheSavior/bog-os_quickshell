import QtQuick
import QtQuick.Layouts
import Quickshell.Widgets
import qs.ui
import qs.ui.controlpanel
import qs.config
import qs.services

Container {
    id: root

    required property var objectModel
    required property string time

    implicitHeight: layout.implicitHeight
    Layout.leftMargin: 10
    Layout.rightMargin: 10

    RowLayout {
        id: layout
        anchors.fill: parent
        IconImage {
            id: icon
            Layout.topMargin: 10
            Layout.leftMargin: 10
            Layout.bottomMargin: 10
            Layout.alignment: Qt.AlignTop
            visible: icon.source != ""
            width: 50
            height: 50
            source: root.objectModel.image
        }
        ColumnLayout {
            Layout.fillWidth: true
            Label {
                Layout.topMargin: 10
                Layout.leftMargin: 10
                text: root.objectModel.appName
                font.weight: 800
            }
            Label {
                Layout.leftMargin: 10
                text: {
                    if (icon.visible)
                        Utils.truncateString(root.objectModel.summary, 25);
                    else
                        Utils.truncateString(root.objectModel.summary, 30);
                }
            }
            Label {
                Layout.leftMargin: 10
                Layout.bottomMargin: 10
                Layout.maximumWidth: {
                    if (icon.visible)
                        250;
                    else
                        300;
                }
                wrapMode: Text.Wrap
                text: root.objectModel.body
                font.italic: true
            }
        }
        ColumnLayout {
            IconButton {
                Layout.alignment: Qt.AlignTop
                Layout.topMargin: 10
                Layout.rightMargin: 10
                text: ""
                onClicked: {
                    root.objectModel.dismiss();
                }
            }
            Label {
                color: Colors.secondary
                text: root.time
                font.pixelSize: 10
            }
        }
    }
}
