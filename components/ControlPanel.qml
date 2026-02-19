import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Hyprland
import qs.config
import qs.ui
import qs.widgets.controlpanel

PanelWindow {
    id: root
    visible: true
    // exclusionMode: ExclusionMode.Normal
    Component.onCompleted: {
        Global.controlPanel = root;
    }
    anchors {
        top: true
        right: true
        // bottom: true
    }
    margins {
        right: 5
        top: 5
        bottom: 5
    }
    implicitWidth: 350
    implicitHeight: layout.implicitHeight + Styles.padding * 4
    color: "transparent"
    Container {
        anchors.fill: parent
        ColumnLayout {
            id: layout
            anchors {
                fill: parent
                leftMargin: 10
                rightMargin: 10
                topMargin: 10
                bottomMargin: 10
            }
            Dashboard {}
            QuickToggles {}
            NotificationCenter {}
        }
    }
    GlobalShortcut {
        name: "controlpanel"
        description: "Toggle control panel"
        onPressed: {
            root.visible = !root.visible;
        }
    }
}
