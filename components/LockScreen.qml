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
    id: root
    locked: false

    property var auth: Auth

    Component.onCompleted: {
        Global.lockscreen = root;
    }

    WlSessionLockSurface {
        id: surface
        color: Colors.background

        ColumnLayout {
            visible: surface.screen.name === "DP-3"
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
                visible: Auth.authFailed
                color: Colors.red
                text: "incorrect password"
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
                        Layout.minimumWidth: 150
                        echoMode: TextInput.Password
                        cursorVisible: false
                        font: Fonts.large
                        placeholder: "password"
                        Connections {
                            target: Auth.pam
                            function onResponseRequiredChanged() {
                                if (Auth.pam.responseRequired) {
                                    passwordInput.forceActiveFocus();
                                }
                            }
                            function onCompleted(result) {
                                if (result === 0) {
                                    passwordInput.text = "";
                                } else {
                                    passwordInput.text = "";
                                    passwordInput.readOnly = false;
                                }
                            }
                        }
                        Keys.onReturnPressed: {
                            passwordInput.readOnly = true;
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
            // Button {
            //     Layout.alignment: Qt.AlignHCenter
            //     font: Fonts.large
            //     text: "unlock (key)"
            //     onClicked: root.locked = false
            // }
        }
    }
}
