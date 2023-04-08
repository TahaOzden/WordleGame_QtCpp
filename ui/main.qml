import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import com.mywordle 1.0

Window {
    id:window
    width:1280
    height:960
    visible:true
    title:qsTr("Wordle HW")

    property color guessedEmpty :"#fff" //white
    property color guessedRight :"#6aaa64" //dark green
    property color guessedWrongPos :"#b59f3b" //dark yellow
    property color guessedWrong :"#939598" //dark gray
    property color keyboardNotTried :"#d8d8d8" //light gray
    property color keyboardTriedNotFound :"#939598" //dark gray

    property int keyW :40
    property int keyH :60
    property int gridWH :60

    function writeGuessedText (rect, data, row, col){
        if ( wordleCls.row === (row))
        {
            if(data[row].toString() !== null)
            {
                let ch = data[row].toString().charAt(col)

                if(ch==='') {
                    rect.border.color = keyboardNotTried
                }
                else{
                    rect.border.color = "black"
                }
                rect.guessedID.text = ch
            }
        }
    }

    function colorGuessedRects (rect, data, col){
        if (data[col] === 0)
        {
            rect.color = keyboardTriedNotFound
            rect.border.color = rect.color
            rect.guessedID.color = guessedEmpty
        }
        else if (data[col] === 1)
        {
            rect.color = guessedWrongPos
            rect.border.color = rect.color
            rect.guessedID.color = guessedEmpty
        }
        else if (data[col] === 2)
        {
            rect.color = guessedRight
            rect.border.color = rect.color
            rect.guessedID.color = guessedEmpty
        }
    }

    function colorKeyboardRect(id, data, keyIndex){
        if (data[keyIndex] === 1)
        {
            id.color = keyboardTriedNotFound
            id.keyText.color = "black"
        }
        else if (data[keyIndex] === 2)
        {
            id.color = guessedWrongPos
            id.keyText.color = "white"
        }
        else if (data[keyIndex] === 3)
        {
            id.color = guessedRight
            id.keyText.color = "black"
        }
    }

    Wordle {
        id:wordleCls
        onOnKeyClicked:
        {
            writeGuessedText (r1c1, data, 0, 0)
            writeGuessedText (r1c2, data, 0, 1)
            writeGuessedText (r1c3, data, 0, 2)
            writeGuessedText (r1c4, data, 0, 3)
            writeGuessedText (r1c5, data, 0, 4)

            writeGuessedText (r2c1, data, 1, 0)
            writeGuessedText (r2c2, data, 1, 1)
            writeGuessedText (r2c3, data, 1, 2)
            writeGuessedText (r2c4, data, 1, 3)
            writeGuessedText (r2c5, data, 1, 4)

            writeGuessedText (r3c1, data, 2, 0)
            writeGuessedText (r3c2, data, 2, 1)
            writeGuessedText (r3c3, data, 2, 2)
            writeGuessedText (r3c4, data, 2, 3)
            writeGuessedText (r3c5, data, 2, 4)

            writeGuessedText (r4c1, data, 3, 0)
            writeGuessedText (r4c2, data, 3, 1)
            writeGuessedText (r4c3, data, 3, 2)
            writeGuessedText (r4c4, data, 3, 3)
            writeGuessedText (r4c5, data, 3, 4)

            writeGuessedText (r5c1, data, 4, 0)
            writeGuessedText (r5c2, data, 4, 1)
            writeGuessedText (r5c3, data, 4, 2)
            writeGuessedText (r5c4, data, 4, 3)
            writeGuessedText (r5c5, data, 4, 4)

            writeGuessedText (r6c1, data, 5, 0)
            writeGuessedText (r6c2, data, 5, 1)
            writeGuessedText (r6c3, data, 5, 2)
            writeGuessedText (r6c4, data, 5, 3)
            writeGuessedText (r6c5, data, 5, 4)
        }

        onWordChecked:{
            if(wordleCls.row === 0)
            {
                r1col1.shrink.start()
                colorGuessedRects(r1c1,data,0)
                colorGuessedRects(r1c2,data,1)
                colorGuessedRects(r1c3,data,2)
                colorGuessedRects(r1c4,data,3)
                colorGuessedRects(r1c5,data,4)
            }
            else if(wordleCls.row === 1)
            {
                r2col1.shrink.start()
                colorGuessedRects(r2c1,data,0)
                colorGuessedRects(r2c2,data,1)
                colorGuessedRects(r2c3,data,2)
                colorGuessedRects(r2c4,data,3)
                colorGuessedRects(r2c5,data,4)
            }
            else if(wordleCls.row === 2)
            {
                r3col1.shrink.start()
                colorGuessedRects(r3c1,data,0)
                colorGuessedRects(r3c2,data,1)
                colorGuessedRects(r3c3,data,2)
                colorGuessedRects(r3c4,data,3)
                colorGuessedRects(r3c5,data,4)
            }
            else if(wordleCls.row === 3)
            {
                r4col1.shrink.start()
                colorGuessedRects(r4c1,data,0)
                colorGuessedRects(r4c2,data,1)
                colorGuessedRects(r4c3,data,2)
                colorGuessedRects(r4c4,data,3)
                colorGuessedRects(r4c5,data,4)
            }
            else if(wordleCls.row === 4)
            {
                r5col1.shrink.start()
                colorGuessedRects(r5c1,data,0)
                colorGuessedRects(r5c2,data,1)
                colorGuessedRects(r5c3,data,2)
                colorGuessedRects(r5c4,data,3)
                colorGuessedRects(r5c5,data,4)
            }
            else if(wordleCls.row === 5)
            {
                r6col1.shrink.start()
                colorGuessedRects(r6c1,data,0)
                colorGuessedRects(r6c2,data,1)
                colorGuessedRects(r6c3,data,2)
                colorGuessedRects(r6c4,data,3)
                colorGuessedRects(r6c5,data,4)
            }
        }
        onKeyboardChecked:
        {
            colorKeyboardRect(qKey, data, 0)
            colorKeyboardRect(wKey, data, 1)
            colorKeyboardRect(eKey, data, 2)
            colorKeyboardRect(rKey, data, 3)
            colorKeyboardRect(tKey, data, 4)
            colorKeyboardRect(yKey, data, 5)
            colorKeyboardRect(uKey, data, 6)
            colorKeyboardRect(iKey, data, 7)
            colorKeyboardRect(oKey, data, 8)
            colorKeyboardRect(pKey, data, 9)
            colorKeyboardRect(aKey, data, 10)
            colorKeyboardRect(sKey, data, 11)
            colorKeyboardRect(dKey, data, 12)
            colorKeyboardRect(fKey, data, 13)
            colorKeyboardRect(gKey, data, 14)
            colorKeyboardRect(hKey, data, 15)
            colorKeyboardRect(jKey, data, 16)
            colorKeyboardRect(kKey, data, 17)
            colorKeyboardRect(lKey, data, 18)
            colorKeyboardRect(zKey, data, 19)
            colorKeyboardRect(xKey, data, 20)
            colorKeyboardRect(cKey, data, 21)
            colorKeyboardRect(vKey, data, 22)
            colorKeyboardRect(bKey, data, 23)
            colorKeyboardRect(nKey, data, 24)
            colorKeyboardRect(mKey, data, 25)
        }

        onMsgPop:
        {
            msgText.text = data.toString();
            msgRect.visible = true;
            if ( msgAnimationDisappear.running === true)
            {
                msgAnimationDisappear.restart();
            }
            else {
                msgAnimationDisappear.start();
            }
        }
        onMsgPerminent:
        {
            msgRect.width = msgRect.width/2
            msgText.text = data.toString();
            msgRect.visible = true;
        }
    }

    Rectangle {
        id :header
        height :50
        width :parent.width
        z :2

        Rectangle {
            id :headerLine
            anchors.top:parent.bottom
            color :"gray"
            height :1
            width :parent.width
        }
        Image {
            id :moreImage
            source:"../icons/resource/moreIcon"
            height :24
            fillMode :Image.PreserveAspectFit
            anchors.verticalCenter:parent.verticalCenter
            anchors.leftMargin:20
        }
        Image {
            id :questionImage
            source:"../icons/resource/questionIcon"
            height :24
            fillMode :Image.PreserveAspectFit
            anchors.verticalCenter:parent.verticalCenter
            anchors.leftMargin:10
            anchors.left:moreImage.right
        }
        Text {
            id :wordleText
            text :"Wordle"
            color :"black"
            anchors.centerIn:parent
            anchors.verticalCenter:parent.verticalCenter
            font.family:"Tahoma"
            font.pointSize:32
            font.bold:true
        }
        Image {
            id :statisticsImage
            source:"../icons/resource/statisticsIcon"
            height :24
            fillMode :Image.PreserveAspectFit
            anchors.verticalCenter:parent.verticalCenter
            anchors.rightMargin:15
            anchors.right:settingsImage.left
        }
        Image {
            id :settingsImage
            source:"../icons/resource/settingsIcon"
            height :24
            fillMode :Image.PreserveAspectFit
            anchors.verticalCenter:parent.verticalCenter
            anchors.right:parent.right
            anchors.rightMargin:20
        }
    }

    Item {
        id :guessRectContainer
        anchors.top:header.bottom
        anchors.topMargin:5
        anchors.bottom:keyboardContainer.top
        anchors.bottomMargin:200
        anchors.horizontalCenter:parent.horizontalCenter

        width :window.width
        height :window.height - header.height - keyboardContainer.height
        z :0

        Row {
            id :guessRow1
            anchors.horizontalCenter:parent.horizontalCenter
            anchors.verticalCenter:parent.verticalCenter
            spacing:3

            Rect_Guess {id:r1c1}
            Rect_Guess {id:r1c2}
            Rect_Guess {id:r1c3}
            Rect_Guess {id:r1c4}
            Rect_Guess {id:r1c5}
        }
        Row {
            id :guessRow2
            anchors.horizontalCenter:parent.horizontalCenter
            anchors.topMargin:5
            anchors.top:guessRow1.bottom
            spacing:3

            Rect_Guess {id:r2c1}
            Rect_Guess {id:r2c2}
            Rect_Guess {id:r2c3}
            Rect_Guess {id:r2c4}
            Rect_Guess {id:r2c5}
        }
        Row {
            id :guessRow3
            anchors.horizontalCenter:parent.horizontalCenter
            anchors.topMargin:5
            anchors.top:guessRow2.bottom
            spacing:3

            Rect_Guess {id:r3c1}
            Rect_Guess {id:r3c2}
            Rect_Guess {id:r3c3}
            Rect_Guess {id:r3c4}
            Rect_Guess {id:r3c5}
        }
        Row {
            id :guessRow4
            anchors.horizontalCenter:parent.horizontalCenter
            anchors.topMargin:5
            anchors.top:guessRow3.bottom
            spacing:3

            Rect_Guess {id:r4c1}
            Rect_Guess {id:r4c2}
            Rect_Guess {id:r4c3}
            Rect_Guess {id:r4c4}
            Rect_Guess {id:r4c5}
        }
        Row {
            id :guessRow5
            anchors.horizontalCenter:parent.horizontalCenter
            anchors.topMargin:5
            anchors.top:guessRow4.bottom
            spacing:3

            Rect_Guess {id:r5c1}
            Rect_Guess {id:r5c2}
            Rect_Guess {id:r5c3}
            Rect_Guess {id:r5c4}
            Rect_Guess {id:r5c5}
        }
        Row {
            id :guessRow6
            anchors.horizontalCenter:parent.horizontalCenter
            anchors.topMargin:5
            anchors.top:guessRow5.bottom
            spacing:3

            Rect_Guess {id:r6c1}
            Rect_Guess {id:r6c2}
            Rect_Guess {id:r6c3}
            Rect_Guess {id:r6c4}
            Rect_Guess {id:r6c5}
        }
    }

    Item {
        id :keyboardContainer
        anchors.bottom :parent.bottom
        anchors.horizontalCenter:parent.horizontalCenter //bug in intellisense

        width :keyW * 10 + 50
        height :keyH * 3 + 25
        z :1

        Row {
            id :keyboardRow1
            anchors.top:parent.top
            anchors.horizontalCenter:parent.horizontalCenter
            spacing:3

            Rect_KeyboardKey {
                id :qKey
                textString :"Q"}
            Rect_KeyboardKey {
                id:wKey
                textString :"W"}
            Rect_KeyboardKey {
                id:eKey
                textString :"E" }
            Rect_KeyboardKey {
                id:rKey
                textString :"R" }
            Rect_KeyboardKey {
                id:tKey
                textString :"T" }
            Rect_KeyboardKey {
                id:yKey
                textString :"Y" }
            Rect_KeyboardKey {
                id:uKey
                textString :"U" }
            Rect_KeyboardKey {
                id:iKey
                textString :"I" }
            Rect_KeyboardKey {
                id:oKey
                textString :"O" }
            Rect_KeyboardKey {
                id:pKey
                textString :"P" }
        }
        Row {
            id :keyboardRow2
            anchors.top:keyboardRow1.bottom
            anchors.topMargin:5
            anchors.horizontalCenter:parent.horizontalCenter
            spacing:3

            Rect_KeyboardKey {
                id:aKey
                textString :"A"}
            Rect_KeyboardKey {
                id:sKey
                textString :"S" }
            Rect_KeyboardKey {
                id:dKey
                textString :"D" }
            Rect_KeyboardKey {
                id:fKey
                textString :"F" }
            Rect_KeyboardKey {
                id:gKey
                textString :"G" }
            Rect_KeyboardKey {
                id:hKey
                textString :"H" }
            Rect_KeyboardKey {
                id:jKey
                textString :"J" }
            Rect_KeyboardKey {
                id:kKey
                textString :"K" }
            Rect_KeyboardKey {
                id:lKey
                textString :"L" }
        }
        Row {
            id :keyboardRow3
            anchors.top:keyboardRow2.bottom
            anchors.topMargin:5
            anchors.horizontalCenter:parent.horizontalCenter
            spacing:3

            Rect_KeyboardKey {
                textString :"ENTER"
                width:1.5*keyW }
            Rect_KeyboardKey {
                id:zKey
                textString :"Z" }
            Rect_KeyboardKey {
                id:xKey
                textString :"X" }
            Rect_KeyboardKey {
                id:cKey
                textString :"C" }
            Rect_KeyboardKey {
                id:vKey
                textString :"V" }
            Rect_KeyboardKey {
                id:bKey
                textString :"B" }
            Rect_KeyboardKey {
                id:nKey
                textString :"N" }
            Rect_KeyboardKey {
                id:mKey
                textString :"M" }
            Rect_KeyboardKey {
                textString :"\u232B"
                width:1.5*keyW}
        }
    }

    Item{
        id:msgContainer
        y:header.y + 150
        x:header.width/2
        z:3
        Rectangle {
            id:msgRect
            anchors.centerIn:msgContainer
            color :"#000"
            width :2.5 * gridWH
            height :gridWH
            radius :5
            visible:false
            Text {
                id:msgText
                anchors.centerIn:parent
                font.pointSize:12
                font.bold:true
                color :"white"
                text:""
            }
        }
        PropertyAnimation {
            id:msgAnimationDisappear
            target:msgRect
            property:"visible"
            to:false
            duration:1000
        }
    }

    Item {
        id:keyboardKeys
        anchors.fill :parent
        focus:true
        Keys.onPressed:{
            if (event.key === Qt.Key_Q) {wordleCls.keyClicked("Q");}
            else if (event.key === Qt.Key_W) {wordleCls.keyClicked("W");}
            else if (event.key === Qt.Key_E) {wordleCls.keyClicked("E");}
            else if (event.key === Qt.Key_R) {wordleCls.keyClicked("R");}
            else if (event.key === Qt.Key_T) {wordleCls.keyClicked("T");}
            else if (event.key === Qt.Key_Y) {wordleCls.keyClicked("Y");}
            else if (event.key === Qt.Key_U) {wordleCls.keyClicked("U");}
            else if (event.key === Qt.Key_I) {wordleCls.keyClicked("I");}
            else if (event.key === Qt.Key_O) {wordleCls.keyClicked("O");}
            else if (event.key === Qt.Key_P) {wordleCls.keyClicked("P");}
            else if (event.key === Qt.Key_A) {wordleCls.keyClicked("A");}
            else if (event.key === Qt.Key_S) {wordleCls.keyClicked("S");}
            else if (event.key === Qt.Key_D) {wordleCls.keyClicked("D");}
            else if (event.key === Qt.Key_F) {wordleCls.keyClicked("F");}
            else if (event.key === Qt.Key_G) {wordleCls.keyClicked("G");}
            else if (event.key === Qt.Key_H) {wordleCls.keyClicked("H");}
            else if (event.key === Qt.Key_J) {wordleCls.keyClicked("J");}
            else if (event.key === Qt.Key_K) {wordleCls.keyClicked("K");}
            else if (event.key === Qt.Key_L) {wordleCls.keyClicked("L");}
            else if (event.key === Qt.Key_Z) {wordleCls.keyClicked("Z");}
            else if (event.key === Qt.Key_X) {wordleCls.keyClicked("X");}
            else if (event.key === Qt.Key_C) {wordleCls.keyClicked("C");}
            else if (event.key === Qt.Key_V) {wordleCls.keyClicked("V");}
            else if (event.key === Qt.Key_B) {wordleCls.keyClicked("B");}
            else if (event.key === Qt.Key_N) {wordleCls.keyClicked("N");}
            else if (event.key === Qt.Key_M) {wordleCls.keyClicked("M");}
            else if (event.key === Qt.Key_Enter) {wordleCls.keyClicked("ENTER");}
            else if (event.key === Qt.Key_Return) {wordleCls.keyClicked("ENTER");}
            else if (event.key === Qt.Key_Delete) {wordleCls.keyClicked("\u232B");}
            else if (event.key === Qt.Key_Backspace) {wordleCls.keyClicked("\u232B");}
        }
    }
    //Animations
    Animation_Guess{
        id:r1col5
        tgt:r1c5 }
    Animation_Guess{
        id:r1col4
        tgt:r1c4
        grow.onStopped:r1col5.shrink.start() }
    Animation_Guess{
        id:r1col3
        tgt:r1c3
        grow.onStopped:r1col4.shrink.start() }
    Animation_Guess{
        id:r1col2
        tgt:r1c2
        grow.onStopped:r1col3.shrink.start() }
    Animation_Guess{
        id:r1col1
        tgt:r1c1
        grow.onStopped:r1col2.shrink.start() }

    Animation_Guess{
        id:r2col5
        tgt:r2c5 }
    Animation_Guess{
        id:r2col4
        tgt:r2c4
        grow.onStopped:r2col5.shrink.start() }
    Animation_Guess{
        id:r2col3
        tgt:r2c3
        grow.onStopped:r2col4.shrink.start() }
    Animation_Guess{
        id:r2col2
        tgt:r2c2
        grow.onStopped:r2col3.shrink.start() }
    Animation_Guess{
        id:r2col1
        tgt:r2c1
        grow.onStopped:r2col2.shrink.start() }

    Animation_Guess{
        id:r3col5
        tgt:r3c5 }
    Animation_Guess{
        id:r3col4
        tgt:r3c4
        grow.onStopped:r3col5.shrink.start() }
    Animation_Guess{
        id:r3col3
        tgt:r3c3
        grow.onStopped:r3col4.shrink.start() }
    Animation_Guess{
        id:r3col2
        tgt:r3c2
        grow.onStopped:r3col3.shrink.start() }
    Animation_Guess{
        id:r3col1
        tgt:r3c1
        grow.onStopped:r3col2.shrink.start() }

    Animation_Guess{
        id:r4col5
        tgt:r4c5 }
    Animation_Guess{
        id:r4col4
        tgt:r4c4
        grow.onStopped:r4col5.shrink.start() }
    Animation_Guess{
        id:r4col3
        tgt:r4c3
        grow.onStopped:r4col4.shrink.start() }
    Animation_Guess{
        id:r4col2
        tgt:r4c2
        grow.onStopped:r4col3.shrink.start() }
    Animation_Guess{
        id:r4col1
        tgt:r4c1
        grow.onStopped:r4col2.shrink.start() }

    Animation_Guess{
        id:r5col5
        tgt:r5c5 }
    Animation_Guess{
        id:r5col4
        tgt:r5c4
        grow.onStopped:r5col5.shrink.start() }
    Animation_Guess{
        id:r5col3
        tgt:r5c3
        grow.onStopped:r5col4.shrink.start() }
    Animation_Guess{
        id:r5col2
        tgt:r5c2
        grow.onStopped:r5col3.shrink.start() }
    Animation_Guess{
        id:r5col1
        tgt:r5c1
        grow.onStopped:r5col2.shrink.start() }

    Animation_Guess{
        id:r6col5
        tgt:r6c5 }
    Animation_Guess{
        id:r6col4
        tgt:r6c4
        grow.onStopped:r6col5.shrink.start() }
    Animation_Guess{
        id:r6col3
        tgt:r6c3
        grow.onStopped:r6col4.shrink.start() }
    Animation_Guess{
        id:r6col2
        tgt:r6c2
        grow.onStopped:r6col3.shrink.start() }
    Animation_Guess{
        id:r6col1
        tgt:r6c1
        grow.onStopped:r6col2.shrink.start() }
}
