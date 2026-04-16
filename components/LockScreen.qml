pragma ComponentBehavior: Bound
import QtQuick
import QtQuick.Effects
import QtQuick.Layouts
import Quickshell
import Quickshell.Widgets
import Quickshell.Wayland
import qs.config
import qs.ui

WlSessionLock {
    id: lock
    locked: false

    Component.onCompleted: {
        Global.lockscreen = lock;
    }

    WlSessionLockSurface {
        color: Colors.background

        ColumnLayout {
            anchors.centerIn: parent
            spacing: 20
            Label {
                Layout.alignment: Qt.AlignHCenter
                font: Fonts.xlarge
                text: "nilbog"
            }
            IconImage {
                id: avatar
                Layout.alignment: Qt.AlignHCenter
                implicitSize: 100
                source: "file:///var/lib/AccountsService/icons/" + (Quickshell.env("USER") ?? "user")
                layer.enabled: true
                layer.effect: MultiEffect {
                    maskSource: mask
                    maskEnabled: true
                }
            }
            Rectangle {
                id: mask
                width: avatar.width
                height: avatar.height
                radius: width / 2
                visible: false
                layer.enabled: true
            }

            Container {
                Layout.alignment: Qt.AlignHCenter
                color: Colors.surface
                implicitWidth: inputLayout.width
                implicitHeight: inputLayout.height
                RowLayout {
                    id: inputLayout
                    width: 150
                    InputLabel {
                        echoMode: TextInput.Password
                        font: Fonts.large
                        placeholder: "password"
                    }
                    Label {
                        text: ""
                    }
                }
            }
            Button {
                Layout.alignment: Qt.AlignHCenter
                font: Fonts.large
                text: "unlock"
                onClicked: lock.locked = false
            }
        }
    }
}
