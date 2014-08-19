import QtQuick 2.2
import QtGraphicalEffects 1.0


Item{
    id: tabWidgetArrowBtn
    width: 20
    height: 20

    property alias mouseArea: mouseArea


    Item{
        id: body
        anchors.fill: parent
        Image{
            id: image
            anchors.centerIn: parent
            source: "qrc:///images/tabWidgetArrowBtn.png"
        }
        Image{
            id: imageHover
            anchors.centerIn: parent
            source: "qrc:///images/tabWidgetArrowBtnHover.png"
            opacity: 0.0
        }
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
            PropertyChanges { target: body ; anchors.topMargin: 0}
            PropertyChanges { target: image; opacity: 1.0}
            PropertyChanges { target: imageHover; opacity: 0.0}
        },
        State {
            name: "hover" ;
            PropertyChanges { target: body ; anchors.topMargin: 0}
            PropertyChanges { target: image; opacity: 0.0}
            PropertyChanges { target: imageHover; opacity: 1.0}
        },
        State {
            name: "press" ;
            PropertyChanges { target: body ; anchors.topMargin: 2}
            PropertyChanges { target: image; opacity: 0.0}
            PropertyChanges { target: imageHover; opacity: 1.0}
        }
    ]
    transitions: [
        Transition {
            PropertyAnimation{property:"opacity" ; duration: 300;}
        }
    ]
}
