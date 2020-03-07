import QtQuick 2.12
import QtQuick.Controls 2.12
import Diary 1.0

Rectangle {
    property alias myPassword:password.text
    property bool locked: true
    id:pWindow
    Image {
        id: background
        source: "qrc:/resources/images/concrete-wall-3847504.svg"
        z:0
        anchors.fill: parent
    }

    Image {
        id: lock
        anchors.centerIn: parent

        width: 150
        height: 150



        source: {
            if(locked==true){
                return "qrc:/resources/images/lock.svg"
            }
            else{
                return "qrc:/resources/images/unlock2.svg"
            }
        }
        PropertyAnimation { id: unlockedAnim
            target: lock
            property: "y"
            easing.type: Easing.OutBounce
            from:0
            to: -100
            duration: 1200

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
    }
    Button{
        id:confirmButton
        text: "Confirm"
        onClicked: {
            if(myPassword==="12345"){
                locked=false
                unlockedAnim.start()
                acceptedTimer.running=true;
                // подпрыгивание
            }
            else{
                //дерганье
            }
        }
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
        interval: 2000;
        onTriggered:pWindow.visible=false

    }



}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
