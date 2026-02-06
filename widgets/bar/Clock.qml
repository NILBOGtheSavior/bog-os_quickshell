import QtQuick
import QtQuick.Layouts
import qs.services
import qs.ui

RowLayout {
    anchors.centerIn: parent
    spacing: 10
    Label {
        text: Time.date_short
    }
    Label {
        text: Time.time
    }
}
