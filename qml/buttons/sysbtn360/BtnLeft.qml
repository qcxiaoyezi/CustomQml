import QtQuick 2.2
import QtGraphicalEffects 1.0


Item{
    id: btnFrame
    width: 29; height: 22

    property color borderColorNormal: "#C5D3DC"
    property color borderColorHover: "#478E3B"
    property color borderColorPress: "#61AF0D"
    property color bodyColorNormal1: "#FFFFFF"
    property color bodyColorNormal2: "#F8F9FA"
    property color bodyColorHover1: "#78E63C"
    property color bodyColorHover2: "#5CC523"
    property color bodyColorPress1: "#5CC523"
    property color bodyColorPress2: "#78E63C"
    property alias image: image
    property alias mouseArea: mouseArea

    Item{
        id: effectItem
        anchors.fill: parent
        anchors.margins: -1

        Item{
            id: btn
            clip: true
            anchors.fill: parent
            anchors.margins: 1
            Rectangle{
                id: body
                anchors.fill: parent
                anchors{topMargin: -radius;rightMargin: -radius}
                border{width: 1; color: borderColorHover}
                radius: 5
                gradient: Gradient {
                    GradientStop {id:gs1; position: 0.0; color: bodyColorHover1 }
                    GradientStop {id:gs2; position: 1.0; color: bodyColorHover2 }
                }
            }
            Rectangle{id:borderTop; width: btn.width; height: 1; color: borderColorHover }
            Rectangle{id:borderRight; width: 1; height: btn.height; anchors.right: btn.right;color: borderColorHover }
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
    Image{
        id: image
        anchors.centerIn: parent
    }
    ColorOverlay {
        id: colorOverlay
        anchors.fill: image
        source: image
        color: "#ffffff"
    }
    MouseArea{
        id: mouseArea;
        hoverEnabled: true;
        anchors.fill: parent;
    }
    state: mouseArea.pressed ? "press" : mouseArea.containsMouse ? "hover" : "normal"

    states: [
        State {
            name: "normal" ;
            PropertyChanges { target: btn; opacity: 0.0}
            PropertyChanges { target: image; anchors.verticalCenterOffset:0 }
            PropertyChanges { target: colorOverlay; opacity: 0.0 }
            PropertyChanges { target: innerShadow; visible: false}
        },
        State {
            name: "hover" ;
            PropertyChanges { target: btn; opacity: 1.0}
            PropertyChanges { target: image; anchors.verticalCenterOffset: 0 }
            PropertyChanges { target: colorOverlay; opacity: 1.0}
            PropertyChanges { target: innerShadow; visible: false }

            PropertyChanges { target: body; border.color: borderColorHover; }
            PropertyChanges { target: gs1; color: bodyColorHover1; }
            PropertyChanges { target: gs2; color: bodyColorHover2; }
            PropertyChanges { target: borderTop; color: borderColorHover; }
            PropertyChanges { target: borderRight; color: borderColorHover; }
        },
        State {
            name: "press" ;
            PropertyChanges { target: btn; opacity: 1.0}
            PropertyChanges { target: image; anchors.verticalCenterOffset: 1 }
            PropertyChanges { target: colorOverlay; opacity: 1.0}
            PropertyChanges { target: innerShadow; visible: true }

            PropertyChanges { target: body; border.color: borderColorPress; }
            PropertyChanges { target: gs1; color: bodyColorPress1; }
            PropertyChanges { target: gs2; color: bodyColorPress2; }
            PropertyChanges { target: borderTop; color: borderColorPress; }
            PropertyChanges { target: borderRight; color: borderColorPress; }

        }
    ]
    transitions: [
        Transition {
            from: "normal" ; to :"hover";
            PropertyAnimation{property:"opacity" ; duration: 300; from:0.0; to: 1.0}
        },
        Transition {
            from: "hover" ; to :"normal";
            PropertyAnimation{property:"opacity" ; duration: 300; from:1.0; to: 0.0}
        }
    ]

}
