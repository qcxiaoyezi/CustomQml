import QtQuick 2.2
import "../buttons"
import "../addressbar"
import "../menubar"


Item{
    anchors{top: parent.top; left: parent.left; right: parent.right}
    height: 64;

    /*background*/
    Item{
        anchors.fill: parent
        clip: true
        Rectangle{
            /*配合父亲Item的裁剪绘制只有左上与右上两个圆角的效果*/
            anchors.fill: parent
            radius: 3
            anchors.bottomMargin: -radius
            gradient: Gradient {
                GradientStop { position: 0.0; color: "#FEFEFE" }
                GradientStop { position: 1.0; color: "#E8ECF1" }
            }
        }
        /*底部分割线*/
        Rectangle{
            anchors.bottom: parent.bottom;
            width: parent.width;height: 1
            color: "#719fbe"
        }
    }

    /*图标*/
    Logo{
        id: logo
        x: y
        anchors.verticalCenter: parent.verticalCenter
    }
    /*标题*/
    Text{
        id: title
        anchors{top: logo.top; topMargin: -4; left: logo.right; leftMargin: 10}
        renderType: Text.NativeRendering
        text: "360那啥浏览器 6.1"
        font.family: "微软雅黑"
        font.pixelSize: 12
        color: "#5a5e65"
    }
    /*一组按钮*/
    Row{
        id: btnsRow
        anchors{left: logo.right; leftMargin: 10; bottom: logo.bottom}
        spacing: 6
        PushButton{
            image.source: "qrc:///images/return.png"
        }
        PushButton{
            image.source: "qrc:///images/refresh.png"
        }
        PushButton{
            image.source: "qrc:///images/home.png"
        }
        PushButton{
            image.source: "qrc:///images/star.png"
        }
    }
    /*地址栏*/
    AddressBar{
        id: addressbar
        anchors{left: btnsRow.right; leftMargin: 6; bottom: logo.bottom; right: parent.right; rightMargin: 10}
    }
    /*系统按钮*/
    SysBtn{
        id: sysBtn
        anchors{topMargin: -1; rightMargin: -1}
        onShowMinimized: mainWindow.showMinimized();
        onShowMaximized: mainWindow.showMaximized();
        onShowNormal: mainWindow.showNormal();
        onClose: mainWindow.close();
    }
    /*菜单栏*/
    MenuBar{
        anchors{top: parent.top; right: sysBtn.left; rightMargin:5}
    }

}
