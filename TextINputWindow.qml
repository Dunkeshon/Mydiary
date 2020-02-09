import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

Rectangle {
    id:mainColumn
    property alias datetext: datetext
    property alias  titletext: title
    property alias usertext: userText

    color:"#D4D7DF"


        Text {
            id: datetext
            anchors.top: parent.top
            anchors.right: parent.right
            anchors.topMargin: 5
            anchors.rightMargin: 5
            text: qsTr("Date here")
            color: Qt.rgba(0, 0, 0, 0.56)
            font.pixelSize: 12
        }
//        Rectangle{
//            id:titleholder
//            anchors.top: parent.top
//            anchors.left: parent.left
//            width: mainColumn.width
//            height: 30
//            anchors.topMargin: 18
//            anchors.leftMargin: 20

            TextField {
                 anchors.top: parent.top
                   anchors.left: parent.left
                   width: mainColumn.width
                 //  height: 30
                   anchors.topMargin: 18
                   anchors.leftMargin: 20
                id:title
                placeholderText:"Title"
                font.family: "Al Bayan"
               // placeholderTextColor: "#aaaaaa"
                //color: "white"

                font.pixelSize: 24
                maximumLength: 24
                selectionColor: "#3399FF"
                selectByMouse: true
                background: Rectangle {
                    visible: false
                }
            }
//        }



    Rectangle {
        anchors.top: title.bottom
        anchors.topMargin: 7
        width: parent.width
        height: parent.height-60
        color:"#D4D7DF" //"#033749"
        ScrollView {
            anchors.fill: parent
            anchors.margins: 10
            TextArea {
                id:userText
                renderType: Text.QtRendering
                placeholderText: qsTr("Enter Something)")
              //  placeholderTextColor: "#aaaaaa"
                //color:"white"
                font.pixelSize: 18
                wrapMode: TextArea.WordWrap

                selectByMouse: true
                selectionColor: "#3399FF"
                focus: true

            }
        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
