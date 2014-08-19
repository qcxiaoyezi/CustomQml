import QtQuick 2.2


Item{
    id: tabWidget
    width: 600; height: 400;

    property int itemWidth: 220
    property color backgroundColor : "#A4BED4"
    property color coLineColor: "#82abc6"
    property var activeItem

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

        Repeater{
            id: tabWidgetItemRepeater
            model:ListModel {
                id: urlsModel
                ListElement {
                    webUrl: "http://www.hao123.com";
                }
                ListElement {
                    webUrl: "http://www.hao123.com";
                }
            }
            delegate:  TabWidgetItem{
                tabHeadOffset: tabWidgetArrowBtn.width
                itemWidth: tabWidget.itemWidth
                onFuckme: {
                    urlsModel.remove(index)
                }
            }
            onItemAdded: {
                tabWidget.activeItem = item;
            }
            onItemRemoved: {

            }
        }
        TabWidgetAppendItem{
            id: tabWidgetAppendItem
            x: tabWidgetItemRepeater.count * (itemWidth+1) + tabWidgetArrowBtn.width
            mouseArea.onClicked: {
                urlsModel.append({webUrl:"http://www.baidu.com"})
            }
        }
    }


    /*侧边栏 按钮*/
    TabWidgetArrowBtn{
        id: tabWidgetArrowBtn
        width: 35;
        height: 30;

    }



}
