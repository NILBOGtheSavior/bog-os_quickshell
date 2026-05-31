import QtQuick
import QtQuick.Layouts
import qs.services
import qs.ui

Label {
    id: root
    property var lastActive: {
        return TopLevel.activeWindow?.lastIpcObject?.class;
    }
    Layout.preferredWidth: 90
    text: Utils.truncateString(lastActive, 10) || "BogOS"
}
