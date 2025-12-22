import QtQuick
import QtQuick.Layouts
import qs.ui
import qs.state

Item {
    Layout.preferredWidth: label.implicitWidth + 10

    Label {
        id: label
        anchors.centerIn: parent
        text: Time.date + "   " + Time.time
    }
}
