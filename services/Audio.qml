pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Services.Pipewire

Singleton {
    id: root

    property var default_output: Pipewire.defaultAudioSink
    property var default_input: Pipewire.defaultAudioSource

    readonly property var devices: Pipewire.nodes.values.reduce((acc, node) => {
        if (node.isStream)
            acc.streams.push(node);
        else if (node.isSink) {
            acc.outputs.push(node);
        } else if (node.audio)
            acc.inputs.push(node);

        return acc;
    }, {
        streams: [],
        outputs: [],
        inputs: []
    })

    function setDevice(input, node) {
        if (input)
            Pipewire.preferredDefaultAudioSource = node;
        else
            Pipewire.preferredDefaultAudioSink = node;
    }

    function setVolume(device, vol) {
        device.audio.muted = false;
        device.audio.volume = vol;
    }

    function toggleMute(device) {
        device.audio.muted = !device.audio.muted;
    }

    PwObjectTracker {
        objects: [...root.devices.streams, ...root.devices.outputs, ...root.devices.inputs]
    }
}
