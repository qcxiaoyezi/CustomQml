import QtQuick 2.2
import QtGraphicalEffects 1.0

Item{
    id: menuBar
    width: row.width + mouseArea.width
    height: 24
    clip: true

    MouseArea{
        id: mouseArea
        width: 15; height: parent.height;

        Image{
            id: image
            anchors.centerIn: parent
        }
        onClicked:{ menuBar.state = ("show" != menuBar.state) ? "show" : "hide" }
    }
    Row{
        id:row
        anchors{left:mouseArea.right; verticalCenter: parent.verticalCenter; }
        spacing: 2

        Repeater {
            model: ["文件","查看","收藏","工具","帮助"]
            MenuBarItem360{
                text: modelData
            }
        }
    }
    MenuBarItem360{
        id: item1
        text: "菜单"
        anchors{left:mouseArea.right; verticalCenter: parent.verticalCenter; }
    }

    state: "show"
    states:[
        State{
            name: "show"
            PropertyChanges{target: image; source:"qrc:///image/menuRArrow.png"}
            PropertyChanges{target: menuBar; width: row.width + mouseArea.width}
            PropertyChanges{target: item1; visible: false}
            PropertyChanges{target: row; visible: true}
        },
        State{
            name: "hide"
            PropertyChanges{target: image; source:"qrc:///image/menuLArrow.png"}
            PropertyChanges{target: menuBar; width: item1.width + mouseArea.width}
            PropertyChanges{target: item1; visible: true}
            PropertyChanges{target: row; visible: false}
        }
    ]

    transitions: [
        Transition {
            PropertyAnimation{target: menuBar; property: "width"; duration: 200}
        }
    ]
}
