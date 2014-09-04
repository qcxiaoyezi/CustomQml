import QtQuick 2.2
import QtWebKit 3.0


Item{
    id: tabWidgetItem
    anchors.fill: parent
    focus: true

    property int itemWidth: 220
    property int tabHeadOffset
    signal fuckme(var item)

    /*分割线*/
    Rectangle{ width: parent.width; height: 0.5; anchors{bottom: tabHead.bottom; bottomMargin: 1} color: "#05000000" }
    Rectangle{ width: parent.width; height: 1; anchors.bottom: tabHead.bottom; color: "#82abc6" }

    TabWidgetItemHead{
        id: tabHead
        width: itemWidth; height: 28;
        x: tabHeadOffset + index*(width+1)
        title: window.title;
        icon: model["webUrl"] + "/favicon.ico";

        mouseArea.onClicked: {
            var i
            for(i in window){
                console.debug(i+":"+window[i])
            }
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
        Rectangle{
            width: parent.width;
            height: 3;
            color: tabHead.bodyColorGs2;
        }
        WebView{
            id: window
            anchors.fill: parent
            anchors.topMargin: 3
            url: model["webUrl"]

//            onNavigationRequested:{
//                console.debug("hehehe")
//            }
//            onLinkHovered:{
//                console.debug(hoveredUrl)
//            }










            function open(){
                console.debug("open")


            }


        }




    }

    state: tabHead.state
    states: [
        State {
            name: "normal" ;
            PropertyChanges { target: tabWidgetItem; z: 0}
        },
        State {
            name: "hover" ;
            PropertyChanges { target: tabWidgetItem; z: 0}
        },
        State {
            name: "active" ;
            PropertyChanges { target: tabWidgetItem; z: 1}
        }
    ]
}
