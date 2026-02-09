import QtQuick
import Quickshell
import Quickshell.Hyprland
import qs.config
import qs.ui

IconButton {
    id: root
    radius: 15
    font: Fonts.bogos
    text: ''

    onClicked: {
        menu.visible = !menu.visible;
        menu.grab.active = !menu.grab.active;
    }

    DropdownMenu {
        id: menu
        anchor.window: Global.bar
        anchor.rect.x: root.x
        anchor.rect.y: root.y + Global.bar.height

        menuItems: [
            {
                title: "   Info",
                command: ["kitty", "--hold", "-e", "fastfetch"]
            },
            {
                title: "󰤄   Suspend",
                command: ["systemctl", "suspend"]
            },
            {
                title: "   Lock",
                command: ["hyprlock"]
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
                title: "⏻   Shutdown",
                command: ["systemctl", "poweroff"]
            }
        ]
    }
}
