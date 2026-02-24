pragma Singleton

import QtQuick
import Quickshell

Singleton {
    PersistentProperties {
        id: persist
        property string currentTheme: "bogos"
        property bool darkMode: true
    }

    property string currentTheme: persist.currentTheme
    property string mode: persist.darkMode ? "dark" : "light"

    readonly property var themes: {
        "dark": {
            "bogos": {
                name: "BogOS" // pretty name
                ,
                primary: "#80a961"     // bog-os green
                ,
                secondary: "#394260" // slate blue
                ,
                background: "#1D2230"// charcoal black
                ,
                foreground: "#EAE6DA"// bone white
                ,
                accent1: "#D9B36C"   // goblin gold
                ,
                accent2: "#7E6BC4"   // fen purple

            },
            "tokyonight": {
                name: "TokyoNight",
                primary: "#7aa2f7",
                secondary: "#565f89",
                background: "#24283b",
                foreground: "#00ffd2",
                accent1: "#73daca",
                accent2: "#f7768e"
            },
            "rosepine": {
                name: "Rosepine",
                primary: "#9ccfd8",
                secondary: "#c4a7e7",
                background: "#191724",
                foreground: "#e0def4",
                accent1: "#f6c177",
                accent2: "#ebbcba"
            },
            "solarized": {
                name: "Solarized",
                primary: "#859900",
                secondary: "#268bd2",
                background: "#002b36",
                foreground: "#fdf6e3",
                accent1: "#b58900",
                accent2: "#d33682"
            },
            "gruvbox": {
                name: "Gruvbox",
                primary: "#b8bb26",
                secondary: "#83a598",
                background: "#282828",
                foreground: "#ebdbb2",
                accent1: "#fabd2f",
                accent2: "#d3869b"
            }
        },
        "light": {
            "bogos": {
                name: "BogOS",
                primary: "#80a961",
                secondary: "#C9B89D",
                background: "#EBE6DA",
                foreground: "#4A4A42",
                accent1: "#C77B7B",
                accent2: "#A89BC4"
            },
            "tokyonight": {
                name: "TokyoDay",
                primary: "#2e7de9",
                secondary: "#b4b5b9",
                background: "#e1e2e7",
                foreground: "#3760bf",
                accent1: "#2959aa",
                accent2: "#33635C"
            },
            "rosepine": {
                name: "Rosepine",
                primary: "#56949f",
                secondary: "#907aa9",
                background: "#faf4ed",
                foreground: "#575279",
                accent1: "#ea9d34",
                accent2: "#d7827e"
            },
            "solarized": {
                name: "Solarized",
                primary: "#859900",
                secondary: "#268bd2",
                background: "#fdf6e3",
                foreground: "#002b36",
                accent1: "#b58900",
                accent2: "#d33682"
            },
            "gruvbox": {
                name: "Gruvbox",
                primary: "#79740e",
                secondary: "#076678",
                background: "#fbf1c7",
                foreground: "#3c3836",
                accent1: "#b57614",
                accent2: "#8f3f71"
            }
        },
        "other": {
            "tokyonight-storm": {
                primary: "#7aa2f7",
                secondary: "#565f89",
                background: "#1a1b26",
                foreground: "#00ffd2",
                accent1: "#73daca",
                accent2: "#f7768e"
            },
            "catppuccin-mocha": {
                primary: "#a6e3a1",
                secondary: "#89b4fa",
                background: "#1e1e2e",
                foreground: "#cdd6f4",
                accent1: "#f9e2af",
                accent2: "#cba6f7"
            },
            "catppuccin-macchiato": {
                primary: "#a6da95",
                secondary: "#8aadf4",
                background: "#24273a",
                foreground: "#cad3f5",
                accent1: "#eed49f",
                accent2: "#c6a0f6"
            },
            "catppuccin-frappe": {
                primary: "#a6d189",
                secondary: "#8caaee",
                background: "#303446",
                foreground: "#c6d0f5",
                accent1: "#e5c890",
                accent2: "#ca9ee6"
            },
            "catppuccin-latte": {
                primary: "#40a02b",
                secondary: "#1e66f5",
                background: "#eff1f5",
                foreground: "#4c4f69",
                accent1: "#df8e1d",
                accent2: "#8839ef"
            },
            "nord": {
                primary: "#88C0D0",
                secondary: "#81A1C1",
                background: "#2E3440",
                foreground: "#ECEFF4",
                accent1: "#EBCB8B",
                accent2: "#B48EAD"
            },
            "dracula": {
                primary: "#50fa7b",
                secondary: "#8be9fd",
                background: "#282a36",
                foreground: "#f8f8f2",
                accent1: "#f1fa8c",
                accent2: "#ff79c6"
            },
            "monokai": {
                primary: "#a6e22e",
                secondary: "#66d9ef",
                background: "#272822",
                foreground: "#f8f8f2",
                accent1: "#f4bf75",
                accent2: "#ae81ff"
            }
        }
    }

    property string name: themes[mode][currentTheme].name || "Theme"
    property color primary: themes[mode][currentTheme].primary
    property color secondary: themes[mode][currentTheme].secondary
    property color background: themes[mode][currentTheme].background
    property color foreground: themes[mode][currentTheme].foreground
    property color accent1: themes[mode][currentTheme].accent1
    property color accent2: themes[mode][currentTheme].accent2

    function switchMode() {
        persist.darkMode = !persist.darkMode;
    }

    function setTheme(themeName) {
        persist.currentTheme = themeName;
    }

    function getThemeNames() {
        return Object.keys(themes[mode]);
    }
}
