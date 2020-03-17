import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtGraphicalEffects 1.0
import Diary 1.0

import "funclist.js" as F


Rectangle {
    id:mainColumn
    property var dateInfo
    property var editInfo
    property alias titletext: title
    property alias usertext: userText
    property alias favorite: starImage.iconVisible
    property bool buttonsHovered: true

    //Themes
    property color themeColor//: "#f4f5f8"
    property color textSelectionColor//: "#3399FF"
    property color imageColor//: "#aaaaaa"
    property color pannelColor // color of top Pannel
    property color enteredButtonColor//: "#777777"
    property color pressedButtonColor//:  "black"
    property color textColor
    property color textPlaceholderColor
    property color infoToolBackgroundColor
    property color infoToolTipTextColor
    property color infoToolBorderColor
    property color buttonsToolTipTextColor
    property color buttonsToolTipBordersColor

    color: themeColor



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
            color: textColor
            placeholderText:"Awesome title"
            placeholderTextColor: textPlaceholderColor
            font.family: "merriweather"
            font.pixelSize: 24
            maximumLength: 30
            selectionColor: textSelectionColor
            selectByMouse: true
            focus: true
            background: Rectangle {
                visible: false
            }
            KeyNavigation.up: userText
            KeyNavigation.down: userText
            Keys.onReturnPressed: userText.forceActiveFocus()


        }
    }



    Item {
        anchors.top: topItem.bottom
        width: parent.width
        height: parent.height - topItem.height
        ScrollView {
            anchors.fill: parent
            anchors.margins: 10
            TextArea {
                id:userText
                color: textColor
                renderType: Text.QtRendering
                placeholderText: qsTr("What happened today?")
                placeholderTextColor: textPlaceholderColor
                font.pixelSize: 18
                font.family: "merriweather"
                wrapMode: TextArea.WordWrap
                selectByMouse: true
                selectionColor: textSelectionColor
                focus: true
                KeyNavigation.up: title
                KeyNavigation.down: title
                Keys.onPressed: {
                    if (event.key === Qt.Key_Backspace) {
                        if(userText.text=="")
                            title.forceActiveFocus()
                    }
                }
            }
        }
    }


//uses in trashButton and deleting bar
property bool signalEmited: false
property bool pressedAndEntered: false

BUTTON {
    id:trashButton
    hovered: buttonsHovered
    size: 25
    anchors.right: parent.right
    anchors.margins: 3
    anchors.top: parent.top
    iconSource: "resources/images/trash.svg"
    iconMargins: 2
    bColor: parent.color
    iconColor: imageColor
    toolTipText: "Hold to delete "
    toolBorderColor: buttonsToolTipBordersColor
    toolTipTextColor: buttonsToolTipTextColor

    changePressedTargetOnColorOverlay: true
    enteredColor: enteredButtonColor
    pressedColor: pressedButtonColor

    mousearea.onReleased:
    pressedAndEntered = signalEmited = false
    mousearea.onExited:
    pressedAndEntered = true
    mousearea.onEntered:
    if(!mousearea.pressed)
    pressedAndEntered = false

    mousearea.onPressAndHold: {
        if(pressedAndEntered)
        return

        trashButton.buttonChecked.connect(F.deleteButtonRealization)
        trashButton.buttonChecked()
        trashButton.buttonChecked.disconnect(F.deleteButtonRealization)
        signalEmited = true
    }
}

DeletingBar {
    id: deletingBar
    backgroundBarColor: imageColor
    backgroundColor: themeColor
    mainColor: pannelColor

    anchors.fill: parent

    state: trashButton.mousearea.containsPress && !signalEmited && !pressedAndEntered ? "Active" : ""
}

BUTTON {
    id:favoriteButton
    hovered: buttonsHovered
    size: 25
    anchors.right: trashButton.left
    anchors.margins: 3
    anchors.top: parent.top
    iconSource: "resources/images/starIcon.svg"
    iconMargins: 2
    bColor: parent.color
    iconColor: imageColor
    toolTipText: starImage.iconVisible ? "To Favorite" : "From Favorite"
    toolBorderColor: buttonsToolTipBordersColor
    toolTipTextColor: buttonsToolTipTextColor
    changePressedTargetOnColorOverlay: true
    enteredColor: enteredButtonColor
    pressedColor: pressedButtonColor
    mousearea.onClicked: starImage.iconVisible = !starImage.iconVisible

    SVGImage {
        id: starImage
        anchors.fill: parent
        iconMargins: 5
        iconSource: "resources/images/starIcon.svg"
        iconColor: mainColumn.color
        iconVisible: true
    }
}

BUTTON {
    id:infoButton
    hovered: buttonsHovered
    size: 25
    anchors.right: favoriteButton.left
    anchors.margins: 3
    anchors.top: parent.top

    iconSource: "resources/images/infoIcon.svg"
    iconMargins: 2
    bColor: parent.color
    iconColor: imageColor
    toolTipText: {
        toolDelay=0
        toolTimeout=0
        if(editInfo === "" || editInfo === dateInfo)
        return "Created: " + dateInfo
        return "Created: " + dateInfo + "\nEdited:   " + editInfo
    }
    toolBackgroundColor: infoToolBackgroundColor
    toolTipTextColor: infoToolTipTextColor
    toolBorderColor: infoToolBorderColor
    changePressedTargetOnColorOverlay: true
    enteredColor: enteredButtonColor
    pressedColor: enteredButtonColor
}



}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
