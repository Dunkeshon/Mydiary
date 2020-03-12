import QtQuick 2.0
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtGraphicalEffects 1.0
import Diary 1.0

import "funclist.js" as F


Item {
    property alias searchfield: searchField

    property bool buttonsHovered: true
    //Themes
    property color panelColor //: "#6d84de"
    property color image_pressedColor //: "#4c69d7"
    property color image_enteredColor //: "#dddddd"
    property color imageColor
    property color search_themeColor //: "#617adb"
    property color search_textFieldColor //: "white"
    property color search_textSelectionColor //: "#3399FF"



    id: mainItem

    Component.onCompleted: {

        settingsButton.buttonChecked.connect(F.settingsButtonRealization)

        addButton.buttonChecked.connect(F.addButtonRealization)
        arrowButton.buttonChecked.connect(F.arrowButtonRealization)
        searchField.changeFilterText.connect(F.changeFilter)

    }


    Rectangle {
        id: pannel
        anchors.fill: parent
        color: panelColor

        BUTTON {
            id: arrowButton
            hovered: buttonsHovered
            size: parent.height
            bColor: pannel.color
            iconColor: imageColor
            anchors.left: parent.left
            iconSource: "resources/images/leftArrowIcon.svg"
            iconMargins: 6

            enteredColor: image_enteredColor
            pressedColor: image_pressedColor
            toolTipText: "Hide"
            mousearea.onClicked: {

                toolTipText = toolTipText == "Hide" ? "Show" : "Hide"
                iconRotation = iconRotation == 0 ? 180 : 0
            }
        }

        BUTTON  {
            id: addButton
            hovered: buttonsHovered
            size: parent.height
            bColor: pannel.color
            iconColor: imageColor
            anchors.left: arrowButton.right
            iconSource: "resources/images/plusIcon.svg"
            iconMargins: 6

            enteredColor: image_enteredColor
            pressedColor: image_pressedColor
            toolTipText: "Add Page"
        }

        BUTTON {
            id: searchButton
            hovered: buttonsHovered
            size: parent.height
            iconColor: imageColor
            bColor: searchField.state == "" ? pannel.color : searchField.color
            anchors.left: addButton.right
            iconSource: "resources/images/searchIcon.svg"
            iconMargins: 6

            enteredColor: image_enteredColor
            pressedColor: image_pressedColor
            toolTipText: "Search"
            mousearea.onClicked: {
                searchField.state = searchField.state == "" ? "Active" : ""
            }

            SearchField {
                id: searchField
                themeColor : search_themeColor
                textFieldColor: search_textFieldColor
                textSelectionColor: search_textSelectionColor
                anchors.left: parent.right
                width: 0
                height: parent.height
            }
        }
        BUTTON  {
            id: settingsButton
            hovered: buttonsHovered
            size: parent.height
            iconColor:imageColor
            bColor:pannel.color
            anchors.right: parent.right
            iconSource: "resources/images/settingsIcon.svg"
            iconMargins: 6

            enteredColor: image_enteredColor
            pressedColor: image_pressedColor
            toolTipText: "Settings"
        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:35;width:640}
}
##^##*/
