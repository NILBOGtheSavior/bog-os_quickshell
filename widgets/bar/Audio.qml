import QtQuick
import qs.ui
import qs.services

Item {
    Component.onCompleted: Audio.testAudio()

    Label {
        anchors.centerIn: parent
        text: ""
    }
}
