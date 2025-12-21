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
            font: "BogOS"
            text: ''
        }
        Button {
            text: ''
        }
        Label {
            text: "BogOS"
        }
    }
}
