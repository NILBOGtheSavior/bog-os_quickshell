pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Services.Mpris

Singleton {
    id: root

    readonly property list<MprisPlayer> players: Mpris.players.values

    function updatePlayers() {
        console.log(players[0].trackArtUrl);
    }

    function testMedia() {
        console.log(players[0].trackArtUrl);
    }
}
