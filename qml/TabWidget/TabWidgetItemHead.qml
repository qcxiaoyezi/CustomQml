import QtQuick 2.2

Item{
    id: tabWidgetItemHead
    width: 220

    property string icon : ""
    property string defaultIcon
    property string title: ""
    property string defaultTitle: "新建页面"

    property int radius: 3
    property color textColor
    property color borderColor : "#8aa7bd"
    property color bodyColorGs1 : "#cbdbe8"
    property color bodyColorGs2 : "#c7d5e2"

    property alias mouseArea: mouseArea

    /*背景*/
    Item{
        id: bgFrameItem
        anchors.fill: parent;
        clip: true
        Rectangle{
            anchors.fill: parent;
            anchors.bottomMargin: -radius
            radius: tabWidgetItemHead.radius
            border{width: 1; color: borderColor}
            gradient: Gradient {
                GradientStop {position: 0.0; color: bodyColorGs1 }
                GradientStop {position: 1.0; color: bodyColorGs2 }
            }
        }
    }

    /*左右斜坡*/
    Image{
        id: leftSlope
        anchors{right: bgFrameItem.left; rightMargin: -1; bottom: parent.bottom}
        source: "qrc:///images/leftSlope2.png"
    }
    Image{
        id: rightSlope
        anchors{left: bgFrameItem.right; leftMargin: -1; bottom: parent.bottom}
        source: "qrc:///images/rightSlope2.png"
    }

    MouseArea{
        id: mouseArea
        anchors.fill: parent;
        hoverEnabled: true
        onClicked: {
            tabWidget.activeItem = tabWidgetItem
        }

        Image{
            id:image
            anchors{left: parent.left; leftMargin: 8; verticalCenter: parent.verticalCenter;}
            width: 16;height: 16;
            smooth: true

            fillMode: Image.PreserveAspectFit
            source: (tabWidgetItemHead.icon)?tabWidgetItemHead.icon:tabWidgetItemHead.defaultIcon;
        }

        Text {
            id: text
            anchors{left: image.right; leftMargin: 6; right: closeBtn.left;}
            anchors.verticalCenter: parent.verticalCenter;
            text: (tabWidgetItemHead.title)?tabWidgetItemHead.title:tabWidgetItemHead.defaultTitle;

            renderType: Text.NativeRendering
            elide: Text.ElideRight;
            font.family: "微软雅黑"
            font.pixelSize: 12
            color: tabWidgetItemHead.textColor
        }
        TabWidgetItemCloseBtn{
            id: closeBtn
            anchors{right: parent.right; rightMargin: 5; verticalCenter: parent.verticalCenter}
            mouseArea.onClicked: {
                fuckme(tabWidgetItem)
            }
        }
    }

    state : (tabWidget.activeItem === tabWidgetItem) ? "active" : mouseArea.containsMouse ? "hover" : "normal"
    states: [
        State {
            name: "normal" ;
            PropertyChanges { target: tabWidgetItemHead;
                borderColor:"#8aa7bd";  textColor: "#525d6b";
                bodyColorGs1:"#cbdbe8"; bodyColorGs2:"#cad9e7"}
            PropertyChanges { target: leftSlope; visible: false}
            PropertyChanges { target: rightSlope; visible: false}
        },
        State {
            name: "hover" ;
            PropertyChanges { target: tabWidgetItemHead;
                borderColor:"#7e9db2"; textColor: "#525d6b"
                bodyColorGs1:"#e2ecf4"; bodyColorGs2:"#e0eaf1"}
            PropertyChanges { target: leftSlope; visible: false}
            PropertyChanges { target: rightSlope; visible: false}
        },
        State {
            name: "active" ;
            PropertyChanges { target: tabWidgetItemHead;
                borderColor:"#82abc6"; textColor: "#202020";
                bodyColorGs1:"#f7f9fb"; bodyColorGs2:"#f2f5f7"}
            PropertyChanges { target: leftSlope; visible: true}
            PropertyChanges { target: rightSlope; visible: true}
        }
    ]
}
