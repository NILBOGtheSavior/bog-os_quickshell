pragma ComponentBehavior: Bound
import QtQuick
import QtQuick.Effects
import QtQuick.Layouts
import Quickshell
import Quickshell.Widgets
import Quickshell.Wayland
import qs.config
import qs.ui
import qs.services

WlSessionLock {
    id: lock
    locked: false

    Component.onCompleted: {
        Global.lockscreen = lock;
    }

    onLockedChanged: {
        Auth.pam.start();
    }

    WlSessionLockSurface {
        id: surface
        color: Colors.background

        ColumnLayout {
            // visible: surface.screen.name === "DP-3"
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

            Label {
                id: errorBox
                Layout.alignment: Qt.AlignHCenter
                color: "red"
                text: ""
            }

            Container {
                Layout.alignment: Qt.AlignHCenter
                color: Colors.surface
                implicitWidth: inputLayout.width + 10
                implicitHeight: inputLayout.height + 10
                RowLayout {
                    id: inputLayout
                    anchors.centerIn: parent
                    InputLabel {
                        id: passwordInput
                        width: 150
                        echoMode: TextInput.Password
                        font: Fonts.large
                        placeholder: "password"
                        Keys.onReturnPressed: {
                            Auth.pam.respond(passwordInput.text);
                        }
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
                onClicked: {
                    Auth.pam.respond(passwordInput.text);
                }
            }
            Button {
                Layout.alignment: Qt.AlignHCenter
                font: Fonts.large
                text: "unlock (key)"
                onClicked: lock.locked = false
            }
        }
    }
}
