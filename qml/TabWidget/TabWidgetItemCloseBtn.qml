import QtQuick 2.2
import QtGraphicalEffects 1.0


Item{
    id: tabWidgetItemCloseBtn
    width: 16; height: 16;

    property color borderColor : "#b21b1b"
    property color bodyColorGs1: "#e31828"
    property color bodyColorGs2: "#b11818"
    property alias mouseArea: mouseArea

    /*背景*/
    Rectangle{
        anchors.fill: parent
        radius: width/2
        gradient: Gradient {
            GradientStop {id:gs1; position: 0.0; color: bodyColorGs1 }
            GradientStop {id:gs2; position: 1.0; color: bodyColorGs2 }
        }
        border{width: 0.5; color: borderColor}
        antialiasing: true
    }


    Image{
        id: image
        anchors.centerIn: parent;
        source: "qrc:///images/tabWidgetItemCloseBtn.png"
    }

    ColorOverlay {
        id: colorOverlay
        anchors.fill: image
        source: image
        color: "#F0ffffff"
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
            PropertyChanges { target: tabWidgetItemCloseBtn; borderColor:"transparent";
                bodyColorGs1:"transparent"; bodyColorGs2:"transparent"}
            PropertyChanges { target: colorOverlay; visible: false}


        },
        State {
            name: "hover" ;
            PropertyChanges { target: tabWidgetItemCloseBtn; borderColor:"#b21b1b";
                bodyColorGs1:"#e31828"; bodyColorGs2:"#b11818"}
            PropertyChanges { target: colorOverlay; visible: true; opacity: 1.0}
            PropertyChanges { target: image;  opacity: 1.0}


        },
        State {
            name: "press" ;
            PropertyChanges { target: tabWidgetItemCloseBtn; borderColor:"#b21b1b";
                bodyColorGs1:"#e31828"; bodyColorGs2:"#b11818"}
            PropertyChanges { target: colorOverlay; visible: true; opacity: 0.3}
            PropertyChanges { target: image; visible: true; opacity: 0.3}
        }
    ]
}
