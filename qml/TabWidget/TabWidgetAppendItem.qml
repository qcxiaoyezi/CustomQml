import QtQuick 2.0

Item{
    id: tabWidgetAppendItem
    width: 28; height: 28;

    property int radius: 3
    property color borderColor : "#8a9fb2"
    property color bodyColor : "#b5cadc"
    property alias mouseArea: mouseArea

    /*背景*/
    Item{
        anchors.fill: parent
        clip: true
        Rectangle{
            anchors.fill: parent
            radius: tabWidgetAppendItem.radius
            anchors.bottomMargin: -radius;
            border{id: border; width: 1; color: borderColor}
            color: bodyColor
        }
    }
    Image{
        anchors.centerIn: parent;
        source: "qrc:///images/tabWidgetAppendItem.png"
    }

    MouseArea{
        id: mouseArea
        anchors.fill: parent
        hoverEnabled: true
    }

    state : mouseArea.containsMouse ? "hover" : "normal"
    states: [
        State {
            name: "normal" ;
            PropertyChanges { target: tabWidgetAppendItem; borderColor:"#8a9fb2";
                bodyColor:"#cbdbe8"; }
        },
        State {
            name: "hover" ;
            PropertyChanges { target: tabWidgetAppendItem; borderColor:"#7d9ab1";
                bodyColor:"#e0eaf1"; }
        }
    ]
    transitions: [
        Transition {
            PropertyAnimation{property:"x" ; duration: 200;}
        }
    ]
}
