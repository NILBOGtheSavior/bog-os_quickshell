import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell
import qs.config
import qs.services
import qs.ui

LabelButton {
    id: root
    text: Time.date_full

    onClicked: {
        calendar.visible = !calendar.visible;
    }

    PopupWindow {
        id: calendar
        anchor.item: root
        anchor.rect.y: Global.bar.height

        implicitWidth: layout.width
        implicitHeight: layout.height

        color: "transparent"

        Container {
            anchors.fill: parent

            ColumnLayout {
                id: layout
                DayOfWeekRow {

                    Layout.leftMargin: 10
                    Layout.rightMargin: 10
                }
                MonthGrid {
                    id: grid
                    month: Calendar.February
                    year: 2026
                    locale: Qt.locale("en_US")

                    Layout.leftMargin: 10
                    Layout.rightMargin: 10

                    Layout.fillWidth: true
                    Layout.fillHeight: true
                }
            }
        }
    }
}
