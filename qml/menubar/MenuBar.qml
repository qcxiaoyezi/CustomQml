import QtQuick 2.2
import QtGraphicalEffects 1.0

Item{
    width: row.width
    height: 24

    Row{
        id:row
        anchors.verticalCenter: parent.verticalCenter
        spacing: 1

        MenuBarItem{
            text: "文件"
        }
        MenuBarItem{
            text: "查看"
        }
        MenuBarItem{
            text: "收藏"
        }
        MenuBarItem{
            text: "工具"
        }
        MenuBarItem{
            text: "帮助"
        }
    }
}
