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
    property int selectionIndex: -1

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
        onTextChanged: {
            root.selectionIndex = -1;
            root.updateFilter();
        }

        Keys.onEscapePressed: {
            root.searchActive = false;
            text = "";
            popup.visible = false;
            grab.active = false;
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
                root.filteredApps[root.selectionIndex].execute();
                root.searchActive = false;
                text = "";
                popup.visible = false;
            }
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
                id: scrollView
                anchors.fill: parent

                ColumnLayout {
                    id: listView
                    anchors.fill: parent

                    Repeater {
                        id: repeater
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
            required property int index
            Layout.leftMargin: 10
            Layout.rightMargin: 10
            implicitWidth: 280

            radius: Styles.radius

            text: Utils.truncateString(button.modelData.name, 25)
            icon: Quickshell.iconPath(button.modelData.icon, "application-x-executable")

            state: index === root.selectionIndex ? "selected" : "default"

            MouseArea {
                anchors.fill: parent
                HoverHandler {
                    id: hover
                    acceptedDevices: PointerDevice.AllDevices
                    cursorShape: Qt.PointingHandCursor
                }
                onClicked: {
                    button.modelData.execute();
                    root.searchActive = false;
                    inputLabel.text = "";
                    popup.visible = false;
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
