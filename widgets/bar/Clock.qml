import QtQuick
import QtQuick.Layouts
import qs.services
import qs.ui

RowLayout {
    anchors.centerIn: parent
    spacing: 20
    Label {
        text: Time.date
    }
    Label {
        text: Time.time
    }
}
