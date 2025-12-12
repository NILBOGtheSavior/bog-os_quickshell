// Label.qml

import QtQuick
import QtQuick.Layouts

Rectangle {
    id: root

    property bool active: true
    property string text: ""
    property font font

    signal clicked

    implicitWidth: label.implicitWidth + 5
    // Layout.preferredWidth: label.implicitWidth
    Layout.fillHeight: true

    // Layout.fillWidth: true

    color: 'transparent'

    border.width: 2
    border.color: 'green'

    Text {
        id: label
        color: 'white'
        text: root.text
        font: root.font
        anchors.centerIn: parent
    }
}
