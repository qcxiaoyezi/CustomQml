//import QtQuick 2.2
//import QtQuick.Controls 1.1
//import QtQuick.Window 2.1


//import QtWinExtras 1.0
//import QtGraphicalEffects 1.0




//ApplicationWindow {
//    id: appWindow

//    width: Screen.desktopAvailableWidth;
//    height: Screen.desktopAvailableHeight;

//    visible: true
//    color: "transparent"

//    flags:   Qt.FramelessWindowHint
//           | Qt.WindowSystemMenuHint
//           | Qt.WindowMinimizeButtonHint
//           | Qt.Window

//    ResizeArea{
//        width: 600
//        height: 400

//        Rectangle{
//            anchors.fill: parent;
//            border.width: 1
//            border.color: "#59819B"
//            radius: 3
//            color: "#A4BED4"
//            smooth: true
//            clip: true

//            Item{
//                id: titlebar
//                anchors.top: parent.top;
//                anchors.left: parent.left;
//                anchors.right: parent.right;
//                anchors.margins: 1
//                height: 64;

//                Item{
//                    anchors.fill: parent
//                    clip: true
//                    Rectangle{
//                        anchors.fill: parent
//                        radius: 3
//                        anchors.bottomMargin: -radius
//                        gradient: Gradient {
//                            GradientStop { position: 0.0; color: "#FEFEFE" }
//                            GradientStop { position: 1.0; color: "#E8ECF1" }
//                        }
//                    }
//                    Rectangle{
//                        anchors.bottom: parent.bottom;
//                        width: parent.width
//                        height: 1
//                        color: "#719fbe"
//                    }
//                }
//                Rectangle{
//                    anchors.top: parent.bottom;
//                    width: parent.width
//                    height: 5
//                    gradient: Gradient {
//                        GradientStop {id:bgs1; position: 0.0; color: "#15000000" }
//                        GradientStop {id:bgs2; position: 1.0; color: "#00000000" }
//                    }
//                }

//                Logo360{
//                    id: logo
//                    x: y
//                    anchors.verticalCenter: parent.verticalCenter
//                }

//                MenuBarItem360{
//                    id: title
//                    y: 3
//                    anchors{left: logo.right; leftMargin: 4}
//                    text: "360那啥浏览器 6.1"
//                }

//                Row{
//                    id: btnsRow
//                    anchors{left: logo.right; leftMargin: 10; bottom: logo.bottom}
//                    spacing: 6
//                    PushButton360{
//                        image.source: "qrc:///images/return.png"
//                    }
//                    PushButton360{
//                        image.source: "qrc:///images/refresh.png"
//                    }
//                    PushButton360{
//                        image.source: "qrc:///images/home.png"
//                    }
//                    PushButton360{
//                        image.source: "qrc:///images/star.png"
//                    }
//                }

//                AddressBar360{
//                    id: addressbar
//                    anchors{left: btnsRow.right; leftMargin: 6; bottom: logo.bottom; right: parent.right; rightMargin: 10}

//                }

//                SysBtn360{
//                    id: sysBtn
//                    anchors{topMargin: -1; rightMargin: -1}
//                    onShowMinimized: appWindow.showMinimized();
//                    onShowMaximized: appWindow.showMaximized();
//                    onShowNormal: appWindow.showNormal();
//                    onClose: appWindow.close();
//                }
//                MenuBar360{
//                    anchors{top: parent.top; right: sysBtn.left; rightMargin:5}
//                }

//            }


//            Rectangle{
//                anchors{left: parent.left; leftMargin: 1; right: parent.right; rightMargin: 1;
//                    bottom:backgournd.top;
//                }
//                height: 5;
//                gradient: Gradient {
//                    GradientStop { position: 0.0; color: "#00000000" }
//                    GradientStop { position: 1.0; color: "#15000000" }
//                }
//            }

//            Item{
//                id: backgournd
//                anchors{left: parent.left; leftMargin: 1; right: parent.right; rightMargin: 1;
//                    top: titlebar.bottom; topMargin: 30; bottom: parent.bottom; bottomMargin: 1;}
//                clip: true;
//                Rectangle{
//                    anchors.fill: parent;
//                    anchors.topMargin: -radius
//                    radius: 3
//                    color: "lightyellow"
//                }
//            }

//            StatusBar360{
//                anchors{left: parent.left; right: parent.right; bottom: parent.bottom}
//                anchors.margins: 1

//            }
//        }
//    }



//}

import QtQuick 2.2
import "window"
MainWindow{

}
