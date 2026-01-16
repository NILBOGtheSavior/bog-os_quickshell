import QtQuick
import QtQuick.Layouts
import Quickshell
import qs.ui
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

    implicitWidth: 310

    Container {
        anchors.fill: parent

        ColumnLayout {
            anchors.fill: parent
            // Layout.fillWidth: true
            Audio {
                Layout.alignment: Qt.AlignCenter
            }
        }
    }
}
