import QtQuick 2.2
import QtGraphicalEffects 1.0

Item{
    id: menuBarItem
    height: Math.ceil(text.height) + 4 /*取整避免出现非整数的模糊现象*/
    width: Math.ceil(text.width) + 14
    property alias text: text.text

    Item{
        id: effectItem
        anchors.fill: parent

        Rectangle{
            id: shadow
            anchors.fill: parent
            anchors.bottomMargin: -1
            radius: 3
            border{width: 1; color: "#e9eaec"}
        }
        Rectangle{
            id: body
            anchors.fill: parent
            radius: 3
            border{width: 1; color: "#bac9d3"}
            gradient: Gradient {
                GradientStop {id:gs1; position: 0.0; color: "#FEFEFE" }
                GradientStop {id:gs2; position: 1.0; color: "#F4F6F7" }
            }
        }
    }

    InnerShadow {
        id: innerShadow
        anchors.fill: effectItem
        anchors.margins: 0
        source: effectItem
        color: "#30000000"
        spread: 0.1
        verticalOffset: 1
        radius: 5
        samples: 16
    }

    Text{
        id: text
        anchors.centerIn: parent
        renderType: Text.NativeRendering
        font.family: "微软雅黑"
        font.pixelSize: 12
        color: "#5a5e65"
    }
    MouseArea{
        id: mouseArea
        anchors.fill: parent;
        hoverEnabled: true
    }
    state: mouseArea.pressed ? "press" : mouseArea.containsMouse ? "hover" : "normal"
    states: [
        State {
            name: "normal" ;
            PropertyChanges { target: effectItem; opacity: 0.0}
            PropertyChanges { target: innerShadow; visible: false}
        },
        State {
            name: "hover" ;
            PropertyChanges { target: effectItem; opacity: 1.0}
            PropertyChanges { target: body; border.color:"#bac9d3" }
            PropertyChanges { target: gs1; color: "#FEFEFE"; }
            PropertyChanges { target: gs2; color: "#F4F6F7"; }
            PropertyChanges { target: innerShadow; visible: false}
        },
        State {
            name: "press" ;
            PropertyChanges { target: effectItem; opacity: 1.0}
            PropertyChanges { target: body; border.color:"#adbac2" }
            PropertyChanges { target: gs1; color: "#eff1f2"; }
            PropertyChanges { target: gs2; color: "#eff1f2"; }
            PropertyChanges { target: innerShadow; visible: true}
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
