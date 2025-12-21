import Quickshell
import QtQuick
import QtQuick.Layouts
import qs.ui

Container {
    implicitWidth: layout.implicitWidth + layout.anchors.leftMargin + layout.anchors.rightMargin
    RowLayout {
        id: layout
        anchors {
            fill: parent
            leftMargin: 15
            rightMargin: 15
        }

        Button {
            // Layout.fillHeight: true
            font: "BogOS"
            text: ''
        }
        Button {
            text: ''
        }
        Label {
            // Layout.alignment: Qt.AlignLeft
            text: "BogOS"
        }
    }
}
