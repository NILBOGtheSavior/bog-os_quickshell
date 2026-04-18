import QtQuick
import QtQuick.Layouts
import qs.config
import qs.ui

Container {
    id: root

    property alias input: passwordInput

    Layout.alignment: Qt.AlignHCenter
    color: Colors.surface
    implicitWidth: inputLayout.width + 10
    implicitHeight: inputLayout.height + 10
    RowLayout {
        id: inputLayout
        anchors.centerIn: parent
        InputLabel {
            id: passwordInput
            Layout.minimumWidth: 150
            echoMode: TextInput.Password
            cursorVisible: false
            font: Fonts.large
            placeholder: "password"
        }
        Label {
            text: ""
        }
    }
}
