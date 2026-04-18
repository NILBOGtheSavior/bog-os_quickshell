import QtQuick
import QtQuick.Layouts
import qs.config
import qs.ui
import qs.services

RowLayout {
    spacing: 25
    ColumnLayout {
        Label {
            font: Fonts.xlarge
            text: Time.time
        }
        Label {
            font: Fonts.small
            text: Time.date_full
        }
    }
    Item {
        Layout.fillWidth: true
    }
    ColumnLayout {
        Label {
            visible: Weather.unit
            Layout.alignment: Qt.AlignRight
            font: Fonts.large
            text: `${Weather.temperature}${Weather.unit} ${Weather.icon}`
        }
        Label {
            Layout.alignment: Qt.AlignRight
            font: Fonts.small
            color: Colors.hover
            text: Weather.description
        }
    }
}
