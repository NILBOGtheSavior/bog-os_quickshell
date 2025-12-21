import QtQuick
import QtQuick.Layouts
import Quickshell.Services.UPower
import qs.ui

Item {
    Layout.fillHeight: true
    Layout.preferredWidth: label.implicitWidth + 10

    Label {
        id: label
        anchors.centerIn: parent
        text: `󰁹 ${UPower.displayDevice.percentage * 100}%`
    }
}
