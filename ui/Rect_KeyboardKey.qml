import QtQuick 2.15
import QtQuick.Controls 2.15

Rectangle {
    property string textString : ""
    property alias keyText : keyTextID

    color : "#d8d8d8" //light gray
    width : keyW
    height : keyH
    radius : 3
    Text {
        id: keyTextID
        anchors.centerIn: parent
        font.pointSize: 10
        font.bold: true
        color : "black"
        text : textString
    }
    MouseArea {
        id: mouseArea
        anchors.fill: parent
        acceptedButtons: Qt.LeftButton
        hoverEnabled: true
        onClicked: wordleCls.keyClicked(textString)
    }

}
