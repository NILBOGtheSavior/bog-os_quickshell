import QtQuick
import QtQuick.Layouts
import qs.services
import qs.ui

Label {
    id: root
    Layout.preferredWidth: 90
    text: TopLevel.activeWindow?.lastIpcObject?.class || "BogOS"
}
