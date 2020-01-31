import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

Item {
    id:mainColumn


    Rectangle {
        id:topRect
        anchors.top: parent.top
        width: parent.width
        height: 65
        color: "#afaaaa"


        Text {
            id: datetext
            height: 28
            width: 100
            text: qsTr("Date here")
            leftPadding: 10
            topPadding: 5
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.leftMargin: 30
            font.pixelSize: 18
            Rectangle {
                id: blackCircle
                anchors.right: parent.left
                anchors.rightMargin: -2
                y: parent.height - height / 2 + 1
                width: 20
                height: 20
                radius: 10
                color: "black"
            }
            Rectangle {
                id:separator
                anchors.top: parent.bottom
                anchors.left: blackCircle.right
                anchors.leftMargin: -5
                height: 2
                radius: 2
                width: mainColumn.width / 3
                color: "black"
            }

            TextField {
                property alias separatopHeight: separator.height
                y: parent.height + separatopHeight
                width: parent.width * 2
                height: parent.height
                anchors.top: separator.bottom
                leftPadding: datetext.leftPadding
                font.pixelSize: 16
                placeholderText: qsTr("Title")

                Text {
                    color: "black"
                    font.pixelSize: 16
                }


                background: Rectangle {
                    visible: false
                }
            }
        }
    }

    Rectangle {
        anchors.top: topRect.bottom
        width: parent.width
        height: parent.height - topRect.height

        gradient: Gradient {
            GradientStop {
                position: 0
                color: "#afaaaa"
            }

            GradientStop {
                position: 1
                color: "#ffffff"
            }
        }


        ScrollView {
            anchors.fill: parent

            TextArea {
                renderType: Text.QtRendering
                leftPadding: 10
                placeholderText: qsTr("Enter Something)")
                font.pixelSize: 16
                wrapMode: TextArea.WordWrap

                selectByMouse: true
                focus: true
            }
        }





//        Flickable {
//            id:bottomFlickable
//            anchors.fill:parent
//            clip: true
//            TextArea.flickable: TextArea  {
//                anchors.fill: parent
//                //persistentSelection: true
//                leftPadding: 10
//                placeholderText: qsTr("Enter Something)")
//                font.pointSize: 18
//                wrapMode: TextArea.WordWrap

//                selectByMouse: true
//                focus: true
//            }
//        }
    }
}



//    Flickable {
//        id: flickableText
//        width: parent.width
//        clip: true
//        ScrollBar.vertical: ScrollBar {
//                id: flickScroll
//            }
//        TextArea.flickable:TextArea {
//            id:monitor
//            persistentSelection: true
//            leftPadding: 10
//                    rightPadding: 6
//                    topPadding: 6
//                    bottomPadding: 6
//                    placeholderText: qsTr("Enter Something)")
//                    wrapMode: TextArea.WordWrap
//                    font.pointSize: 20

//                    selectByMouse: true
//                    focus: true
//                }
//        }

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
