pragma Singleton

import QtQuick
import Quickshell

Singleton {
    function truncateString(string, length) {
        if (string.length > length)
            return `${string.slice(0, length - 1)}...`;
        else
            return string;
    }
}
