import QtQuick 2.2
import "../TabWidget"

WindowFrame{
    id: mainWindow
    width: 1000; height: 600;
    minSize: Qt.size(600,400)
    dragHieght: titleBar.height

    TitleBar{
        id: titleBar
        anchors{top: parent.top; left: parent.left; right: parent.right}
        anchors.margins: 1
    }


    TabWidget{
        anchors{left: parent.left; leftMargin: 1; right: parent.right; rightMargin: 1
            top: titleBar.bottom; bottom: statusBar.top}


    }


    StatusBar{
        id: statusBar
        anchors{left: parent.left; right: parent.right; bottom: parent.bottom}
        anchors.margins: 1
    }
}
