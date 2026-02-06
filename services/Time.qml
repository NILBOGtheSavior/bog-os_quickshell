pragma Singleton

import Quickshell
import QtQuick

Singleton {
    id: root
    readonly property string time: {
        Qt.formatDateTime(clock.date, "hh:mm AP");
    }
    readonly property string date_full: {
        Qt.formatDateTime(clock.date, "dddd MMMM d");
    }

    readonly property string time24: {
        Qt.formatTime(clock.date, "HH:mm");
    }

    SystemClock {
        id: clock
        precision: SystemClock.Minutes
    }
}
