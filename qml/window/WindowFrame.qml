import QtQuick 2.2
import QtQml 2.2
import QtQuick.Window 2.1
import QtQuick.Controls 1.1
import QtGraphicalEffects 1.0

import "../mousearea"

ApplicationWindow{
    id: appWindow
    width: 800;height: 480;
    visible: true
    color: "transparent"
    flags:   Qt.FramelessWindowHint
           | Qt.WindowSystemMenuHint
           | Qt.WindowMinimizeButtonHint
           | Qt.Window

    default property alias content : frame.children
    property alias minSize: resizeArea.minSize
    property alias dragHieght: resizeArea.dragHeight
    ResizeArea{
        id:resizeArea
        anchors.fill: parent
        anchors.margins: 8
        target: appWindow
        minSize: Qt.size(600,400)
        enabled: true

        RectangularGlow {
            id: outGlow
            anchors.fill: frame
            anchors.margins: 5
            anchors.bottomMargin: 0   /*底部阴影没有缩进因此底部阴影颜色最浓*/
            glowRadius: 10
            spread: 0.1
            color: "#A0000000"
            cornerRadius: frame.radius + glowRadius
        }
        Rectangle{
            id: frame
            anchors.fill: parent
            anchors.margins: 4
            color: "#A4BED4"
            border{width: 1; color: "#59819B"}
            smooth: true
            radius: 3
        }
    }


    Item{
        /*visibility 这个变量描述着当前的窗口的显示状态. */
        state:appWindow.visibility
        states: [
            State {
                name: "2"/*QWindow::Windowed*/
                PropertyChanges { target: resizeArea; anchors.margins: 8; enabled: true }
                PropertyChanges { target: outGlow; visible: true }
                PropertyChanges { target: frame; anchors.margins: 4; border.width: 1;  }
            },
            State {
                name: "4"/*"Qt.FullScreen"*/
                PropertyChanges { target: resizeArea; anchors.margins: 0; enabled: false }
                PropertyChanges { target: outGlow; visible: false }
                PropertyChanges { target: frame; anchors.margins: 0; border.width: 0; }
            }
        ]
    }
}
