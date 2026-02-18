pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
    id: root

    property string url: "https://api.open-meteo.com/v1/forecast?latitude=41.85&longitude=-87.65&current=temperature_2m,weather_code&timezone=America%2FChicago"

    property real temperature
    property int code: -1
    property string unit
    property string icon: getIcon(code)
    property string description: getDescription(code)

    Component.onCompleted: fetchWeather()

    function fetchWeather() {
        weather.running = true;
    }

    function getDescription(code) {
        var descriptions = {
            0: "Clear sky",
            1: "Mainly clear",
            2: "Partly cloudy",
            3: "Overcast",
            45: "Fog",
            48: "Depositing rime fog",
            51: "Light drizzle",
            53: "Moderate drizzle",
            55: "Dense drizzle",
            56: "Light freezing drizzle",
            57: "Dense freezing drizzle",
            61: "Slight rain",
            63: "Moderate rain",
            65: "Heavy rain",
            66: "Light freezing rain",
            67: "Heavy freezing rain",
            71: "Slight snow fall",
            73: "Moderate snow fall",
            75: "Heavy snow fall",
            77: "Snow grains",
            80: "Slight rain showers",
            81: "Moderate rain showers",
            82: "Violent rain showers",
            85: "Slight snow showers",
            86: "Heavy snow showers",
            95: "Thunderstorm",
            96: "Thunderstorm with slight hail",
            99: "Thunderstorm with heavy hail"
        };
        return descriptions[code] || "";
    }
    function getIcon(code) {
        var icons = {
            0: "",
            1: "",
            2: "󰖐",
            3: "",
            45: "󰖑",
            48: "",
            51: "",
            53: "",
            55: "",
            56: "",
            57: "",
            61: "",
            63: "",
            65: "",
            66: "",
            67: "",
            71: "",
            73: "",
            75: "",
            77: "",
            80: "",
            81: "",
            82: "",
            85: "",
            86: "",
            95: "",
            96: "",
            99: ""
        };
        return icons[code] || "";
    }
    Process {
        id: weather
        command: ["curl", "-s", root.url]
        stdout: StdioCollector {
            onStreamFinished: {
                let data = JSON.parse(this.text);
                root.temperature = data.current.temperature_2m;
                root.code = data.current.weather_code;
                root.unit = data.current_units.temperature_2m;
                timer.interval = data.current.interval * 1000;
            }
        }
    }

    Timer {
        id: timer
        running: false
        repeat: true
        onTriggered: root.fetchWeather()
        onIntervalChanged: running = true
    }
}
