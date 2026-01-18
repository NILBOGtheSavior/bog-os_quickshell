import QtQuick
import QtQuick.Layouts
import Quickshell
import qs.ui.controlpanel
import qs.widgets.controlpanel

PanelWindow {
    id: root
    visible: false
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

    Item {
        anchors.fill: parent

        Item {
            anchors.left: parent.left
            anchors.right: parent.right
            implicitHeight: layout.implicitHeight

            ColumnLayout {
                id: layout

                anchors.fill: parent

                Media {}
                Audio {}
            }
        }
    }
}
