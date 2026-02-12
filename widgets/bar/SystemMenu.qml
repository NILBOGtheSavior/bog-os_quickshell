import QtQuick
import Quickshell
import Quickshell.Hyprland
import qs.config
import qs.ui

LabelButton {
    id: root
    font: Fonts.bogos
    text: ''

    onClicked: {
        menu.visible = !menu.visible;
        menu.grab.active = !menu.grab.active;
    }

    DropdownMenu {
        id: menu
        anchor.item: root
        anchor.rect.x: root.x - Styles.padding * 2
        anchor.rect.y: root.height + Styles.padding

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
                title: "󰤆   Shutdown",
                command: ["systemctl", "poweroff"]
            }
        ]
    }
}
