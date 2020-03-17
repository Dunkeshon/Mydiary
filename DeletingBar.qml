import QtQuick 2.0
Item {
    id: containsItem

    property var mainColor
    property var backgroundBarColor
    property var backgroundColor

    anchors.fill: parent

    visible: false

    Rectangle {
        id:background
        anchors.fill: parent
        opacity: 0
        color: backgroundColor
    }

    SVGImage {
        id: trashImage

        property var widthcenter: parent.width/2 - width/2
        property var heightcenter: parent.height/2 - height/2

        opacity: 0
        width: 150
        height: 150
        x: widthcenter
        y: heightcenter + 15
        iconSource: "resources/images/trash.svg"
        iconMargins: 10
        iconColor: backgroundBarColor
    }



    Rectangle {
        id: deletingBar
        opacity: 0
        width: trashImage.width + 20
        anchors.left: trashImage.left
        anchors.leftMargin: -10
        anchors.top: trashImage.bottom
        anchors.topMargin: 3
        height: 5
        radius: 5
        border.width: 1
        border.color: backgroundBarColor

        Rectangle {
            id:deletingBarProgress
            anchors.left: parent.left
            height: parent.height
            radius: parent.radius
            color: mainColor
            width: 0
        }
    }

    states: [
        State {
            name: "Active"

            PropertyChanges {
                target: deletingBarProgress
                width: deletingBar.width
            }
            PropertyChanges {
                target: deletingBar
                opacity: 1
            }
            PropertyChanges {
                target: containsItem
                visible: true
            }
            PropertyChanges {
                target: trashImage
                y: heightcenter
                opacity: 1
            }
            PropertyChanges {
                target: background
                opacity: 0.75
            }
        }]
    transitions: [
        Transition {

            from: ""
            to: "Active"

            SequentialAnimation {
                ParallelAnimation {
                    PropertyAnimation{
                        target: background
                        properties: "opacity"
                        easing.type: Easing.OutQuad
                        duration: 100
                    }

                    PropertyAnimation {
                        target: deletingBar
                        properties: "opacity"
                        easing.type: Easing.Linear
                        duration: 100
                    }

                    PropertyAnimation {
                        target: trashImage
                        properties: "y, opacity"
                        easing.type: Easing.Linear
                        duration: 100
                    }
                }

                PropertyAnimation {
                    target: deletingBarProgress
                    properties: "width"
                    duration: 700
                    easing.type: Easing.Linear
                }
            }
        },
        Transition {

            from: "Active"
            to: ""

            ParallelAnimation {

                PropertyAnimation{
                    target: background
                    properties: "opacity"
                    easing.type: Easing.OutQuad
                    duration: 150
                }

                PropertyAnimation {
                    target: deletingBar
                    properties: "opacity"
                    easing.type: Easing.Linear
                    duration: 150
                }

                PropertyAnimation {
                    target: trashImage
                    properties: "y, opacity"
                    easing.type: Easing.Linear
                    duration: 150
                }

                PropertyAnimation {
                    target: deletingBarProgress
                    properties: "width"
                    easing.type: Easing.Linear
                    duration: 100
                }
                PropertyAnimation {
                    target: containsItem
                    properties: "visible"
                    duration: 151
                }

            }
        }]
}


