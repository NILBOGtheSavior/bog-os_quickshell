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
                acc.outputs.push(node);
            else if (node.audio)
                acc.inputs.push(node);
        }
        return acc;
    }, {
        outputs: [],
        inputs: []
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

    function setInputVolume(vol) {
        default_input.audio.muted = false;
        default_input.audio.volume = vol;
    }

    function toggleOutputMute() {
        default_output.audio.muted = !default_output.audio.muted;
    }

    function toggleInputMute() {
        default_input.audio.muted = !default_input.audio.muted;
    }

    PwObjectTracker {
        objects: [...root.devices.outputs, ...root.devices.inputs]
    }
}
