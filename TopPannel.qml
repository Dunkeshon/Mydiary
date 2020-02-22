import QtQuick 2.0
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtGraphicalEffects 1.0

Item {
    property alias searchfield: searchField
    id: mainItem

    Component.onCompleted: {
        addButton.buttonChecked.connect(addButtonRealization)
        arrowButton.buttonChecked.connect(arrowButtonRealization)
        searchField.searchFinished.connect(updateProxyModel)
    }


    Rectangle {
        id: pannel
        anchors.fill: parent
        color: "#6d84de"

        BUTTON {
            id: arrowButton
            height: parent.height
            width: height
            color: pannel.color
            anchors.left: parent.left
            iconSource: "resources/images/leftArrowIcon.svg"
            mousearea.onClicked: {
                iconRotation = iconRotation == 0 ? 180 : 0
            }
        }

        BUTTON  {
            id: addButton
            height: parent.height
            width: height
            color: pannel.color
            anchors.left: arrowButton.right
            iconSource: "resources/images/plusIcon.svg"
        }

        BUTTON {
            id: searchButton
            height: parent.height
            width: height
            color: searchField.state == "" ? pannel.color : searchField.color
            anchors.left: addButton.right
            iconSource: "resources/images/searchIcon.svg"
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
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:35;width:640}
}
##^##*/
