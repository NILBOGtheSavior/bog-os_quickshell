pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Services.Pipewire

Singleton {
    id: root

    readonly property var devices: Pipewire.nodes.values.reduce((acc, node) => {
            if (!node.isStream) {
                if (node.isSink)
                    acc.output.push(node);
                else if (node.audio)
                    acc.input.push(node);
            }
            return acc;
        }, {
            output: [],
            input: []
        })

    function testAudio() {
        for (let device of devices.output) {
            console.log(device.description)
        }
    }
}
