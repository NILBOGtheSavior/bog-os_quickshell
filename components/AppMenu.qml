import QtQuick
import QtQuick.Layouts
import Quickshell
import qs.ui
import qs.config
import qs.widgets.app_menu

PopupWindow {
    id: root

    implicitWidth: 500
    implicitHeight: 750

    color: "transparent"

    Container {
        anchors.fill: parent
        anchors.leftMargin: 10
        anchors.bottomMargin: 15

        radius: Styles.radius

        ColumnLayout {
            anchors {
                left: parent.left
                right: parent.right
                top: parent.top
                margins: 10
            }
            ApplicationLauncher {
                Layout.fillWidth: true
            }
        }
    }
}
