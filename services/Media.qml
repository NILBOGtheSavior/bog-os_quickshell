pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Services.Mpris

Singleton {
    id: root

    readonly property list<MprisPlayer> players: Mpris.players.values

    Timer {
        running: MprisPlaybackState.Playing
        interval: 1000
        repeat: true
        onTriggered: {
            for (let player of root.players)
                if (player.playbackState == MprisPlaybackState.Playing)
                    player.positionChanged();
        }
    }
}
