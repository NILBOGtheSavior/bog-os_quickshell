//  Network.qml

import QtQuick
import QtQuick.Layouts
import Quickshell
import qs.ui.bar

Item {
    Layout.fillHeight: true
    Layout.preferredWidth: label.implicitWidth + 10

    Label {
        id: label
        anchors.centerIn: parent
        text: {
            const icons = {
                4: "󰤨",
                3: "󰤥",
                2: "󰤢",
                1: "󰤟",
                0: "󰤮"
            };
            return icons[4];
        }
    }
}
