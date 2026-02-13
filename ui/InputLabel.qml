import QtQuick
import Quickshell.Wayland
import qs.config
import qs.services

TextInput {
    id: root
    font: Fonts.small
    color: Colors.foreground

    width: 75

    property string placeholder

    onActiveFocusChanged: {
        if (activeFocus) {
            InputManager.grabKeyboardFocus();
            focus = true;
        }
    }

    Keys.onEscapePressed: {
        InputManager.releaseKeyboardFocus();
        focus = false;
    }

    Text {
        id: text
        anchors.fill: root
        text: root.placeholder
        font: Fonts.small
        color: Colors.secondary
        visible: root.text.length === 0 && !root.activeFocus
    }
}
