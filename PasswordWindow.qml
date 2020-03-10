import QtQuick 2.12
import QtQuick.Controls 2.12
import Diary 1.0
import "funclist.js" as F
Rectangle {
    property alias myPassword:password.text
    property bool locked: true
    id:pWindow
    Image {
        id: background
        source: "qrc:/resources/images/background.jpg"
        z:0
        anchors.fill: parent
    }

    Image {
        id: lock
        anchors.centerIn: parent

        width: 150
        height: 150


        source:locked==true? "qrc:/resources/images/lock.svg":"qrc:/resources/images/unlock2.svg"

        sourceSize.width: width*window.devicePixelRatio
        sourceSize.height: height*window.devicePixelRatio
        states: [
            State {
                name: "reancored"
                AnchorChanges {
                    target: lock
                    anchors.horizontalCenter: undefined
                    anchors.verticalCenter: undefined
                }
            }

        ]

        SequentialAnimation{
             id: unlockedAnim

             PropertyAnimation {
                 target: lock
                 property: "anchors.verticalCenterOffset"

                 easing.type: Easing.Linear

                 to: -30
                 duration: 100
             }

            PropertyAnimation {
                target: lock
                property: "anchors.verticalCenterOffset"

                easing.type: Easing.OutBounce

                to: 0
                duration: 800
            }
        }

        SequentialAnimation{
            id: lockedAnim

            PropertyAnimation {
                target: lock
                property: "anchors.horizontalCenterOffset"

                easing.type: Easing.Linear
                to: -20
                duration: 200
            }
            PropertyAnimation {
                target: lock
                property: "anchors.horizontalCenterOffset"

                easing.type: Easing.Linear
                to: 20
                duration: 200
            }
            PropertyAnimation {
                target: lock
                property: "anchors.horizontalCenterOffset"

                easing.type: Easing.Linear
                to: -10
                duration: 100
            }
            PropertyAnimation {
                target: lock
                property: "anchors.horizontalCenterOffset"

                easing.type: Easing.Linear
                to: 10
                duration: 100
            }
            PropertyAnimation {
                target: lock
                property: "anchors.horizontalCenterOffset"

                easing.type: Easing.Linear
                to: 0
                duration:100
            }

        }
    }


    TextField{
        id:password
        z:2
        width: 200
        height: 30
        anchors.top: lock.bottom
        anchors.horizontalCenter: lock.horizontalCenter
        anchors.topMargin: 20
        echoMode: "Password"
        font.pixelSize: 18
        color: "black"
        horizontalAlignment: Text.AlignHCenter
        placeholderText: "Password"
        background:
            Rectangle {
            color: "#CC9966"
        }
        states: [
            State {
                name: "reanchored"

                AnchorChanges {
                    target: password
                    anchors.top: undefined
                }

            }
        ]
        onEditingFinished: F.acceptPassword()
    }
    Button{
        id:confirmButton
        text: "Confirm"

        onClicked:F.acceptPassword()
        width: 100
        height: 30
        anchors.top: password.bottom
        anchors.horizontalCenter: password.horizontalCenter
        anchors.topMargin: 10
        z:2

    }

    Image {
        id: animeImage
        x: 383
        y: 89
        z:1


        width:282
        height: 401
        anchors.bottomMargin: -10
        anchors.rightMargin: -25
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        source: { return backEnd.generateAnimeGirl()}
        }

    Timer {
        id:acceptedTimer
        interval: 1000;
        onTriggered:pWindow.visible=false

    }



}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
