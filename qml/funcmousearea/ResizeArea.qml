import QtQuick 2.2

MouseArea{
    id: mouseArea
    hoverEnabled: true

    property var target
    property var originPoint
    property string resizeFlag

    property int minWidth: 50
    property int minHeight: 50
    state: "normal"

    onPressed: {
        if(Qt.LeftButton === mouse.button){
            originPoint = {x:mouse.x,y:mouse.y}
        }
    }
    onReleased:{
        if(!(pressedButtons&Qt.LeftButton)){
            state = "normal";
        }
    }
    onPositionChanged: {
        if(Qt.LeftButton & pressedButtons){
            if("active" === state){
                var xChange =  mouse.x - originPoint.x;
                var yChange =  mouse.y - originPoint.y;
                var tmp;
                switch(resizeFlag[0]){
                case "l":
                    tmp = target.width - minWidth;
                    tmp = Math.min(tmp,xChange)
                    target.x += tmp; target.width -= tmp;
                    break;
                case "r":
                    tmp = target.width - minWidth;
                    tmp = Math.max(xChange,-tmp)
                    target.width += tmp; originPoint.x += tmp;
                    break;
                default: break;
                }
                switch(resizeFlag[1]){
                case "t":
                    tmp = target.height - minHeight;
                    tmp = Math.min(tmp,yChange);
                    target.y += tmp;
                    target.height -= tmp;
                    break;
                case "b":
                    tmp = target.height - minHeight;
                    tmp = Math.max(yChange,-tmp)
                    target.height += tmp;
                    originPoint.y += tmp;
                    break;
                default: break;
                }
            }else{
                if(Math.abs(mouse.x-originPoint.x)>3 || Math.abs(mouse.y-originPoint.y)>3){
                    state = "active"
                }
            }
        }else if(!pressedButtons){
            if(mouse.x < 8) resizeFlag = "l"
            else if(mouse.x > width-8) resizeFlag = "r"
            else resizeFlag = "m"
            if(mouse.y < 8) resizeFlag += "t"
            else if(mouse.y > height-8) resizeFlag += "b"
            else resizeFlag += "m"

            switch(resizeFlag){
            case "lt":
            case "rb": cursorShape = Qt.SizeFDiagCursor; break;
            case "lb":
            case "rt": cursorShape = Qt.SizeBDiagCursor; break;
            case "lm":
            case "rm": cursorShape = Qt.SizeHorCursor; break;
            case "mt":
            case "mb": cursorShape = Qt.SizeVerCursor; break;
            default: cursorShape = Qt.ArrowCursor; break;
            }
        }
    }


}
