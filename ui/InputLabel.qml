import QtQuick
import qs.config
import qs.services

TextInput {
    id: root
    font: Fonts.medium
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
        font: root.font
        color: Colors.hover
        visible: root.text.length === 0 && !root.activeFocus
    }
}
