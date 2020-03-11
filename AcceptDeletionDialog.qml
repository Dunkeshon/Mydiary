import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.Dialogs 1.2
import QtQuick.Window 2.12
import QtGraphicalEffects 1.0
import "funclist.js" as F
import Diary 1.0


Dialog {

    //Themes
    property color mainRectColor: "#A7B9FF"
    property color mainBorderColor: "#6D84DE"
    property color buttonTextColor: "#182763"
    property color textColor: "white"
    property color imageOverlayColor: "white"

    id:deletionDialog

    title: "Deleting"
    width: 215
    height: 85
    contentItem: Rectangle {
        id: rectangle

        color: mainRectColor
        anchors.fill: parent
        border.color: mainBorderColor

        Text {
            id: question
            text: "Are you sure?"
            anchors.horizontalCenter: parent.horizontalCenter
            verticalAlignment: Text.AlignTop
            horizontalAlignment: Text.AlignLeft
            font.family: "Poppins"
            font.pixelSize: 17
            anchors.top: parent.top
            anchors.margins: 10
            color: textColor
        }
        Item{
            id:groupItem
            width: parent.width - 56
            height: yesButton.height


            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottomMargin: 13
            anchors.rightMargin: 28
            anchors.leftMargin: 28

            Button{
                id:yesButton
                height:24
                width: 52
                anchors.left: parent.left
                anchors.bottom: parent.bottom
                contentItem:  Text {
                    text: "Yes"
                    font.family: "Poppins"
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    font.pixelSize: 14
                    color: "#182763"
                }
                background: Rectangle{
                    radius: 26
                    border.color: "#6D84DE"
                    border.width: 1
                    color: "white"
                }
                onClicked:{
                    F.deleteElementRealization()
                    deletionDialog.visible=false
                }
            }

            Image {
                id: trashImage
                source: "qrc:/resources/images/trash.svg"
                sourceSize.width: width*Screen.devicePixelRatio
                sourceSize.height: height*Screen.devicePixelRatio
                height:25
                width:25
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
            }
            ColorOverlay {
                id: trashColorOverlay
                anchors.fill: trashImage
                source: trashImage
                transformOrigin: Item.Center
                color: "white"
            }

            Button{
                id:noButton
                height:24
                width: 52
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                contentItem:  Text {
                    text: "No"
                    font.family: "Poppins"
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    font.pixelSize: 14
                    color: "#182763"
                }
                background: Rectangle{
                    radius: 26
                    border.color: "#6D84DE"
                    border.width: 1
                    color: "white"
                }
                onClicked:{
                    deletionDialog.visible=false
                }
            }
        }
    }

}
