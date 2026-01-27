import QtQuick
import QtQuick.Layouts
import Quickshell
import qs.ui.bar

Button {
    id: menubutton
    font: "BogOS"
    text: ''

    onClicked: {
        dropdown.visible = !dropdown.visible;
    }

    DropdownMenu {
        id: dropdown

        anchor.window: root
        anchor.rect.x: menubutton.x
        anchor.rect.y: menubutton.y + menubutton.height

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
                command: ["systemctl", "shutdown"]
            }
        ]
    }
}
