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
        text: {
            const icons = {
                1: {
                    100: "󰂅 ",
                    90: "󰂋 ",
                    80: "󰂊 ",
                    70: "󰢞 ",
                    60: "󰂉 ",
                    50: "󰢝 ",
                    40: "󰂈 ",
                    30: "󰂇 ",
                    20: "󰂆 ",
                    10: "󰢜 ",
                    0: "󰢟 "
                },
                2: {
                    100: "󰁹",
                    90: "󰂂",
                    80: "󰂁",
                    70: "󰂀",
                    60: "󰁿",
                    50: "󰁾",
                    40: "󰁽",
                    30: "󰁼",
                    20: "󰁻",
                    10: "󰁺",
                    0: "󰂃"
                },
                4: "󰂄"
            };
            var percentage = Math.round(UPower.displayDevice.percentage * 100);
            var state = UPower.displayDevice.state;
            var key = percentage - (percentage % 10);
            var icon = "";
            switch (state) {
                case 1:
                case 2:
                icon = icons[state][key];
                break;
                case 3:
                icon = "IDK";
                break;
                case 4:
                icon = icons[state];
                break;
            }
            // var icon = "";
            return `${icon} ${percentage}%`;
        }
    }
}
