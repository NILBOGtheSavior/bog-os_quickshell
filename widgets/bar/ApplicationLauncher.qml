pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import Quickshell
import Quickshell.Hyprland
import qs.config
import qs.services
import qs.ui

RowLayout {
    id: root
    property var filteredApps: []
    property bool searchActive: false

    function updateFilter() {
        var apps = [];
        var searchTerm = inputLabel.text.toLowerCase();
        var allApps = DesktopEntries.applications.values;
        for (var i = 0; i < allApps.length; i++) {
            var app = allApps[i];
            if (!searchTerm || app.name.toLowerCase().includes(searchTerm)) {
                apps.push(app);
            }
        }
        filteredApps = apps;
    }

    Component.onCompleted: updateFilter()

    LabelButton {
        text: ""
        onClicked: {
            root.searchActive = true;
            popup.visible = true;
            grab.active = true;
            Qt.callLater(() => {
                inputLabel.forceActiveFocus();
            });
        }
    }

    InputLabel {
        id: inputLabel
        visible: root.searchActive
        placeholder: "Search"
        onTextChanged: root.updateFilter()

        Keys.onEscapePressed: {
            root.searchActive = false;
            text = "";
            popup.visible = false;
        }
    }

    PopupWindow {
        id: popup
        visible: false
        anchor.item: inputLabel
        anchor.rect.y: inputLabel.height + Styles.padding
        color: "transparent"
        implicitWidth: 300
        implicitHeight: 300

        Container {
            anchors.fill: parent

            ScrollView {
                anchors.fill: parent

                ColumnLayout {
                    id: listView

                    Repeater {
                        model: root.filteredApps
                        delegate: applicationEntry
                    }
                }
            }
        }

        HyprlandFocusGrab {
            id: grab
            windows: [Global.bar, popup]
            onCleared: {
                root.searchActive = false;
                inputLabel.text = "";
                popup.visible = false;
            }
        }
    }

    Component {
        id: applicationEntry

        LabelButton {
            id: button
            required property var modelData
            Layout.leftMargin: 10
            Layout.fillWidth: true

            text: Utils.truncateString(button.modelData.name, 25)
            icon: Quickshell.iconPath(button.modelData.icon, "application-x-executable")

            onClicked: {
                button.modelData.execute();
                root.searchActive = false;
                inputLabel.text = "";
                popup.visible = false;
            }
        }
    }
}
