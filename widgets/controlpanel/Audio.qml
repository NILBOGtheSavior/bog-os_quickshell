import QtQuick
import QtQuick.Layouts

Item {

    Layout.fillWidth: true
    Layout.fillHeight: false

    implicitHeight: layout.implicitHeight

    ColumnLayout {
        id: layout

        anchors.fill: parent

        OutputPicker {}
        InputPicker {}
    }
}
