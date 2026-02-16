import QtQuick
import Quickshell
import Quickshell.Hyprland
import qs.ui
import qs.widgets.controlpanel

PanelWindow {
    id: root
    visible: false
    exclusionMode: ExclusionMode.Normal
    anchors {
        top: true
        left: true
        bottom: true
    }
    margins {
        left: 5
        top: 5
        bottom: 5
    }
    implicitWidth: 300
    color: "transparent"
    Container {
        anchors.fill: parent
        QuickToggles {}
    }
    GlobalShortcut {
        name: "controlpanel"
        description: "Toggle control panel"
        onPressed: {
            if (Hyprland.focusedMonitor && Hyprland.focusedMonitor.name === screen.name) {
                root.visible = !root.visible;
            }
        }
    }
}
