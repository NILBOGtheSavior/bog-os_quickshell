import QtQuick
import QtQuick.Layouts
import qs.ui
import qs.state

Container {
    Layout.preferredWidth: label.implicitWidth + 10
    // Layout.fillHeight: true

    Label {
        id: label
        anchors.centerIn: parent
        text: Time.time
    }
}
