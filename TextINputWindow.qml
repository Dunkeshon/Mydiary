import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtGraphicalEffects 1.0


Rectangle {
    id:mainColumn
    property var dateInfo
    property var editInfo
    property alias titletext: title
    property alias usertext: userText
    property color themeColor: "#f4f5f8"
    property color textSelectionColor: "#3399FF"
    property color iconColor: "#aaaaaa"
    property color enteredButtonColor: "#777777"
    property color pressedButtonColor:  "black"

    color: themeColor

    Component.onCompleted: {
        trashButton.buttonChecked.connect(deleteButtonRealization)
    }

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
            selectionColor: textSelectionColor
            selectByMouse: true
            focus: true
            background: Rectangle {
                visible: false
            }
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
                renderType: Text.QtRendering
                placeholderText: qsTr("Enter Something)")
                font.pixelSize: 18
                font.family: "merriweather"
                wrapMode: TextArea.WordWrap
                selectByMouse: true
                selectionColor: textSelectionColor
                focus: true
            }
        }
    }


    BUTTON {
        id:trashButton
        size: 25
        anchors.right: parent.right
        anchors.margins: 3
        anchors.top: parent.top
        iconSource: "resources/images/trash.svg"
        iconMargins: 2
        bColor: parent.color
        iconColor: iconColor
        toolTipText: "Delete page"

        changePressedTargetOnColorOverlay: true
        enteredColor: enteredButtonColor
        pressedColor: pressedButtonColor
    }

    BUTTON {
        id:infoButton
        size: 25
        anchors.right: trashButton.left
        anchors.margins: 3
        anchors.top: parent.top

        iconSource: "resources/images/infoIcon.svg"
        iconMargins: 2
        bColor: parent.color
        iconColor: iconColor
        toolTipText: {
            toolDelay=0
            toolTimeout=0
            if(editInfo === "" || editInfo === dateInfo)
                return "Created: " + dateInfo
            return "Created: " + dateInfo + "\nEdited:   " + editInfo
        }

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
