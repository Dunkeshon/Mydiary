import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

Rectangle {
    id:mainColumn
    property alias datetext: datetext
    property alias  titletext: title
    property alias usertext: userText

    color:"#33d4d7de"


        Text {
            id: datetext
            anchors.top: parent.top
            anchors.right: parent.right
            anchors.topMargin: 5
            anchors.rightMargin: 5
            text: qsTr("Date here")
            font.family: "poppins_black"
            color: "#8f000000"
            font.pixelSize: 12
        }

        Rectangle{
            id:titleholder
            anchors.top: parent.top
              anchors.left: parent.left
              width: mainColumn.width

              height:60
                color:"#33d4d7de"

            TextField {
                id:title
                anchors.top: parent.top
                  anchors.left: parent.left
                anchors.topMargin: 18
                anchors.leftMargin: 20
//                 anchors.top: parent.top
//                   anchors.left: parent.left
//                   width: mainColumn.width
//                   anchors.topMargin: 18
//                   anchors.leftMargin: 20
                placeholderText:"Title"
                font.family: "merriweather"
               // placeholderTextColor: "#aaaaaa"
                //color: "white"

                font.pixelSize: 24
                maximumLength: 26
                selectionColor: "#3399FF"
                selectByMouse: true
                background: Rectangle {
                    visible: false
                }
            }
        }
//        }



    Rectangle {
        anchors.top: titleholder.bottom//title.bottom

        width: parent.width
        height: parent.height-60
        color:mainColumn.color
        ScrollView {
            anchors.fill: parent
            anchors.margins: 10
            TextArea {
                id:userText
                renderType: Text.QtRendering
                placeholderText: qsTr("Enter Something)")
                font.pixelSize: 18
                font.family: "merriweather"
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
