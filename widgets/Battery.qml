import QtQuick
import QtQuick.Layouts
// import Quickshell
import Quickshell.Services.UPower
import qs.ui

Item {
    Layout.fillHeight: true
    // Layout.fillWidth: true
    Layout.preferredWidth: label.implicitWidth + 10

    // Connections {
    //     target: UPower
    // }
    Label {
        id: label
        anchors.centerIn: parent
        text: `󰁹 ${UPower.displayDevice.percentage * 100}%`
    }
}
