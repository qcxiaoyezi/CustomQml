import QtQuick 2.2
import QtGraphicalEffects 1.0

Item{
    id: pushButton
    width: 31; height: 27
    property int radius: 4
    property alias image: image


    Rectangle{
        id: shadow
        anchors.fill: parent;
        anchors.topMargin: pushButton.radius
        anchors.bottomMargin: -1;
        radius: pushButton.radius
        border{width: 1; color: "#e5e9ed"}
    }

    Item{
        id: effectItem
        anchors.fill: parent
        anchors.margins: -1
        Item{
            anchors.fill: parent
            anchors.margins: 1

            Rectangle{
                id: border
                anchors.fill: parent;
                radius: pushButton.radius
                gradient: Gradient {
                    GradientStop {id:borderGs1; position: 0.0; color: "#c7d9e4" }
                    GradientStop {id:borderGs2; position: 1.0; color: "#b9c7d1" }
                }
            }
            Rectangle{
                id: body
                anchors.fill: parent;
                anchors.margins: 1
                radius: pushButton.radius -1
                gradient: Gradient {
                    GradientStop {id:bodyGs1; position: 0.0; color: "#f3f5f6" }
                    GradientStop {id:bodyGs2; position: 0.6; color: "#f3f5f6" }
                    GradientStop {id:bodyGs3; position: 1.0; color: "#e7edf4" }
                }
            }
        }
    }

    InnerShadow {
        id: innerShadow
        anchors.fill: effectItem
        anchors.margins: 0
        source: effectItem
        color: "#90000000"
        spread: 0.1
        verticalOffset: 1
        radius: 5
        samples: 16
    }

    Image {
        id: image
        anchors.centerIn: parent
    }
    ColorOverlay {
        id: colorOverlay
        anchors.fill: image
        source: image
        color: "#5000ff00"
    }

    MouseArea{
        id: mouseArea;
        hoverEnabled: true;
        anchors.fill: parent;

        onPressedChanged: updateState();
        onContainsMouseChanged: updateState();
    }

    state: "normal"
    function updateState(){
        var stateTmp = state;
        /*这样做的目的是为了让 normal 状态变成 hover 状态时候的动画能做完*/
        if(tr1.running) return;
        stateTmp = mouseArea.pressed ? "press" : mouseArea.containsMouse ? "hover" : "normal";
        state = stateTmp;
    }

    transitions: [
        Transition {
            id: tr1
            from: "normal" ; to :"hover";
            ColorAnimation { duration: 200;}
            onRunningChanged: updateState();
        },
        Transition {
            id: tr2
            to :"normal";
            ColorAnimation { duration: 200; }
        }
    ]

    states: [
        State {
            name: "normal" ;
            PropertyChanges { target: shadow; border.color: "#e5e9ed"}
            PropertyChanges { target: borderGs1; color: "#c7d9e4"}
            PropertyChanges { target: borderGs2; color: "#b9c7d1"}
            PropertyChanges { target: bodyGs1; color: "#f3f5f6"}
            PropertyChanges { target: bodyGs2; color: "#f3f5f6"}
            PropertyChanges { target: bodyGs3; color: "#e7edf4"}
            PropertyChanges { target: innerShadow; visible: false}
            PropertyChanges { target: image; anchors.verticalCenterOffset: 0}
            PropertyChanges { target: colorOverlay; color: "#00000000"}
        },
        State {
            name: "hover" ;
            PropertyChanges { target: shadow; border.color: "#cccfd3"}
            PropertyChanges { target: borderGs1; color: "#8dde4b"}
            PropertyChanges { target: borderGs2; color: "#61ba1a"}
            PropertyChanges { target: bodyGs1; color: "#ffffff"}
            PropertyChanges { target: bodyGs2; color: "#f2f5f8"}
            PropertyChanges { target: bodyGs3; color: "#ecf0f5"}
            PropertyChanges { target: innerShadow; visible: false}
            PropertyChanges { target: image; anchors.verticalCenterOffset: 0}
            PropertyChanges { target: colorOverlay; color: "#5000ff00"}
        },
        State {
            name: "press" ;
            PropertyChanges { target: shadow; border.color: "#d9dde1"}
            PropertyChanges { target: borderGs1; color: "#bdd2e0"}
            PropertyChanges { target: borderGs2; color: "#adbdc8"}
            PropertyChanges { target: bodyGs1; color: "#e5ebf3"}
            PropertyChanges { target: bodyGs2; color: "#e5ebf3"}
            PropertyChanges { target: bodyGs3; color: "#e5ebf3"}
            PropertyChanges { target: innerShadow; visible: true}
            PropertyChanges { target: image; anchors.verticalCenterOffset: 1}
            PropertyChanges { target: colorOverlay; color: "#00000000"}

        }
    ]
}
