import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import qs.config

ColumnLayout {
    RowLayout {}
    DayOfWeekRow {
        locale: grid.locale

        Layout.fillWidth: true

        delegate: Text {
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            text: shortName
            font.weight: 800
            color: Colors.foreground

            required property string shortName
        }
    }
    MonthGrid {
        id: grid
        month: Calendar.January
        year: 2026
        locale: Qt.locale("en_US")

        Layout.fillWidth: true
        Layout.fillHeight: true

        delegate: Text {
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            opacity: model.today ? 1.0 : 0.5
            text: model.day
            // font.family:
            color: Colors.foreground

            required property var model
        }
    }
}
