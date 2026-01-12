import QtQuick
import QtQuick.Layouts
import qs.ui
import qs.services

Item {
    Layout.fillHeight: true
    Layout.preferredWidth: label.implicitWidth + 10

    Label {
        id: label
        anchors.centerIn: parent
        text: `${Battery.getIcon()} ${Battery.getPercentage()}`
    }
}
