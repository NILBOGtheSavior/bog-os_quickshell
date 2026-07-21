import QtQuick
import QtQuick.Effects
import Quickshell
import Quickshell.Widgets
import qs.config
import qs.ui
import qs.components

LabelButton {
    id: root

    onClicked: {
        menu.visible = !menu.visible;
    }

    IconImage {
        source: "root:/assets/cat.svg"
        width: 30
        height: 30
        layer.enabled: true
        layer.effect: MultiEffect {
            brightness: 1.0
            colorization: 1.0
            colorizationColor: Colors.foreground
        }
    }

    AppMenu {
        id: menu
        anchor.item: root
        anchor.edges: Edges.Top
        anchor.gravity: Edges.Top
    }
}
