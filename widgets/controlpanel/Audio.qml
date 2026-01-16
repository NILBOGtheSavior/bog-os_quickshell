import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import Quickshell
import qs.ui
import qs.services

Item {

    ColumnLayout {
        anchors.centerIn: parent

        OutputPicker {}
        InputPicker {}
    }
}
