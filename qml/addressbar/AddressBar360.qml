import QtQuick 2.2
import QtGraphicalEffects 1.0

Item{
    width: 400; height: 27

    Rectangle{
        anchors.fill: parent
        border{width: 1; color: "#9eb0bc"}
        radius: 3

    }


//    Text {
//        id: text
//        anchors{left: parent.left; leftMargin: 10; verticalCenter: parent.verticalCenter}

//        text: "http://www.hao123.com/?tn=92051968_hao_pg"

//        font.family: "宋体"
//        font.pixelSize: 12
//        color: "#000000"
//    }


    AddressBarBtn360{
        anchors{right: parent.right}
    }
}
