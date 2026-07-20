pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
    PersistentProperties {
        id: persist
        property string currentTheme
        property bool darkMode: true
    }

    property string currentTheme: persist.currentTheme || "bogos"
    property string mode: persist.darkMode ? "dark" : "light"

    readonly property var themes: {
        "dark": {
            "bogos": {
                name: "BogOS",
                // Backgrounds
                background: "#1D2230",
                black: "#282e3f",
                comment: "#5c637a",

                // Foregrounds
                foreground: "#a5a296",
                white: "#EAE6DA",

                // Colors
                green: "#80a961",
                blue: "#394260",
                yellow: "#D9B36C",
                magenta: "#7E6BC4",
                red: "#c46b6b",
                cyan: "#6ba2c4",
                get primary() {
                    return this.green;
                },
                get secondary() {
                    return this.magenta;
                }
            },
            "tokyonight": {
                name: "ToykoNight",
                // Background
                background: "#1a1b26",
                comment: "#565f89",
                black: "#414868",
                // Foreground
                foreground: "#a9b1d6",
                white: "#c0caf5",
                // Colors
                red: "#f7768e",
                yellow: "#e0af68",
                green: "#73daca",
                cyan: "#7dcfff",
                blue: "#7aa2f7",
                magenta: "#bb9af7",
                // Color Bindings
                get primary() {
                    return this.blue;
                },
                get secondary() {
                    return this.cyan;
                }
            },
            "catppuccin": {
                name: "Catppuccin",
                //Background
                background: "#1e1e2e",
                comment: "#6c7086",
                black: "#313244",
                // Foreground
                foreground: "#cdd6f4",
                white: "#a6adc8",
                // Colors
                red: "#f38ba8",
                yellow: "#f9e2af",
                green: "#a6e3a1",
                cyan: "#89dceb",
                blue: "#89b4fa",
                magenta: "#cba6f7",
                // Color Bindings
                get primary() {
                    return "#f5e0dc";
                },
                get secondary() {
                    return "#f2cdcd";
                }
            },
            "nord": {
                name: "Nord",
                // Backgrounds
                background: "#2e3440",
                comment: "#4c566a",
                black: "#3b4252",
                // Foregrounds
                foreground: "#d8dee9",
                white: "#eceff4",
                // Colors
                red: "#bf616a",
                yellow: "#ebcb8b",
                green: "#a3be8c",
                cyan: "#88c0d0",
                blue: "#81a1c1",
                magenta: "#b48ead",
                // Color Bindings
                get primary() {
                    return this.cyan;
                },
                get secondary() {
                    return this.magenta;
                }
            },
            "sakura": {
                name: "Sakura",
                // Backgrounds
                background: "#1E1216",
                black: "#2D1B22",
                comment: "#8A6875",

                // Foregrounds
                foreground: "#DC9AAD",
                white: "#FFD9DA",

                // Colors
                red: "#C0345C",
                magenta: "#E83F6F",
                yellow: "#EEBAC4",
                green: "#B85B80",
                cyan: "#EEBAC4",
                blue: "#8A6875",
                // Color Bindings
                get primary() {
                    return this.magenta;
                },
                get secondary() {
                    return this.green;
                }
            }
        },
        "light": {
            "bogos": {
                name: "BogOS",
                // Backgrounds
                background: "#EAE6DA",
                black: "#dcd8ca",
                comment: "#8c887d",
                // Foregrounds
                foreground: "#394260",
                white: "#1D2230",
                // Colors
                green: "#5a7a41",
                blue: "#394260",
                yellow: "#a68546",
                magenta: "#5e4da1",
                red: "#a14d4d",
                cyan: "#4d83a1",
                get primary() {
                    return this.blue;
                },
                get secondary() {
                    return this.magenta;
                }
            },
            "tokyonight": {
                name: "ToykoDay",
                // Background
                background: "#e6e7ed",
                comment: "#6c6e75",
                black: "#a9b1d6",
                // Foreground
                foreground: "#343b58",
                white: "#343b58",
                // Colors
                red: "#8c4351",
                yellow: "#8f5e15",
                green: "#33635c",
                cyan: "#0f4b6e",
                blue: "#2959aa",
                magenta: "#5a3e8e",
                // Color Bindings
                get primary() {
                    return this.blue;
                },
                get secondary() {
                    return this.cyan;
                }
            },
            "catppuccin": {
                name: "Catppuccin",
                //Background
                background: "#eff1f5",
                comment: "#9ca0b0",
                black: "#ccd0da",
                // Foreground
                foreground: "#4c4f69",
                white: "#a6adc8",
                // Colors
                red: "#d20f39",
                yellow: "#df8e1d",
                green: "#40a02b",
                cyan: "#04a5e5",
                blue: "#1e66f5",
                magenta: "#8839ef",
                // Color Bindings
                get primary() {
                    return "#dc8a78";
                },
                get secondary() {
                    return "#dd7878";
                }
            },
            "nord": {
                name: "Nord",
                // Backgrounds
                background: "#eceff4",
                comment: "#88c0d0",
                black: "#d8dee9",
                // Foregrounds
                foreground: "#2e3440",
                white: "#3b4252",
                // Colors
                red: "#bf616a",
                yellow: "#ebcb8b",
                green: "#a3be8c",
                cyan: "#5e81ac",
                blue: "#81a1c1",
                magenta: "#b48ead",
                // Color Bindings
                get primary() {
                    return this.cyan;
                },
                get secondary() {
                    return this.magenta;
                }
            },
            "sakura": {
                name: "Sakura",
                // Backgrounds
                background: "#FFD9DA",
                black: "#EEBAC4",
                comment: "#B85B80",
                // Foregrounds
                foreground: "#C0345C",
                white: "#1E1216",

                // Colors
                red: "#C0345C",
                magenta: "#E83F6F",
                yellow: "#8A6875",
                green: "#B85B80",
                cyan: "#C0345C",
                blue: "#5A303F",
                // Color Bindings
                get primary() {
                    return this.magenta;
                },
                get secondary() {
                    return this.green;
                }
            }
        }
    }

    readonly property var active: themes[mode][currentTheme]

    property string name: active.name

    property color red: active.red
    property color yellow: active.yellow
    property color green: active.green
    property color cyan: active.cyan
    property color blue: active.blue
    property color magenta: active.magenta

    property color primary: active.primary
    property color secondary: active.secondary

    property color surface: active.black
    property color foreground: active.foreground
    property color background: active.background
    property color hover: active.comment

    property color shadow: Qt.darker(active.background, 2)

    function switchMode() {
        persist.darkMode = !persist.darkMode;
        themeEngine.exec(["/home/nilbog/.config/themes/theme-engine.sh", currentTheme, mode]);
    }

    function setTheme(themeName) {
        persist.currentTheme = themeName;
        const formatColor = c => String(c).replace('#', '');
        const c1 = formatColor(primary);
        const c2 = formatColor(secondary);
        themeEngine.exec(["/home/nilbog/.config/themes/theme-engine.sh", themeName, mode]);
    }

    function getThemeNames() {
        return Object.keys(themes[mode]);
    }
    Process {
        id: themeEngine
        // Use an absolute path to ensure it finds your script
        command: ["/home/nilbog/.config/themes/theme-engine.sh"]
    }
}
