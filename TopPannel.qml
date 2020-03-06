import QtQuick 2.0
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtGraphicalEffects 1.0
import Diary 1.0

import "funclist.js" as F


Item {
    property alias searchfield: searchField
    id: mainItem

    Component.onCompleted: {
        addButton.buttonChecked.connect(F.addButtonRealization)
        arrowButton.buttonChecked.connect(F.arrowButtonRealization)
        searchField.changeFilterText.connect(F.changeFilter)
    }


    Rectangle {
        id: pannel
        anchors.fill: parent
        color: "#6d84de"

        BUTTON {
            id: arrowButton
            size: parent.height
            bColor: pannel.color
            anchors.left: parent.left
            iconSource: "resources/images/leftArrowIcon.svg"
            iconMargins: 6

            enteredColor: "#dddddd"
            pressedColor: "#4c69d7"
            toolTipText: "Hide"
            mousearea.onClicked: {

                toolTipText = toolTipText == "Hide" ? "Show" : "Hide"
                iconRotation = iconRotation == 0 ? 180 : 0
            }
        }

        BUTTON  {
            id: addButton
            size: parent.height
            bColor: pannel.color
            anchors.left: arrowButton.right
            iconSource: "resources/images/plusIcon.svg"
            iconMargins: 6

            enteredColor: "#dddddd"
            pressedColor: "#4c69d7"
            toolTipText: "Add Page"
        }

        BUTTON {
            id: searchButton
            size: parent.height
            bColor: searchField.state == "" ? pannel.color : searchField.color
            anchors.left: addButton.right
            iconSource: "resources/images/searchIcon.svg"
            iconMargins: 6

            enteredColor: "#dddddd"
            pressedColor: "#4c69d7"
            toolTipText: "Search"
            mousearea.onClicked: {
                searchField.state = searchField.state == "" ? "Active" : ""
            }

            SearchField {
                id: searchField
                anchors.left: parent.right
                width: 0
                height: parent.height
            }
        }

        BUTTON  {
            id: settingsButton
            size: parent.height
            bColor: pannel.color
            anchors.right: parent.right
            iconSource: "resources/images/settingsIcon.svg"
            iconMargins: 6

            enteredColor: "#dddddd"
            pressedColor: "#4c69d7"
            toolTipText: "Settings"
        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:35;width:640}
}
##^##*/
