import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtGraphicalEffects 1.0


Rectangle {
    id:mainColumn
    property alias datetext: datetext
    property alias titletext: title
    property alias usertext: userText
    property alias editText: edittext
    color: "#f4f5f8"
   // onFocusChanged:console.log("focus changed ")


    signal trashButtonChecked()
    signal toolButtonChecked()


    Component.onCompleted: {
        mainColumn.trashButtonChecked.connect(deleteButtonRealization)
        mainColumn.toolButtonChecked.connect(toolButtonRealization)
    }

//    Text {
//        id: datetext
//        anchors.top: parent.top
//        anchors.right: parent.right
//        anchors.topMargin: 5
//        anchors.rightMargin: 5
//        font.family: "poppins_black"
//        color: "#8f000000"
//        font.pixelSize: 12
//    }

//    Text {
//        id: edittext
//        anchors.top: datetext.bottom
//        anchors.right: parent.right
//        anchors.topMargin: 5
//        anchors.rightMargin: 5
//        font.family: "poppins_black"
//        color: "#8f000000"
//        font.pixelSize: 12
//    }

    Item {
        id:topItem
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        height:60


        TextField {
            id:title
            anchors.topMargin: 18
            anchors.leftMargin: 20
            anchors.left: parent.left
            anchors.top: parent.top
            width: parent.width - 20 - trashButton.width

            placeholderText:"Title"
            font.family: "merriweather"

            font.pixelSize: 24
            maximumLength: 40
            selectionColor: "#3399FF"
            selectByMouse: true
            background: Rectangle {
                visible: false
            }
        }
    }



    Item {
        anchors.top: topItem.bottom

        width: parent.width
        height: parent.height- 60
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
            Text {
                id: editDateDescription
                anchors.left: userText.right
                text: qsTr("Edited: ")
                font.family: "Al Bayan"
            }

        }
    }



    OurButton{
        id:trashButton
        sourceImage: "resources/images/trash.svg"
        anchors.right: parent.right
        anchors.margins: 3
        anchors.top: parent.top
        clickable.onClicked:trashButtonChecked()
        imageMargin: 2
        toolTipText: qsTr("Delete note")
    }

    OurButton{
        id:toolButton
        sourceImage: "resources/images/toolIcon.svg"
        anchors.right: trashButton.left
        anchors.rightMargin: 5
        anchors.top: parent.top
        anchors.topMargin: 3

        clickable.onClicked: toolButtonChecked()
        toolTipText: qsTr("Edit mode")
    }


    Rectangle {
        anchors.right: toolButton.left
        anchors.margins: 5
        anchors.top: parent.top
        anchors.topMargin: 3
      //  anchors.top: parent.top
        id: infoButton
        width: 25
        height: width
        radius: height
        color: "black"//parent.color
        ToolTip {
            id:infoField

            visible: infoArea.containsMouse ? true : false
            contentItem:
//                text: toolTipText
//                styleColor: "#ffffff"
//                font.family: "poppins_black"
//                color: "#8f000000"
//            }
                Item {
                id: infoContent
                Text{
                    id:datetextinfo
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.margins: 5
                    text: "Date of creation : "
                }

                Text {
                    id: datetext
                    anchors.top: parent.top
                    anchors.right: parent.right
                    anchors.left:datetextinfo.right
                    anchors.margins: 5
                    font.family: "poppins_black"
                    color: "#8f000000"
                    font.pixelSize: 12
                }

                Text{
                    id:editTextInfo
                    anchors.left: parent.left
                    anchors.bottom: parent.bottom
                    anchors.margins: 5
                    text: "Last editing : "
                }
                Text {
                    id: edittext
                    anchors.top: datetext.bottom
                    anchors.right: parent.right
                    anchors.left: editTextInfo.right
                    anchors.margins: 5
                    font.family: "poppins_black"
                    color: "#8f000000"
                    font.pixelSize: 12
                }
            }

        }


        MouseArea{
            id:infoArea
            anchors.fill: parent

            onClicked: {

                infoRect.visible=true

            }
        }

    }

//    Rectangle{
//        id: infoRect
//        anchors.top: infoButton.bottom
//        //anchors.horizontalCenter:infoButton.horizontalCenter
//     visible: false
//        Text{
//            id:datetextinfo
//            anchors.left: parent.left
//            anchors.top: parent.top
//            anchors.margins: 5
//            text: "Date of creation : "
//        }

//        Text {
//            id: datetext
//            anchors.top: parent.top
//            anchors.right: parent.right
//            anchors.left:datetextinfo.right
//            anchors.margins: 5
//            font.family: "poppins_black"
//            color: "#8f000000"
//            font.pixelSize: 12
//        }

//        Text{
//            id:editTextInfo
//            anchors.left: parent.left
//            anchors.bottom: parent.bottom
//            anchors.margins: 5
//            text: "Last editing : "
//        }
//        Text {
//            id: edittext
//            anchors.top: datetext.bottom
//            anchors.right: parent.right
//            anchors.left: editTextInfo.right
//            anchors.margins: 5
//            font.family: "poppins_black"
//            color: "#8f000000"
//            font.pixelSize: 12
//        }

//    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
