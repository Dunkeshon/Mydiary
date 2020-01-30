import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

Grid{
    id:grid
    spacing: 13
    rows: 4
    columns: 0

    Text {

        anchors.margins: 20
        id: datetext
        x: 30
        text: qsTr("Date here")
        topPadding: 20
        leftPadding: 20
        font.pointSize: 18
    }
    TextField {
        placeholderText:"Title"
        anchors.margins: 20
        id: titleText
        x:20
        horizontalAlignment: Text.AlignLeft
        font.italic: false
        font.bold: false
        topPadding: 0
        leftPadding: 20
        font.pointSize: 20
        Text {
            id: name
            color: "black"
        }
        //textColor:"black"


        background:
            Rectangle{
                visible: false
        }
    }

    Rectangle {
        id: rectangle2
        width: parent.width/2.5
        height: 4
        color: "#060505"
    }

    Flickable {
        id: flickable
        flickableDirection: Flickable.VerticalFlick
        boundsBehavior: Flickable.DragAndOvershootBounds
        height: grid.parent.height / grid.columns - grid.spacing//parent.height - datetext.height -  rectangle2.height - titleText.height -
        width:parent.width
        clip: true
        ScrollBar.vertical: ScrollBar {
                id: flickScroll
            }
        TextArea.flickable:TextArea {
            id:monitor
            persistentSelection: true
            leftPadding: 10
                    rightPadding: 6
                    topPadding: 6
                    bottomPadding: 6
                    placeholderText: qsTr("Enter Something)")
                    wrapMode: TextArea.WordWrap
                    font.pointSize: 20

                    selectByMouse: true
                    focus: true
                }
        }



//    ScrollView{
//        height: grid.parent.height / grid.columns - grid.spacing//parent.height - datetext.height -  rectangle2.height - titleText.height -
//        width:parent.width
//        //padding: 10
//        TextArea {
//            placeholderText: qsTr("Enter Something)")
//            wrapMode: TextEdit.WordWrap
//            font.pointSize: 20
//            selectByMouse: true
//            focus: true
//        }
//    }



}




//TextEdit {
//    anchors.fill: parent
//    textMargin: 10
//    width: 240
//    text: "text brlow dsklsdosd lsdksdk ldsk ldklsklsdk lsdklklds"
//    font.family: "Helvetica"
//    font.pointSize: 20
//    color: "black"
//    focus: true
//    selectByMouse: true
//}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
