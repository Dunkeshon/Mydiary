import QtQuick 2.0
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtGraphicalEffects 1.0

Item {
    id: mainItem

    signal addButtonChecked();

    Component.onCompleted: {
        mainItem.addButtonChecked.connect(addButtonRealization)
    }


    Rectangle {
        id: pannel
        anchors.fill: parent
        color: "#6d84de"
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
                anchors.margins: 7
                source: "resources/images/plusIcon.svg"
                visible: true
            }

            ColorOverlay {
                anchors.fill: plusIcon
                source: plusIcon
                color: "#ffffff"
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
                anchors.margins: 7
                source: "resources/images/searchIcon.svg"
                visible: true
            }

            ColorOverlay {
                anchors.fill: searchIcon
                source: searchIcon
                color: "#ffffff"
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
                anchors.margins: 6
                source: "resources/images/settingsIcon.svg"
                visible: true
            }

            ColorOverlay {
                anchors.fill: settingsIcon
                source: settingsIcon
                color: "#ffffff"
            }
        }


    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:35;width:640}
}
##^##*/
