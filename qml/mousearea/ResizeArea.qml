import QtQuick 2.2

MouseArea{
    id: mouseArea
    hoverEnabled: true
    property var target : mouseArea          /*target 用于存放缩放的目标对象.默认情况下是mouseArea本身*/
    property point oPoint                    /*oPoint(origin Point) 用于记录鼠标按下的那个点*/
    property string rFlag                    /*rFlag(resize Flag) 用于记录当前处于那种缩放模式*/
    property size minSize : Qt.size(50,50)   /*minSize(minimum size) 用于存放缩放的最小大小*/
    property int dragHeight: 0
    property rect oGeometry
    state: "normal"

    onPressed: {
        /*当左键按下的时候记录按下的坐标*/
        if(Qt.LeftButton === mouse.button){
            /*直接使用鼠标位置而不使用本坐标系内的位置可以去除由于本坐标系原点改变带来的细微影响*/
            oPoint = G_Cursor.pos()
            oGeometry = Qt.rect(target.x,target.y,target.width,target.height)
        }
    }
    onReleased:{
        /*当左键松开把当前状态重置为通常(normal)*/
        if(!(pressedButtons&Qt.LeftButton)){
            state = "normal";
        }
    }


    onPositionChanged: {
        if(Qt.LeftButton & pressedButtons){
            if("active" === state){
                var xChange =  G_Cursor.pos().x - oPoint.x;
                var yChange =  G_Cursor.pos().y - oPoint.y;
                var geometry = Qt.rect(target.x,target.y,target.width,target.height)
                switch(rFlag[0]){
                case "l":
                    xChange = Math.min(oGeometry.width-minSize.width,xChange)
                    geometry.x = oGeometry.x + xChange
                    geometry.width = oGeometry.width - xChange
                    break;
                case "r":
                    xChange = Math.max(minSize.width-oGeometry.width,xChange)
                    geometry.width = oGeometry.width + xChange
                    break;
                default: break;
                }
                switch(rFlag[1]){
                case "t":
                    yChange = Math.min(oGeometry.height-minSize.height,yChange)
                    geometry.y = oGeometry.y + yChange
                    geometry.height = oGeometry.height - yChange
                    break;
                case "b":
                    yChange = Math.max(minSize.height-oGeometry.height,yChange)
                    geometry.height = oGeometry.height + yChange;
                    break;
                default: break;
                }
                /*拖动标志*/
                if("md" == rFlag){
                    geometry.x = oGeometry.x + xChange;
                    geometry.y = oGeometry.y + yChange;
                }

                target.x = geometry.x;
                target.y = geometry.y;
                target.width = geometry.width;
                target.height = geometry.height;
            }else{
                if(Math.abs(mouse.x-oPoint.x)>3 || Math.abs(mouse.y-oPoint.y)>3){
                    state = "active"
                }
            }
        }else if(!pressedButtons){
            if(mouse.x < 8) rFlag = "l"
            else if(mouse.x > width-8) rFlag = "r"
            else rFlag = "m"
            if(mouse.y < 8) rFlag += "t"
            else if(mouse.y > height-8) rFlag += "b"
            else if(mouse.y < dragHeight) rFlag += "d"
            else rFlag += "m"

            switch(rFlag){
            case "lt":
            case "rb": cursorShape = Qt.SizeFDiagCursor; break;
            case "lb":
            case "rt": cursorShape = Qt.SizeBDiagCursor; break;
            case "ld":
            case "rd":
            case "lm":
            case "rm": cursorShape = Qt.SizeHorCursor; break;
            case "mt":
            case "mb": cursorShape = Qt.SizeVerCursor; break;
            default: cursorShape = Qt.ArrowCursor; break;
            }
        }
    }
}


