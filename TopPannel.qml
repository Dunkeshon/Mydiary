import QtQuick 2.0
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtGraphicalEffects 1.0

Item {
    id: mainItem

    signal addButtonChecked();
    signal arrowButtonChecked();

    Component.onCompleted: {
        mainItem.addButtonChecked.connect(addButtonRealization)
        mainItem.arrowButtonChecked.connect(arrowButtonRealization)
    }


    Rectangle {
        id: pannel
        anchors.fill: parent
        color: "#6d84de"

        Rectangle {
            id: arrowButton
            height: parent.height
            width: height
            color: pannel.color
            anchors.left: parent.left

            Image {
                id: leftArrowIcon
                anchors.fill: parent
                anchors.margins: 7
                source: "resources/images/leftArrowIcon.svg"
            }

            ColorOverlay {
                id: leftArrowColorOverlay
                anchors.fill: leftArrowIcon
                source: leftArrowIcon
                color: "#ffffff"
            }

            Image {
                id: rightArrowIcon
                anchors.fill: parent
                anchors.margins: 7
                source: "resources/images/rightArrowIcon.svg"
                visible: false
            }

            ColorOverlay {
                id: rightArrowColorOverlay
                anchors.fill: rightArrowIcon
                source: rightArrowIcon
                color: "#ffffff"
                visible: false
            }

            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onClicked: {
                    arrowButtonChecked();
                    if(leftArrowIcon.visible) {
                        leftArrowIcon.visible = false
                        leftArrowColorOverlay.visible = false
                        rightArrowIcon.visible = true
                        rightArrowColorOverlay.visible = true

                        return
                    }
                    leftArrowIcon.visible = true
                    leftArrowColorOverlay.visible = true
                    rightArrowIcon.visible = false
                    rightArrowColorOverlay.visible = false
                }
                onEntered: arrowButton.state = "arrowButtonEntered"
                onExited: arrowButton.state = ""
                onPressed: arrowButton.state = "arrowButtonPressed"
                onReleased: {
                    if(!containsMouse) {return}
                    arrowButton.state = "arrowButtonEntered"
                }
                cursorShape: Qt.PointingHandCursor
            }

            states: [
                State {
                    name: "arrowButtonEntered"
                    PropertyChanges {
                        target: leftArrowIcon.visible ? leftArrowColorOverlay : rightArrowColorOverlay
                        color: "#70E883"
                    }
                },
                State {
                    name: "arrowButtonPressed"
                    PropertyChanges {
                        target: arrowButton
                        color: "#4c69d7"
                    }
                }]
            transitions: [
                Transition {
                    from: ""
                    to: "arrowButtonEntered"
                    PropertyAnimation {
                        properties: "color"
                        duration: 250
                        easing.type: Easing.OutQuad
                    }

                },
                Transition {
                    from: "arrowButtonEntered"
                    to: ""
                    PropertyAnimation {
                        properties: "color"
                        duration: 250
                        easing.type: Easing.InQuad
                    }
                },
                Transition {
                    from: "arrowButtonEntered"
                    to: "arrowButtonPressed"
                    PropertyAnimation {
                        properties: "color"
                        duration: 70
                        easing.type: Easing.OutQuad
                    }
                },
                Transition {
                    from: "arrowButtonPressed"
                    to: "arrowButtonEntered"
                    PropertyAnimation {
                        properties: "color"
                        duration: 150
                        easing.type: Easing.InQuad
                    }
                },
                Transition {
                    from: "arrowButtonPressed"
                    to: ""
                    PropertyAnimation {
                        properties: "color"
                        duration: 250
                        easing.type: Easing.InQuad
                    }
                }]

        }

        Rectangle {
            id: addButton
            property alias iconColor: plusColorOverlay
            property alias iconY: plusIcon.y
            height: parent.height
            width: height
            color: pannel.color
            anchors.left: arrowButton.right

            Image {
                id: plusIcon
                anchors.fill: parent
                anchors.margins: 7
                source: "resources/images/plusIcon.svg"
            }

            ColorOverlay {
                id: plusColorOverlay
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
                onEntered: addButton.state = "addButtonEntered"
                onExited: addButton.state = ""
                onPressed: addButton.state = "addButtonPressed"
                onReleased: {
                    if(!containsMouse) {return}
                    addButton.state = "addButtonEntered"
                }
                cursorShape: Qt.PointingHandCursor
            }

            states: [
                State {
                    name: "addButtonEntered"
                    PropertyChanges {
                        target: plusColorOverlay
                        color: "#70E883"
                    }
                },
                State {
                    name: "addButtonPressed"
                    PropertyChanges {
                        target: addButton
                        color: "#4c69d7"
                    }
                }]
            transitions: [
                Transition {
                    from: ""
                    to: "addButtonEntered"
                    PropertyAnimation {
                        properties: "color"
                        duration: 250
                        easing.type: Easing.OutQuad
                    }

                },
                Transition {
                    from: "addButtonEntered"
                    to: ""
                    PropertyAnimation {
                        properties: "color"
                        duration: 250
                        easing.type: Easing.InQuad
                    }
                },
                Transition {
                    from: "addButtonEntered"
                    to: "addButtonPressed"
                    PropertyAnimation {
                        properties: "color"
                        duration: 70
                        easing.type: Easing.OutQuad
                    }
                },
                Transition {
                    from: "addButtonPressed"
                    to: "addButtonEntered"
                    PropertyAnimation {
                        properties: "color"
                        duration: 150
                        easing.type: Easing.InQuad
                    }
                },
                Transition {
                    from: "addButtonPressed"
                    to: ""
                    PropertyAnimation {
                        properties: "color"
                        duration: 250
                        easing.type: Easing.InQuad
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
