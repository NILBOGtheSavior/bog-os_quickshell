pragma Singleton

import QtQuick
import Quickshell

Singleton {
    property string currentTheme: "dark"

    readonly property var themes: ({
            "dark": {
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
            "light": {
                primary: "#80a961",
                secondary: "#C9B89D",
                background: "#EBE6DA",
                foreground: "#4A4A42",
                accent1: "#D9B36C",
                accent2: "#A89BC4"
            },
            "sepia": {
                primary: "#7a9761",
                secondary: "#C9B89D",
                background: "#EBE6DA",
                foreground: "#4A4A42",
                accent1: "#D4B883",
                accent2: "#A89BC4"
            },
            "tokyonight": {
                primary: "#7aa2f7",
                secondary: "#bb9af7",
                background: "#1a1b26",
                foreground: "#c0caf5",
                accent1: "#e0af68",
                accent2: "#9ece6a"
            },
            "tokyonight-storm": {
                primary: "#7aa2f7",
                secondary: "#bb9af7",
                background: "#24283b",
                foreground: "#c0caf5",
                accent1: "#e0af68",
                accent2: "#73daca"
            },
            "tokyonight-day": {
                primary: "#2e7de9",
                secondary: "#9854f1",
                background: "#e1e2e7",
                foreground: "#3760bf",
                accent1: "#b15c00",
                accent2: "#33635c"
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
            "gruvbox-dark": {
                primary: "#b8bb26",
                secondary: "#83a598",
                background: "#282828",
                foreground: "#ebdbb2",
                accent1: "#fabd2f",
                accent2: "#d3869b"
            },
            "gruvbox-light": {
                primary: "#79740e",
                secondary: "#076678",
                background: "#fbf1c7",
                foreground: "#3c3836",
                accent1: "#b57614",
                accent2: "#8f3f71"
            },
            "onedark": {
                primary: "#98c379",
                secondary: "#61afef",
                background: "#282c34",
                foreground: "#abb2bf",
                accent1: "#e5c07b",
                accent2: "#c678dd"
            },
            "solarized-dark": {
                primary: "#859900",
                secondary: "#268bd2",
                background: "#002b36",
                foreground: "#fdf6e3",
                accent1: "#b58900",
                accent2: "#d33682"
            },
            "solarized-light": {
                primary: "#859900",
                secondary: "#268bd2",
                background: "#fdf6e3",
                foreground: "#002b36",
                accent1: "#b58900",
                accent2: "#d33682"
            },
            "rosepine": {
                primary: "#9ccfd8",
                secondary: "#c4a7e7",
                background: "#191724",
                foreground: "#e0def4",
                accent1: "#f6c177",
                accent2: "#ebbcba"
            },
            "rosepine-dawn": {
                primary: "#56949f",
                secondary: "#907aa9",
                background: "#faf4ed",
                foreground: "#575279",
                accent1: "#ea9d34",
                accent2: "#d7827e"
            },
            "monokai": {
                primary: "#a6e22e",
                secondary: "#66d9ef",
                background: "#272822",
                foreground: "#f8f8f2",
                accent1: "#f4bf75",
                accent2: "#ae81ff"
            }
        })

    property color primary: themes[currentTheme].primary
    property color secondary: themes[currentTheme].secondary
    property color background: themes[currentTheme].background
    property color foreground: themes[currentTheme].foreground
    property color accent1: themes[currentTheme].accent1
    property color accent2: themes[currentTheme].accent2

    function setTheme(themeName) {
        currentTheme = themeName;
    }

    function getThemeNames() {
        return Object.keys(themes);
    }
}
