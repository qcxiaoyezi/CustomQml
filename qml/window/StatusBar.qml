import QtQuick 2.2
import QtGraphicalEffects 1.0

Item{
    width: parent.width; height: 25


    Item{
        anchors.fill: parent
        clip: true
        Rectangle{
            anchors.fill: parent
            anchors.topMargin: -radius
            radius: 3
            color: "#e8eef3"
        }
        /*顶部的分割线*/
        Rectangle{ width: parent.width; height: 1; color: "#d1d8da" }
    }


    Image{
        anchors{bottom: parent.bottom; bottomMargin: 1; right: parent.right; rightMargin: 1}
        source: "qrc:///images/statusbarSlash.png"
    }
}
