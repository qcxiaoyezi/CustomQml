import QtQuick 2.2
import QtGraphicalEffects 1.0

Item{
    id: menuBarItem
    height: text.height + 4
    width: text.width + 14

    property alias text: text.text

    Text{
        id: text
        anchors{top: parent.top; topMargin: 2; left: parent.left; leftMargin: 7}
        font.family: "微软雅黑"
        font.pixelSize: 12
        color: "#5a5e65"
    }
    Rectangle{
        id: border
        anchors.fill: parent
        color: "transparent"
        radius: 3
        border{width: 1; color: "#bac9d3"}
    }

    MouseArea{
        id: mouseArea
        anchors.fill: parent
        hoverEnabled: true
    }
    state: mouseArea.pressed ? "press" : mouseArea.containsMouse ? "hover" : "normal"
    states: [
        State {
            name: "normal" ;
            PropertyChanges { target: border; opacity: 0.0}

        },
        State {
            name: "hover" ;
            PropertyChanges { target: border; opacity: 1.0}
        },
        State {
            name: "press" ;
        }
    ]
    transitions: [
        Transition {
            from: "normal" ; to :"hover";
            PropertyAnimation{property:"opacity" ; duration: 100; from:0.0; to: 1.0}
        },
        Transition {
            to :"normal";
            PropertyAnimation{property:"opacity" ; duration: 300; from:1.0; to: 0.0}
        }
    ]

}
