import QtQuick 2.2


Item{
    id: tabWidget
    width: 600; height: 400

    property color backgroundColor : "#A4BED4"
    property color coLineColor: "#82abc6"
    property var activePage

    /*背景*/
    Rectangle{
        anchors.fill: parent;
        color:"#A4BED4"
    }
    /*顶部阴影*/
    Rectangle{
        width: parent.width
        height: 5
        gradient: Gradient {
            GradientStop {id:bgs1; position: 0.0; color: "#20000000" }
            GradientStop {id:bgs2; position: 1.0; color: "#00000000" }
        }
    }

    Item{
        anchors.fill: parent
        anchors.topMargin: 2

        FocusScope{
            anchors.fill: parent
            Repeater{
                model: ["http://www.hao123.com","http://www.github.com"]
                delegate:  TabWidgetItem{

                }
            }
        }
    }
}
