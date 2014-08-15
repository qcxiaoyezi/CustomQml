import QtQuick 2.2
import QtWebKit 3.0


Item{
    id: tabWidgetItem
    anchors.fill: parent
    focus: true

    property int tabHeadOffset: 40
    property color borderColor : "#8aa7bd"
    property color bodyColorGs1 : "#cbdbe8"
    property color bodyColorGs2 : "#c7d5e2"


    Item{
        id: tabHead
        anchors{left: parent.left; right: parent.right; top: parent.top}
        height: 28;
        /*分割线*/
        Rectangle{
            width: parent.width; height: 1
            anchors.bottom: parent.bottom;
            color: "#82abc6"
        }
        Item{
            id: tabHeadBtn
            width: 220; height: parent.height;
            x: tabHeadOffset + index*(width+1)
            clip: true;
            /*背景*/
            Rectangle{
                anchors.fill: parent;
                anchors.bottomMargin: -radius;
                radius: 5
                border{id: border; width: 1; color: borderColor}
                gradient: Gradient {
                    GradientStop {id:gs1; position: 0.0; color: bodyColorGs1 }
                    GradientStop {id:gs2; position: 1.0; color: bodyColorGs2 }
                }
            }

            Image{
               anchors.left: parent.left;
               anchors.leftMargin: 3
               anchors.verticalCenter: parent.verticalCenter;
               source: webView.icon
            }

            Text {
                anchors{left: parent.left; right: parent.right; leftMargin: 30}
                anchors.verticalCenter: parent.verticalCenter;
                anchors.verticalCenterOffset: 1

                text: webView.title;
                font.family: "微软雅黑"
                font.pixelSize: 12
                color: "#202020"
            }

            MouseArea{
                id: mouseArea
                anchors.fill: parent;
                hoverEnabled: true
                onPressed: {
                    tabWidgetItem.forceActiveFocus();
                }
            }
        }
        /*左右斜坡*/
        Image{
            id: leftSlope
            anchors{right: tabHeadBtn.left; rightMargin: -1; bottom: parent.bottom}
            source: "qrc:///images/leftSlope2.png"
            visible: ("active" === tabWidgetItem.state)
        }
        Image{
            id: rightSlope
            anchors{left: tabHeadBtn.right; leftMargin: -1; bottom: parent.bottom}
            source: "qrc:///images/rightSlope2.png"
            visible: ("active" === tabWidgetItem.state)
        }
    }

    Item{
        id: tabBody
        anchors{left: parent.left; right: parent.right;
                top:tabHead.bottom; bottom: parent.bottom}
        Rectangle{
            anchors.fill: parent;
            color: "lightyellow"

        }
        WebView{
            id: webView
            anchors.fill: parent
            url: modelData

            onIconChanged: console.debug(icon)
            onTitleChanged: console.debug(title)
        }
    }

    state : focus ? "active" : mouseArea.containsMouse ? "hover" : "normal"
    states: [
        State {
            name: "normal" ;
            PropertyChanges { target: tabWidgetItem; borderColor:"#8aa7bd";
                bodyColorGs1:"#cbdbe8"; bodyColorGs2:"#cad9e7"}
            PropertyChanges { target: tabWidgetItem; z: 0}
        },
        State {
            name: "hover" ;
            PropertyChanges { target: tabWidgetItem; borderColor:"#7e9db2";
                bodyColorGs1:"#e2ecf4"; bodyColorGs2:"#e0eaf1"}
            PropertyChanges { target: tabWidgetItem; z: 0}
        },
        State {
            name: "active" ;
            PropertyChanges { target: tabWidgetItem; borderColor:"#82abc6";
                bodyColorGs1:"#f7f9fb"; bodyColorGs2:"#f2f5f7"}
            PropertyChanges { target: tabWidgetItem; z: 1}
        }
    ]
}
