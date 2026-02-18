import QtQuick
import QtQuick.Layouts
import qs.config
import qs.services
import qs.ui.controlpanel

GridLayout {
    columns: 3
    rowSpacing: Styles.padding * 2
    columnSpacing: Styles.padding * 2

    QuickToggle {
        icon: "󰀂"
        text: "Network"
    }
    QuickToggle {
        active: VPN.connected
        icon: "󰖂"
        text: "VPN"
        onClicked: {
            VPN.toggleVpn();
        }
        Component.onCompleted: VPN.checkStatus()
    }
    QuickToggle {
        icon: ""
        text: "Bluetooth"
    }
    QuickToggle {
        active: Global.dnd
        icon: ""
        text: "DND"
        onClicked: {
            Global.dnd = !Global.dnd;
        }
    }
    QuickToggle {
        icon: "󰖨"
        text: "Night Light"
    }
    QuickToggle {
        icon: ""
        text: "Dark Mode"
    }
}
