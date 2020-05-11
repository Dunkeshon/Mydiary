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
    property color buttonsToolTipTextColor
    property color buttonsToolTipBordersColor


    id: mainItem

    Component.onCompleted: {

        settingsButton.buttonChecked.connect(F.settingsButtonRealization)
        addButton.buttonChecked.connect(F.addButtonRealization)
        arrowButton.buttonChecked.connect(F.arrowButtonRealization)
        searchButton.buttonChecked.connect(F.searchButtonRealization)
        searchField.changeFilterText.connect(F.changeFilter)
        lockButton.buttonChecked.connect(F.lockButtonRealization)
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
            x:0
            iconSource: "resources/images/leftArrowIcon.svg"
            iconMargins: 6

            enteredColor: image_enteredColor
            pressedColor: image_pressedColor
            toolTipText: hideAllDelegates ? (qSettings.isEnglish ? "Show":"Показать") : (qSettings.isEnglish ? "Hide":"Спрятать")
            iconRotation: hideAllDelegates ? 180 : 0
            toolBorderColor: buttonsToolTipBordersColor
            toolTipTextColor: buttonsToolTipTextColor
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
            toolTipText: qSettings.isEnglish ? "Add Page" : "Добавить страницу"
            toolBorderColor: buttonsToolTipBordersColor
            toolTipTextColor: buttonsToolTipTextColor
            mousearea.onClicked: userinput.titletext.forceActiveFocus()
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
            toolTipText: qSettings.isEnglish ? "Search" :"Поиск"
            toolBorderColor: buttonsToolTipBordersColor
            toolTipTextColor: buttonsToolTipTextColor

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

        BUTTON{
            id:lockButton
            hovered: buttonsHovered
            size: parent.height
            iconColor:imageColor
            bColor:pannel.color
            anchors.right: settingsButton.left
            iconSource:passwordWindow.locked?"qrc:/resources/images/new_lock.svg" : "qrc:/resources/images/new_unlock.svg"
            iconMargins: 6

            enteredColor: image_enteredColor
            pressedColor: image_pressedColor
            toolTipText: qSettings.isEnglish ? "Unlocked":"Разблокировано"
            toolBorderColor: buttonsToolTipBordersColor
            toolTipTextColor: buttonsToolTipTextColor
            visible: qSettings.passwordOn ? true : false
            //            mousearea.onClicked: {
            //                passwordWindow.locked = true
            //            }
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
            toolTipText: qSettings.isEnglish ? "Settings":"Настройки"
            toolBorderColor: buttonsToolTipBordersColor
            toolTipTextColor: buttonsToolTipTextColor
        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:35;width:640}
}
##^##*/
