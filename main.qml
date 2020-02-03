import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import Diary 1.0

Window {
    id: window
    visible: true
    color: "#C4C4C4"
    minimumWidth: 640
    minimumHeight: 480
    width: 640
    height: 480
    title: qsTr("My Diary")

    Rectangle {
        id: verticalSeparator
        color:"black"
        width: 2
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.left: leftColumn.right
    }

ColumnLayout {
    id: leftColumn
    width: 200
    height: parent.height
    NotesList {
        id:notesList
        Layout.fillWidth: true

    }
    Button {
        Layout.fillWidth: true
        height: 40
        text: "ADD"
        onClicked: {
            diaryList.addItem()
            notesList.currentIndex=0

        }

    }
}



    TextINputWindow {
        visible: true
        id: userinput
        x: leftColumn.width + verticalSeparator.width
        width: parent.width - leftColumn.width - verticalSeparator.width
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.right: parent.right

    }





//    Rectangle {
//        id: frame
//        height: 6
//        anchors.left: parent.left
//        anchors.leftMargin: 0
//        anchors.right: parent.right
//        anchors.rightMargin: 0
//        border.color: "black"
//        border.width: 1
//        anchors.top: parent.top
//        anchors.topMargin: 27
//    }

//    Text {
//        id: element4
//        x: 35
//        y: 39
//        width: 119
//        height: 20
//        text: qsTr("January")
//        horizontalAlignment: Text.AlignHCenter
//        font.pixelSize: 16
//    }

    //        Row {
    //            id: row
    //            height: 26
    //            spacing: 10
    //            anchors.right: parent.right
    //            anchors.rightMargin: 0
    //            anchors.left: parent.left
    //            anchors.leftMargin: 0
    //            anchors.top: parent.top
    //            anchors.topMargin: 0
    //            Repeater{
    //                model: 3
    //                Rectangle{
    //                    width: 30
    //                    height: parent.height
    //                }
    //            }
    //        }

//    ToolBar {
//        anchors.right: parent.right
//        anchors.rightMargin: 0
//        anchors.left: parent.left
//        anchors.leftMargin: 0
//        anchors.top: parent.top
//        anchors.topMargin: 0
//        RowLayout {
//            anchors.fill: parent

//            ToolButton {
//                text: qsTr("Action 1")
//            }
//            ToolButton {
//                text: qsTr("Action 2")
//            }

//            ToolSeparator {}

//            ToolButton {
//                text: qsTr("Action 3")
//            }
//            ToolButton {
//                text: qsTr("Action 4")
//            }

//            ToolSeparator {}

//            ToolButton {
//                text: qsTr("Action 5")
//            }
//            ToolButton {
//                text: qsTr("Action 6")
//            }
//        }
//    }
}



/*##^##
Designer {
    D{i:1;anchors_height:171;anchors_width:148;anchors_x:42;anchors_y:187}D{i:2;anchors_height:453;anchors_y:27}
D{i:3;anchors_height:432;anchors_x:209;anchors_y:33}
}
##^##*/
