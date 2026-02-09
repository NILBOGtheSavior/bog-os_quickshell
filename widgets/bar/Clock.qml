import QtQuick
import QtQuick.Layouts
import qs.services
import qs.ui

RowLayout {
    spacing: 10
    Label {
        text: Time.date_full
    }
    Label {
        text: Time.time
    }
}
