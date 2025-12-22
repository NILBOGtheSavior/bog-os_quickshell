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
                "charging": {
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
                "discharging": {
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
                "full": "󰂄",
                "pending": "󱧥",
                "unknown": "󰂑"
            };
            var percentage = `${Math.round(UPower.displayDevice.percentage * 100)}%`;
            var state = UPower.displayDevice.state;
            var info = UPower.displayDevice.iconName;
            var key = percentage - (percentage % 10);
            var icon = "";
            switch (state) {
            case 0:
                icon = icons["unknown"];
                break;
            case 1:
                icon = icons["charging"][key];
                break;
            case 2:
                icon = icons["discharging"][key];
                break;
            case 3:
                icon = "IDK";
                break;
            case 4:
                icon = icons["full"];
                percentage = "";
                break;
            case 5:
            case 6:
                icon = icons["pending"];
                break;
            }

            // var icon = "";
            return `${icon} ${percentage}`;
            // <${info}, ${state}>
        }
    }
}
