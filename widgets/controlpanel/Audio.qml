import QtQuick
import QtQuick.Layouts

Item {

    Layout.fillWidth: true
    Layout.fillHeight: false

    implicitHeight: layout.implicitHeight

    Layout.topMargin: 5
    Layout.leftMargin: 5
    Layout.rightMargin: 5
    Layout.bottomMargin: 5

    ColumnLayout {
        id: layout

        anchors.fill: parent

        OutputPicker {}
        InputPicker {}
    }
}
