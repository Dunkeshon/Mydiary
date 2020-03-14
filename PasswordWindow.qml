import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Window 2.12
import Diary 1.0
import "funclist.js" as F
import QtGraphicalEffects 1.0



Rectangle {
    id:pWindow
    property alias myPassword:password.text
    property bool locked: true

    anchors.fill: parent




    //Keys.onPressed:password.forceActiveFocus
    Image {
        id: backgroundTop
        source: "qrc:/resources/images/beigePassTop.png"
        z:0
        anchors.fill: parent
    }
    Image {
        id: backgroundBOttom
        source: "qrc:/resources/images/beigePassBottom.png"
        z:0
        anchors.fill: parent
    }


    Image {
        id: lock
        anchors.centerIn: parent

        width: 100
        height: 86


        source:locked==true? "qrc:/resources/images/new_lock.svg":"qrc:/resources/images/new_unlock.svg"

        sourceSize.width: width*Screen.devicePixelRatio
        sourceSize.height: height*Screen.devicePixelRatio
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
    ColorOverlay {
        id: lockOverlay
        anchors.fill: lock
        source: lock
        transformOrigin: Item.Center
        color: "#D6A76F"
    }

    Rectangle{
        id:passwordRect
        width: 230
        height: 52
        border.color: "#D6A76F"
        border.width: 2
        radius: 26
        z:2
        anchors.top: lock.bottom
        anchors.horizontalCenter: lock.horizontalCenter
        anchors.topMargin: 20

        states: [
            State {
                name: "reanchored"
                AnchorChanges {
                    target: passwordRect
                    anchors.top: undefined
                }

            }
        ]
        MouseArea{
            anchors.fill: parent
            onClicked: password.forceActiveFocus()
            cursorShape: Qt.IBeamCursor
        }

        TextField{
            id:password

//            width: 200
//            height: 30
            anchors.centerIn: parent
            echoMode: "Password"
            font.pixelSize: 18
            color: "black"
            horizontalAlignment: Text.AlignHCenter
            placeholderText: "Password"
            focus: true
            background:
                Rectangle {
                color: "white"
            }

            onEditingFinished: F.acceptPassword()
        }
    }
    Button{
        id:confirmButton
        contentItem: Text {
            text: "Go"
            font.family: "Poppins"
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 16
            color:"white"
        }


        onClicked:F.acceptPassword()
        width: 70
        height: 35
        anchors.top: passwordRect.bottom
        anchors.horizontalCenter: passwordRect.horizontalCenter
        anchors.topMargin: 20
        z:2
        background: Rectangle{
            radius: 26
            border.color: "#976D3B"
            border.width: 1
            color: "#D6A76F"
        }



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
        onTriggered:{
            pWindow.visible=false
            mainItem.visible=true
        }

    }



}
/*import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Window 2.12
import Diary 1.0
import "funclist.js" as F



Rectangle {
    id:pWindow
    property alias myPassword:password.text
    property bool locked: true

    anchors.fill: parent




    //Keys.onPressed:password.forceActiveFocus
    Image {
        id: background
        source: "qrc:/animeTheme/Anime/background.jpg"
        z:0
        anchors.fill: parent
    }

    Image {
        id: lock
        anchors.centerIn: parent

        width: 150
        height: 150


        source:locked==true? "qrc:/resources/images/lock.svg":"qrc:/resources/images/unlock2.svg"

        sourceSize.width: width*Screen.devicePixelRatio
        sourceSize.height: height*Screen.devicePixelRatio
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
        focus: true
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
        onTriggered:{
            pWindow.visible=false
            mainItem.visible=true
        }

    }



}


*/


/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
