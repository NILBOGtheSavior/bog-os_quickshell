import QtQuick

Rectangle {
    id: root

    anchors.fill: parent

    property bool active
    property string text: ""

    signal clicked

    MouseArea {
        property bool disabled

        anchors.fill: parent

        function onClicked() {
            // if (root.active)
            console.log("Hello World");
            // root.clicked();
        }
    }

    Text {
        id: labelText
        color: 'white'
        text: parent.text
        anchors.centerIn: parent
    }
}
