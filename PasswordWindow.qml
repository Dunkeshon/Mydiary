import QtQuick 2.0
import QtQuick.Controls 2.12
import Diary 1.0

Rectangle {
    property alias myPassword:password.text
    property bool locked: true
    id:pWindow

    MouseArea{
        id:lockArea
        anchors.centerIn: parent

        width: 150
        height: 150
        onClicked: {
            console.log(myPassword)
            if(myPassword==="12345"){
                locked = locked ? false:true
            }

        }
        Image {
            id: lock

            anchors.fill:parent

            source: {
                if(locked==true){
                    return "qrc:/resources/images/lock.svg"
                }
                else{
                    return "qrc:/resources/images/unlock2.svg"
                }
            }
        }

    }
    TextField{
        id:password
        width: 200
        height: 30
        anchors.top: lockArea.bottom
        anchors.horizontalCenter: lockArea.horizontalCenter
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
        width: 100
        height: 30
        anchors.top: password.bottom
        anchors.horizontalCenter: password.horizontalCenter
        anchors.topMargin: 10
    }

    Image {
        id: animeImage
        x: 383
        y: 89


        width:282
        height: 401
        anchors.bottomMargin: -10
        anchors.rightMargin: -25
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        source: { return backEnd.generateAnimeGirl()}
    }

}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
