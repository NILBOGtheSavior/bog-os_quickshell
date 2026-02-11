pragma Singleton

import Quickshell
import QtQuick

Singleton {
    id: root

    readonly property var clock: clock

    readonly property string time: {
        Qt.formatDateTime(clock.date, "hh:mm AP");
    }
    readonly property string date_full: {
        Qt.formatDateTime(clock.date, "dddd MMMM d");
    }
    readonly property string date_short: {
        Qt.formatDateTime(clock.date, "ddd");
    }
    readonly property string date_concat: {
        Qt.formatDateTime(clock.date, "yyyy/MM/dd");
    }
    readonly property string time24: {
        Qt.formatTime(clock.date, "HH:mm");
    }

    readonly property int day: clock.date.getDate()
    readonly property int month: clock.date.getMonth()
    readonly property int year: clock.date.getFullYear()

    SystemClock {
        id: clock
        precision: SystemClock.Minutes
    }
}
