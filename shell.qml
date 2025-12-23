import Quickshell
import qs.components.bar
import qs.components.systemmenu

ShellRoot {
    Bar {
        id: bar
    }
    SystemMenu {
        id: systemmenu
        anchors {
            top: true
            left: true
        }
    }
}
