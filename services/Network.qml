pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Networking

Singleton {
    id: root

    property var devices: Networking.devices.values
}
