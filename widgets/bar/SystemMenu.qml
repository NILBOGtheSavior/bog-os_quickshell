import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Hyprland
import qs.components
import qs.ui.bar

Button {
    id: menubutton
    font: "BogOS"
    text: ''

    onClicked: {
        dropdown.visible = !dropdown.visible;
        grab.active = !grab.active;
    }

    DropdownMenu {
        id: dropdown

        anchor.window: WindowManager.bar
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
                command: ["systemctl", "poweroff"]
            }
        ]

        HyprlandFocusGrab {
            id: grab
            windows: [dropdown]

            onCleared: {
                dropdown.visible = false;
            }
        }
    }
}
