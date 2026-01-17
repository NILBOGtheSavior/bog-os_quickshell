import QtQuick
import QtQuick.Layouts
import qs.ui.bar
import qs.services

Item {
    Layout.preferredWidth: label.implicitWidth + 10

    Label {
        id: label
        anchors.centerIn: parent
        text: Time.date + "   " + Time.time
    }
}
