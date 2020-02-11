import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtGraphicalEffects 1.0


Rectangle {
    id:mainColumn
    property alias datetext: datetext
    property alias  titletext: title
    property alias usertext: userText
    color: "#33d4d7de"


    signal trashButtonChecked()


    Component.onCompleted: {
        mainColumn.trashButtonChecked.connect(deleteButtonRealization)
    }

    Text {
        id: datetext
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.topMargin: 5
        anchors.rightMargin: 5
        font.family: "poppins_black"
        color: "#8f000000"
        font.pixelSize: 12
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
            anchors.right: trashButton.left
            width: parent.width - 20 - trashButton.width

            placeholderText:"Title"
            font.family: "merriweather"

            font.pixelSize: 24
            maximumLength: 40
            selectionColor: "#3399FF"
            selectByMouse: true
            background: Rectangle {
                visible: false
            }
        }
    }



    Item {
        anchors.top: topItem.bottom

        width: parent.width
        height: parent.height-60
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
                selectionColor: "#3399FF"
                focus: true

            }
        }
    }

    Rectangle {
        id: trashButton
        height: 25
        width: height
        color: parent.color
        radius: height
        anchors.right: parent.right
        anchors.rightMargin: 3
        anchors.top: datetext.bottom

        Image {
            id: trashIcon
            anchors.fill: parent
            anchors.margins: 2
            source: "resources/images/trash.svg"
        }

        ColorOverlay {
            id: trashColorOverlay
            anchors.fill: trashIcon
            source: trashIcon
            color: "#aaaaaa"
        }

        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            onClicked: {
                trashButtonChecked()
                trashButton.state = "trashButtonEntered"
            }
            onEntered: trashButton.state = "trashButtonEntered"
            onExited: trashButton.state = ""
            onPressed: trashButton.state = "trashButtonPressed"
            cursorShape: Qt.PointingHandCursor
        }

        states: [
            State {
                name: "trashButtonEntered"
                PropertyChanges {
                    target: trashColorOverlay
                    color: "#777777"
                }
            },
            State {
                name: "trashButtonPressed"
                PropertyChanges {
                    target: trashButton
                    color: "white"
                }
            }]
        transitions: [
            Transition {
                from: ""
                to: "trashButtonEntered"
                PropertyAnimation {
                    properties: "color"
                    duration: 250
                    easing.type: Easing.OutQuad
                }

            },
            Transition {
                from: "trashButtonEntered"
                to: ""
                PropertyAnimation {
                    properties: "color"
                    duration: 250
                    easing.type: Easing.InQuad
                }
            },
            Transition {
                from: "trashButtonEntered"
                to: "trashButtonPressed"
                PropertyAnimation {
                    properties: "color"
                    duration: 70
                    easing.type: Easing.OutQuad
                }
            },
            Transition {
                from: "trashButtonPressed"
                to: "trashButtonEntered"
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
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
