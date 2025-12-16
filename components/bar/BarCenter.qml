import QtQuick
import QtQuick.Layouts
import qs.ui
import qs.widgets

Container {
    Layout.fillHeight: true
    Layout.fillWidth: true

    color: 'transparent'

    Workspaces {
        color: 'transparent'
        anchors.centerIn: parent
    }
}
