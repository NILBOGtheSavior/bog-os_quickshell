pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import Quickshell
import qs.config
import qs.services
import qs.ui

ColumnLayout {
    id: root
    property var filteredApps: []
    property bool searchActive: false
    property int selectionIndex: -1
    height: 35

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

    function scrollToSelected() {
        if (selectionIndex >= 0 && selectionIndex < repeater.count) {
            var item = repeater.itemAt(selectionIndex);
            if (item) {
                var itemY = item.y;
                var itemHeight = item.height;
                var scrollViewHeight = scrollView.height;
                var contentY = scrollView.contentItem.contentY;

                if (itemY + itemHeight > contentY + scrollViewHeight) {
                    scrollView.contentItem.contentY = itemY + itemHeight - scrollViewHeight;
                } else if (itemY < contentY) {
                    scrollView.contentItem.contentY = itemY;
                }
            }
        }
    }

    onSelectionIndexChanged: scrollToSelected()

    function clearSearch() {
        root.searchActive = false;
        inputLabel.text = "";
    }

    Container {
        color: Colors.surface
        radius: 5
        Layout.fillWidth: true
        implicitHeight: 35
        RowLayout {
            id: searchBar
            anchors {
                fill: parent
                leftMargin: 5
            }
            LabelButton {
                id: searchButton
                text: root.searchActive ? "" : ""
                onClicked: {
                    if (root.searchActive) {
                        root.searchActive = false;
                        root.clearSearch();
                    } else
                        inputLabel.forceActiveFocus();
                }
            }
            InputLabel {
                id: inputLabel
                Layout.fillWidth: true
                placeholder: "Search"
                onTextChanged: {
                    root.searchActive = true;
                    root.selectionIndex = -1;
                    root.updateFilter();
                }

                Keys.onEscapePressed: {
                    root.clearSearch();
                }

                Keys.onDownPressed: {
                    if (root.selectionIndex < root.filteredApps.length - 1) {
                        root.selectionIndex++;
                    }
                }

                Keys.onUpPressed: {
                    if (root.selectionIndex > 0) {
                        root.selectionIndex--;
                    }
                }

                Keys.onReturnPressed: {
                    if (root.filteredApps.length > 0) {
                        root.filteredApps[Math.max(root.selectionIndex, 0)].execute();
                        root.clearSearch();
                    }
                }
            }
        }
    }
    Rectangle {
        id: resultsOverlay

        visible: root.searchActive
        Layout.fillWidth: true
        Layout.fillHeight: true

        color: Colors.background

        ScrollView {
            id: scrollView
            implicitHeight: Math.min(listView.implicitHeight, 300)
            anchors.left: parent.left
            anchors.right: parent.right

            ColumnLayout {
                id: listView

                LabelButton {
                    visible: root.filteredApps.length === 0
                    implicitWidth: 280
                    Layout.leftMargin: 10
                    Layout.rightMargin: 10

                    radius: Styles.radius

                    text: "No results found"
                }

                Repeater {
                    id: repeater
                    model: root.filteredApps
                    delegate: applicationEntry
                }
            }
        }
    }

    Component {
        id: applicationEntry

        LabelButton {
            id: button
            required property var modelData
            required property int index
            Layout.leftMargin: 10
            Layout.rightMargin: 10
            implicitWidth: 280

            radius: Styles.radius

            text: Utils.truncateString(button.modelData.name, 25)
            icon: Quickshell.iconPath(button.modelData.icon, "application-x-executable")

            state: index === root.selectionIndex ? "selected" : "default"

            TapHandler {
                onTapped: {
                    button.modelData.execute();
                    root.clearSearch();
                }
            }

            states: [
                State {
                    name: "selected"
                    PropertyChanges {
                        button {
                            color: Colors.secondary
                        }
                    }
                }
            ]
        }
    }
}
