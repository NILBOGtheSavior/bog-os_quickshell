import QtQuick
import Quickshell.Hyprland
import qs.services
import qs.ui

Label {
    property var activeWindow: Hyprland.activeToplevel
    text: activeWindow ? Utils.truncateString(activeWindow.title, 30) : "BogOS"
}
