import QtQuick
import QtQuick.Layouts
import Quickshell.Widgets
import qs.ui.controlpanel

Container {
    id: root

    required property var objectModel

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
            visible: icon.source !== ""
            width: 50
            height: 50
            source: root.objectModel.image
        }
        ColumnLayout {
            Layout.fillWidth: true
            RowLayout {
                Label {
                    Layout.topMargin: 10
                    Layout.leftMargin: 10
                    text: root.objectModel.appName
                    font.weight: 800
                }
                Label {
                    Layout.topMargin: 10
                    text: root.objectModel.summary
                }
            }
            Label {
                Layout.leftMargin: 10
                Layout.bottomMargin: 10
                text: root.objectModel.body
            }
        }
        IconButton {
            Layout.alignment: Qt.AlignRight
            Layout.rightMargin: 10
            text: ""
            onClicked: {
                root.objectModel.dismiss();
            }
        }
    }
}
