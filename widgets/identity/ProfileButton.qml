import QtQuick
import QtQuick.Layouts
import qs.ui

Button {
    id: root
    property var user

    required property var modelData
    RowLayout {
        id: userButton
        ProfileIcon {
            Layout.alignment: Qt.AlignHCenter
            size: 50
            user: root.modelData
        }

        Label {
            text: root.modelData
        }
    }
}
