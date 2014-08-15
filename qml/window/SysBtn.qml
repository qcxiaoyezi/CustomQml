import QtQuick 2.2
import QtGraphicalEffects 1.0
import "./sysbtn"

Item{
    anchors{top: parent.top; right: parent.right}
    width: 125; height: 22;

    property color borderColorNormal: "#C5D3DC"

    signal showMinimized;
    signal showMaximized;
    signal showFullScreen;
    signal showNormal;
    signal close;

    /*border in normal state*/
    Item{
        anchors.fill: parent;
        anchors{topMargin: 1; rightMargin: 1}
        clip: true
        Rectangle{
            anchors.fill: parent
            anchors{topMargin: -radius;rightMargin: -radius}
            radius: 5
            border{width: 1; color: borderColorNormal}
            color: "transparent"
        }
    }
    Rectangle{
        anchors{top:parent.top; topMargin: 1;bottom: parent.bottom; right:skinBtn.right}
        color: borderColorNormal
        width: 1
    }
    Rectangle{
        anchors{top:parent.top; topMargin: 1;bottom: parent.bottom; right:minBtn.right}
        color: borderColorNormal
        width: 1
    }
    Rectangle{
        anchors{top:parent.top; topMargin: 1;bottom: parent.bottom; right:maxBtn.right}
        color: borderColorNormal
        width: 1
    }

    /*buttons*/
    BtnLeft{
        id:skinBtn
        anchors{left: parent.left}
        image.source: "qrc:///images/skin.png"
    }
    BtnMid{
        id: minBtn
        anchors{left: skinBtn.right;leftMargin: -1;}
        image.source: "qrc:///images/minBtn.png"
        mouseArea.onClicked: showMinimized();
    }
    BtnMid{
        id: maxBtn
        anchors{left: minBtn.right;leftMargin: -1;}
        image.source: "qrc:///images/maxBtn.png"
        property bool isMax: false
        mouseArea.onClicked:{
            if(false === isMax){
                isMax = true;
                image.source = "qrc:///images/multipleBtn.png";
                showMaximized();
            }else{
                isMax = false;
                image.source = "qrc:///images/maxBtn.png";
                showNormal();
            }
        }
    }
    BtnRight{
        id: closeBtn
        anchors{left: maxBtn.right;leftMargin: -1; right: parent.right;}
        image.source: "qrc:///images/closeBtn.png"
        mouseArea.onClicked: close();
    }
}
