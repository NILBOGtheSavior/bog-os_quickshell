import QtQuick
import QtQuick.Effects
import QtQuick.Layouts
import Quickshell
import Quickshell.Hyprland
import qs.config
import qs.ui
import qs.widgets.controlpanel

PanelWindow {
    id: root
    visible: false
    // exclusionMode: ExclusionMode.Normal
    exclusiveZone: implicitWidth - 5
    Component.onCompleted: {
        Global.controlPanel = root;
    }
    anchors {
        top: true
        right: true
        bottom: true
    }
    implicitWidth: 350
    // implicitHeight: layout.implicitHeight + Styles.padding * 4
    color: "transparent"
    Container {
        layer.enabled: true
        layer.effect: MultiEffect {
            shadowEnabled: true
            shadowColor: Colors.shadow
            shadowBlur: 0.4
        }

        anchors {
            fill: parent
            margins: 5
        }

        ColumnLayout {
            id: layout
            spacing: Styles.spacing
            anchors {
                leftMargin: 10
                rightMargin: 10
                topMargin: 10
                bottomMargin: 10
                top: parent.top
                left: parent.left
                right: parent.right
            }

            Dashboard {}
            QuickToggles {}
            MediaController {}
            NotificationCenter {}
            AudioCenter {}
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
