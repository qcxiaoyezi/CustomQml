import QtQuick 2.2
import QtQuick.Controls 1.1
import QtWinExtras 1.0
import "./funcmousearea"

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

    TaskbarButton {
        progress.visible: true
    }

    ResizeArea{
        anchors.fill: parent
        target: appWindow

        Rectangle{
            anchors.fill: parent;
            border.width: 1
            border.color: "#59819B"
            radius: 3
            color: "lightgrey"
            smooth: true
            clip: true


            Rectangle{
                anchors.top: parent.top;
                anchors.left: parent.left;
                anchors.right: parent.right;
                anchors.margins: 1
                radius: parent.radius

                height: 30
                gradient: Gradient {
                    GradientStop { position: 0.0; color: "#F8F9FA" }
                    GradientStop { position: 1.0; color: "#F2F3F4" }
                }

                MouseArea{
                    anchors.fill: parent
                }
            }

        }
    }
}
