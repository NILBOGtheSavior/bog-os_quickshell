import QtQuick
import QtQuick.Effects
import Quickshell
import Quickshell.Widgets
import qs.config
import qs.ui

LabelButton {
    id: root
    font: Fonts.bogos

    onClicked: {
        menu.visible = !menu.visible;
        menu.grab.active = !menu.grab.active;
    }

    IconImage {
        source: "root:/assets/cat.svg"
        width: 30
        height: 30
        layer.enabled: true
        layer.effect: MultiEffect {
            brightness: 1.0
            colorization: 1.0
            colorizationColor: Colors.foreground
        }
    }

    DropdownMenu {
        id: menu
        anchor.item: root
        anchor.edges: Edges.Top
        anchor.gravity: Edges.Top

        menuItems: [
            {
                title: "   Info",
                command: ["kitty", "--hold", "-e", "fastfetch"]
            },
            {
                title: "󰍷   Suspend",
                command: ["systemctl", "suspend"]
            },
            {
                title: "   Lock",
                command: ["hyprctl", "dispatch", "global", "quickshell:lockscreen"]
            },
            {
                title: "󰿅   Logout",
                command: ["hyprctl", "dispatch", "exit"]
            },
            {
                title: "   Restart",
                command: ["systemctl", "reboot"]
            },
            {
                title: "󰤆   Shutdown",
                command: ["systemctl", "poweroff"]
            }
        ]
    }
}
