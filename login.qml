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
    property var currentUser

    function attemptLogin() {
        Greetd.createSession(currentUser);
    }

    Process {
        id: userQuery
        command: ["sh", "-c", "getent passwd | awk -F: '$3 >= 1000 && $3 < 60000 && $1 != \"nobody\" {print $1}'"]
        running: true

        stdout: StdioCollector {
            onStreamFinished: {
                const userList = data.toString().trim().split('\n');
                userModel.clear();
                for (let user of userList) {
                    userModel.append({
                        "username": user
                    });
                }
                root.currentUser = userModel.get(0).username;
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

        Image {
            id: wallpaper
            anchors.fill: parent

            source: "file:/home/nilbog/Pictures/Wallpapers/tokyo02.jpg"

            Container {
                anchors.centerIn: parent
                width: parent.width / 2
                height: parent.height / 2
                RowLayout {
                    anchors.fill: parent
                    Container {
                        Layout.fillHeight: true
                        Layout.fillWidth: true
                        Layout.preferredWidth: parent.width * 0.3
                        color: Colors.surface
                        ColumnLayout {
                            anchors {
                                top: parent.top
                                left: parent.left
                                right: parent.right
                                topMargin: 20
                                leftMargin: 20
                                rightMargin: 20
                            }
                            spacing: 20
                            Dashboard {}
                            ColumnLayout {
                                spacing: Styles.spacing * 2
                                Repeater {
                                    model: userModel
                                    delegate: ProfileButton {
                                        required property var modelData
                                        Layout.fillWidth: true
                                        user: modelData
                                        onClicked: root.currentUser = modelData
                                    }
                                }
                            }
                        }
                    }
                    Item {
                        Layout.fillHeight: true
                        Layout.fillWidth: true
                        Layout.preferredWidth: parent.width * 0.7
                        ColumnLayout {
                            id: layout
                            anchors.centerIn: parent
                            Layout.preferredWidth: parent.width * 0.6
                            spacing: 20
                            Label {
                                Layout.alignment: Qt.AlignHCenter
                                font: Fonts.xlarge
                                text: root.currentUser
                            }
                            ProfileIcon {
                                Layout.alignment: Qt.AlignHCenter
                                user: root.currentUser || ""
                            }
                            Label {
                                id: errorBox
                                Layout.alignment: Qt.AlignHCenter
                                visible: false
                                color: Colors.red
                                text: "incorrect password"
                            }

                            PasswordInput {
                                id: passwordField
                                Connections {
                                    target: Greetd
                                    function onAuthMessage(message, type, responseRequired) {
                                        if (responseRequired) {
                                            Greetd.respond(passwordField.input.text);
                                        }
                                    }
                                    function onStateChanged() {
                                        if (Greetd.state === GreetdState.ReadyToLaunch) {
                                            Greetd.launch(["start-hyprland"]);
                                        }
                                    }
                                    function onErrorMessage(message) {
                                        errorBox.text = message;
                                        errorBox.visible = true;
                                        passwordField.input.enabled = true;
                                    }
                                }
                                Keys.onReturnPressed: {
                                    passwordField.input.readOnly = true;
                                    root.attemptLogin();
                                }
                            }
                            Button {
                                Layout.alignment: Qt.AlignHCenter
                                font: Fonts.large
                                text: "unlock"
                                onClicked: {
                                    root.attemptLogin();
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
