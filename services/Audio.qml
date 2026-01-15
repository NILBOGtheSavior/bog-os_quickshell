pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Services.Pipewire

Singleton {
    id: root

    property var default_output: Pipewire.defaultAudioSink
    property var default_input: Pipewire.defaultAudioSource

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
        console.log("Default: " + default_output.audio.volume);
    }

    function setOutputDevice() {
    }

    function setInputDevice() {
    }

    function setOutputVolume(vol) {
        default_output.audio.muted = false;
        default_output.audio.volume = vol;
    }

    function setInputVolume() {
    }

    PwObjectTracker {
        objects: [root.devices.output, root.devices.input]
    }
}
