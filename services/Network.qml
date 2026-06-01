pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Networking

Singleton {
    id: root

    property var devices: Networking.devices.values
    property var device: {
        devices.find(device => device.hasLink === true);
    }
    property var connection: {
        device.networks.values.find(network => network.known === true);
    }

    function toggleConnection() {
        if (device.connected)
            connection.disconnect();
        else
            connection.connect();
    }
}
