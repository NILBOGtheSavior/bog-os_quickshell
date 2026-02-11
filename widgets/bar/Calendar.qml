pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell
import Quickshell.Hyprland
import qs.config
import qs.services
import qs.ui

LabelButton {
    id: root
    text: Time.date_full

    property int currentMonth: Time.month
    property int currentYear: Time.year

    onClicked: {
        calendar.visible = !calendar.visible;
        calendar.grab.active = !calendar.grab.active;
    }

    PopupWindow {
        id: calendar

        property var grab: grab

        anchor.item: root
        anchor.rect.y: Global.bar.height

        implicitWidth: layout.width
        implicitHeight: layout.height

        color: "transparent"

        Container {
            anchors.fill: parent

            ColumnLayout {
                id: layout

                RowLayout {

                    Layout.topMargin: 10
                    Layout.fillWidth: true
                    Layout.fillHeight: true

                    LabelButton {
                        Layout.leftMargin: Styles.padding * 3
                        text: ""
                        font: Fonts.large
                        onClicked: {
                            root.currentMonth--;
                            if (root.currentMonth < 0) {
                                root.currentMonth = 11;
                                root.currentYear--;
                            }
                        }
                    }

                    Label {
                        Layout.fillWidth: true
                        Layout.alignment: Qt.AlignCenter
                        horizontalAlignment: Text.AlignHCenter
                        font: Fonts.large
                        text: {
                            var date = new Date(root.currentYear, root.currentMonth, 1);
                            return Qt.formatDateTime(date, "MMMM yyyy");
                        }
                    }

                    LabelButton {
                        Layout.rightMargin: Styles.padding * 3
                        text: ""
                        font: Fonts.large
                        onClicked: {
                            root.currentMonth++;
                            if (root.currentMonth > 11) {
                                root.currentMonth = 0;
                                root.currentYear++;
                            }
                        }
                    }
                }

                DayOfWeekRow {

                    Layout.leftMargin: 10
                    Layout.rightMargin: 10
                    delegate: Text {
                        required property string shortName
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        text: shortName
                        font: Fonts.medium_bold
                        color: Colors.accent1

                        required property var model
                    }
                }
                MonthGrid {
                    id: grid
                    locale: Qt.locale("en_US")

                    Layout.leftMargin: 10
                    Layout.rightMargin: 10
                    Layout.bottomMargin: 10

                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    month: root.currentMonth
                    year: root.currentYear
                    delegate: Text {
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        opacity: model.month === root.currentMonth ? 1 : 0.25
                        text: model.day
                        font: model.day == Time.day && model.month === Time.month ? Fonts.medium_bold : Fonts.medium
                        color: model.day == Time.day && model.month === Time.month ? Colors.accent1 : Colors.foreground

                        required property var model
                    }
                }
            }
        }
        HyprlandFocusGrab {
            id: grab
            windows: [Global.bar, calendar]

            onCleared: {
                calendar.visible = false;
            }
        }
    }
}
