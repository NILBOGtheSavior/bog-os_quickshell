import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland
import qs.ui
import qs.ui.bar

Item {
    Layout.fillHeight: parent
    implicitWidth: label.implicitWidth

    Label {
        id: label
        anchors.centerIn: parent

        text: "BogOS"
    }
}
