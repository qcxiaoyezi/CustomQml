import QtQuick 2.2
import QtQuick.Controls 1.1
import QtWinExtras 1.0
import QtGraphicalEffects 1.0

import "./funcmousearea"
import "./buttons"

ApplicationWindow {
    id: appWindow
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")
    color: "transparent"

    flags:   Qt.FramelessWindowHint
           | Qt.WindowSystemMenuHint
           | Qt.WindowMinimizeButtonHint
           | Qt.Window

    ResizeArea{
        anchors.fill: parent
        target: appWindow

        Rectangle{
            anchors.fill: parent;
            border.width: 1
            border.color: "#59819B"
            radius: 3
            color: "#A4BED4"
            smooth: true
            clip: true

            Item{
                anchors.top: parent.top;
                anchors.left: parent.left;
                anchors.right: parent.right;
                anchors.margins: 1
                height: 70;
                Rectangle{
                    anchors.fill: parent
                    anchors.bottomMargin: -3
                    radius: 3
                    gradient: Gradient {
                        GradientStop { position: 0.0; color: "#FEFEFE" }
                        GradientStop { position: 1.0; color: "#E9EEF2" }
                    }

                    SysBtn360{
                        anchors{topMargin: -1; rightMargin: -1}
                        onShowMinimized: appWindow.showMinimized();
                        onShowMaximized: appWindow.showMaximized();
                        onShowNormal: appWindow.showNormal();
                        onClose: appWindow.close();
                    }
                }
            }

            Item{
                id: butterfly
                width:  160
                height: 80
                anchors.centerIn: parent
                smooth: true

                Rectangle{
                    anchors.fill: parent
                    anchors.margins: 10
                }
            }

            InnerShadow {
                anchors.fill: butterfly
                smooth: true
                fast: true
                radius: 16
                samples: 24
                spread: 0.1
                verticalOffset: 2
                horizontalOffset: 0

                color: "#000000"
                source: butterfly
            }
        }
    }
}
