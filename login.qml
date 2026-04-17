pragma ComponentBehavior: Bound
import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Io
import Quickshell.Services.Greetd
import qs.config
import qs.widgets.identity
import qs.ui

ShellRoot {
    id: root
    Process {
        id: userQuery
        command: ["sh", "-c", "getent passwd | awk -F: '$3 >= 1000 && $3 < 60000 && $1 != \"nobody\" {print $1}'"]
        running: true

        stdout: StdioCollector {
            onStreamFinished: {
                const userList = data.toString().trim().split('\n');
                userModel.clear();
                for (let user of userList) {
                    console.log("User found: " + user);
                    userModel.append({
                        user
                    });
                }
            }
        }
    }
    ListModel {
        id: userModel
    }
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
                ProfileIcon {
                    Layout.alignment: Qt.AlignHCenter
                    user: "nilbog"
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
                RowLayout {
                    Repeater {
                        model: userModel
                        delegate: Label {
                            required property var modelData
                            text: modelData
                        }
                    }
                }
            }
        }
    }
}
