import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

Rectangle {
    id: rectangle
    border.width: 2
    border.color:"#917b7b"
    radius: 10
    width: 324
    height: 365
    clip: true
    TextEdit {
        anchors.fill: parent
        textMargin: 10
        width: 240
        text: "text brlow dsklsdosd lsdksdk ldsk ldklsklsdk lsdklklds"
        wrapMode: TextEdit.WordWrap
        font.family: "Helvetica"
        font.pointSize: 20
        color: "black"
        focus: true
        selectByMouse: true
        
        
        
    }
}
