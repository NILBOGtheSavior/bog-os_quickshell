import QtQuick
import QtQuick.Layouts
import Quickshell
import qs.config
import qs.services
import qs.widgets.bar

Variants {
    model: Quickshell.screens

    PanelWindow {
        id: root
        required property var modelData
        screen: modelData

        implicitHeight: 30
        // color: "transparent"
        color: Colors.background

        Component.onCompleted: {
            Global.bar = root;
        }

        anchors {
            left: true
            top: true
            right: true
        }

        RowLayout {
            Layout.fillHeight: true
            SystemMenu {
                anchors.centerIn: parent
            }
        }

        Clock {}
    }
}
