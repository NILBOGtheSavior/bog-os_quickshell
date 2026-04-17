pragma ComponentBehavior: Bound
import QtQuick
import QtQuick.Layouts
import QtQuick.Effects
import Quickshell
import Quickshell.Widgets
import Quickshell.Services.Greetd
import qs.config
import qs.ui

ShellRoot {
    Window {
        id: surface
        visible: true
        flags: Qt.FramelessWindowHint | Qt.Window

        Rectangle {
            anchors.fill: parent
            color: Colors.background
            ColumnLayout {
                // visible: surface.screen.name === "DP-3"
                anchors.centerIn: parent
                spacing: 20
                Label {
                    Layout.alignment: Qt.AlignHCenter
                    font: Fonts.xlarge
                    // text: Quickshell.env("USER")
                    text: Greetd.user
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
                    // visible: Auth.authFailed
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
                            Keys.onReturnPressed: {
                                passwordInput.readOnly = true;
                                // Auth.pam.respond(passwordInput.text);
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
                        // Auth.pam.respond(passwordInput.text);
                    }
                }
                Button {
                    Layout.alignment: Qt.AlignHCenter
                    font: Fonts.large
                    text: "unlock (key)"
                    // onClicked: root.locked = false
                }
            }
        }
    }
}
