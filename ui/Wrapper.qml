import QtQuick

// import QtQuick.Layouts

Rectangle {
    color: 'transparent'
    // anchors.fill: parent
    // Layout.preferredWidth: children.implicitWidth + 10

    HoverHandler {
        id: pointer
        acceptedDevices: PointerDevice.AllDevices
        cursorShape: Qt.PointingHandCursor
    }
}
