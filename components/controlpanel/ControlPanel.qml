import QtQuick
import QtQuick.Layouts
import Quickshell
import qs.ui.controlpanel
import qs.widgets.controlpanel

PanelWindow {
    id: root
    visible: true
    color: "transparent"

    anchors {
        top: true
        right: true
        bottom: true
    }

    margins {
        top: 5
        right: 5
        bottom: 5
    }

    implicitWidth: 400

    Container {
        anchors.fill: parent

        Item {
            anchors.left: parent.left
            anchors.right: parent.right
            implicitHeight: layout.implicitHeight

            ColumnLayout {
                id: layout

                anchors.fill: parent

                Media {
                    Layout.alignment: Qt.AlignTop
                }
                Audio {
                    Layout.alignment: Qt.AlignCenter
                }
            }
        }
    }
}
