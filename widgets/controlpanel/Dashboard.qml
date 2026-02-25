import QtQuick
import QtQuick.Layouts
import qs.services
import qs.config
import qs.ui

RowLayout {
    id: root

    Layout.leftMargin: Styles.padding
    Layout.rightMargin: Styles.padding
    Layout.bottomMargin: Styles.padding * 2
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
