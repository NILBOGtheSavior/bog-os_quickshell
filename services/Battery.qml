pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Services.UPower

Singleton {

    property bool hasBattery: UPower.devices.length > 0

    property int percentage: Math.round(UPower.displayDevice.percentage * 100)
    property int emptyIn: UPower.displayDevice.timeToEmpty
    property int fullIn: UPower.displayDevice.timeToFull
    property int state: UPower.displayDevice.state

    function getPercentage(): string {
        if (state != 4)
            return `${percentage}%`;
        else
            return "";
    }

    function getIcon(): string {
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

        var key = percentage - (percentage % 10);

        switch (state) {
        case 0:
            return icons["unknown"];
        case 1:
            return icons["charging"][key];
        case 2:
            return icons["discharging"][key];
        case 3:
            return "IDK";
        case 4:
            return icons["full"];
        case 5:
        case 6:
            return icons["pending"];
        }
    }
}
