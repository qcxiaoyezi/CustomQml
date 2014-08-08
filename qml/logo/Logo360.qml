import QtQuick 2.2

Item{
    width: 48; height: 48;

    Rectangle{
        id: body
        anchors.fill: parent
        border{width: 1; color: "#b2c2cb"}
        radius: 3
        gradient: Gradient {
            GradientStop { position: 0.0; color: "#e5ecf0" }
            GradientStop { position: 0.5; color: "#edf1f4" }
            GradientStop { position: 1.0; color: "#edf1f4" }
        }
    }
    Image{
        anchors.centerIn: parent
        source: "qrc:///image/logo.png"
    }
    MouseArea{
        id: mouseArea
        anchors.fill: parent
        hoverEnabled: true

    }
    state: mouseArea.containsMouse ? "hover" : "normal"
    states: [
        State {
            name: "normal" ;
            PropertyChanges { target: body ;border.color: "#b2c2cb" }
        },
        State {
            name: "hover" ;
            PropertyChanges { target: body ;border.color: "#68c646" }
        }
    ]
    transitions: [
        Transition {
            PropertyAnimation{property:"color" ; duration: 500;}
        }
    ]
}
