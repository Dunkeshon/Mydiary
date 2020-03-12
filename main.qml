import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import Diary 1.0
import Qt.labs.settings 1.0

import "funclist.js" as F
import "themeslist.js" as ThemesFunctions

Window {
    //Themes
    property color mainColorBackground//:"white"


    id: window
    visible: true
    color: mainColorBackground
    minimumWidth: 640
    minimumHeight: 480
    width: 640
    height: 480
    title: qsTr("My Diary")
    FontLoader { id: poppins_black; source:"qrc:/resources/fonts/poppins_/Poppins-Black.ttf"}
    FontLoader { id: merriweather; source:"qrc:/resources/fonts/poppins_/Merriweather-Regular.ttf"}

    PasswordWindow{
        id:passwordWindow
        anchors.fill:parent
        visible:true
        z:1
    }

    Settings{
        id:qSettings
        property int colorTheme:Themes.DARK_THEME
    }


    TopPannel {
        id: topPannel
        height: 31
        width: parent.width
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
    }

    ColumnLayout {
        id: leftColumn
        width: 200
        height: parent.height - topPannel.height
        anchors.top: topPannel.bottom
        NotesList {
            id:notesList
            Layout.fillWidth: true
        }

        states: [
            State {
                name: "Hidden"
                PropertyChanges {
                    target: leftColumn
                    x: -width - 1
                    visible:false
                }
            }]

        transitions: [
            Transition {
                from: ""
                to: "Hidden"
                PropertyAnimation {
                    easing.type: Easing.InOutQuad
                    properties: "x, visible"
                    duration: 450
                }

            },
            Transition {
                from: "Hidden"
                to: ""
                PropertyAnimation {
                    easing.type: Easing.InOutQuad
                    properties: "x"
                    duration: 450
                }
            }]
    }

    SettingsWindow {
        id:settingsSection
        visible: false
        width:parent.width
        height: parent.height - topPannel.height
        anchors.top: topPannel.bottom
        x:window.width
        z:1
    }

    Rectangle {
        id: startRect
        visible: userinput.visible ? false : true
        color:userinput.color // COLOR
        width: parent.width - leftColumn.width - verticalSeparator.width
        anchors.top: topPannel.bottom
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        anchors.left: verticalSeparator.right

        Text {
            property color enterTextTipColor: "#aaaaaa"
            anchors.centerIn: parent
            font.pixelSize: 17
            font.family: "merriweather"
            color:enterTextTipColor
            text: "Choose or Create a Page"
        }
    }

    AcceptDeletionDialog{
        id:deletingDialog
        anchors.centerIn: parent
        //positioning for windows
//        x: window.width  / 2
//        y: window.height / 2
    }



    TextINputWindow {
        id: userinput
        visible: false
        width: parent.width - leftColumn.width - verticalSeparator.width
        anchors.top: topPannel.bottom
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        anchors.left: verticalSeparator.right
    }

    Rectangle {
        //Themes
        property color separatorColor//: "#6d84de" //
        id: verticalSeparator
        color:separatorColor
        width: 1
        anchors.top: topPannel.bottom
        anchors.bottom: parent.bottom
        anchors.left: leftColumn.right
    }

    Component.onCompleted: {
        ThemesFunctions.changeTheme(qSettings.colorTheme)
    }

    Component.onDestruction: {
        F.updateModelInformation()
    }








    /*##^##
Designer {
    D{i:1;anchors_height:453;anchors_y:27}D{i:2;anchors_height:432;anchors_x:209;anchors_y:33}
D{i:7;anchors_height:171;anchors_width:148;anchors_x:42;anchors_y:187}
}
##^##*/
}
