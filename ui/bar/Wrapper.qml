import QtQuick

Rectangle {
    color: 'transparent'

    HoverHandler {
        id: pointer
        acceptedDevices: PointerDevice.AllDevices
        cursorShape: Qt.PointingHandCursor
    }
}
