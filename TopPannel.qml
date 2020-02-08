import QtQuick 2.0
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

Item {
    id: mainItem

    signal addButtonChecked();

    Component.onCompleted: {
        mainItem.addButtonChecked.connect(addButtonRealization)
    }


    Rectangle {
        id: pannel
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: bottomSeparator.top
        color: "#1f586d"
        visible: true

        Rectangle {
            id: addButton
            height: parent.height
            width: height
            radius: height
            color: pannel.color
            anchors.left: parent.left

            Image {
                id: plusIcon
                anchors.fill: parent
                anchors.margins: 2
                source: "resources/images/plusImage.png"
                visible: true
            }

            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onClicked: {
                    addButtonChecked()
                }
                onEntered: addButton.state = "enter"
                onExited: addButton.state = ""
                cursorShape: Qt.PointingHandCursor
            }

            states: [
                State {
                    name: "enter"
                    PropertyChanges {
                        target: addButton
                        color: "white"
                    }
                }]
            transitions: [
                Transition {
                    from: ""
                    to: "enter"
                    PropertyAnimation {
                        properties: "color"
                        duration: 1000
                        easing.type: Easing.OutQuad
                    }
                }]

        }
        Rectangle {
            id: searchButton
            height: parent.height
            width: height
            color: pannel.color
            anchors.left: addButton.right

            Image {
                id: searchIcon
                anchors.fill: parent
                anchors.margins: 2
                source: "resources/images/searchImage.png"
                visible: true
            }
        }


        Rectangle {
            id: settingsButton
            height: parent.height
            width: height
            color: pannel.color
            anchors.right: parent.right

            Image {
                id: settingsIcon
                anchors.fill: parent
                source: "resources/images/settingsImage.png"
                visible: true
            }
        }


    }

    Rectangle {
        id: bottomSeparator
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        color: "black"
        height: 1
        visible: true
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:35;width:640}
}
##^##*/
