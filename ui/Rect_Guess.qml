import QtQuick 2.0

Rectangle {
    property alias guessedID : guessedTextID
    color : guessedEmpty
    width : gridWH
    height : gridWH
    border.color: "#d8d8d8" //light gray
    border.width: 2
    Text {
        id: guessedTextID
        anchors.centerIn: parent
        font.pointSize: 16
        font.bold: true
        color : "black"
        text: ""
    }
}
