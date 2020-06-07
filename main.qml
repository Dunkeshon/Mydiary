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
    property bool buttonsActive: true
    property bool hideAllDelegates: false


    id: window
    visible: true
    color: mainColorBackground
    minimumWidth: 640
    minimumHeight: 480
    width: 640
    height: 480
    title: qsTr("My Diary")
    FontLoader { id: poppins_black; source:"qrc:/resources/fonts/poppins_/Poppins-Black.ttf"}
    FontLoader { id: poppinsThin; source:"qrc:/resources/fonts/poppins_/Poppins-Thin.ttf"}
    FontLoader { id: merriweather; source:"qrc:/resources/fonts/poppins_/Merriweather-Regular.ttf"}
    Settings{
        id:qSettings
        property int colorTheme:Themes.DEFAULT_THEME
        property bool isFirstEnter : true
        property bool isEnglish : true
        property string myPassword
        property bool passwordOn : true
    }
    Item {
        z:0
        id:mainWindowItem
        anchors.fill: parent
        visible: false // true if passwordWindow unactive


        TopPannel {
            id: topPannel
            buttonsHovered: buttonsActive
            height: 31
            width: parent.width
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.right: parent.right
        }

        Item {
            id: leftColumn
            width: 200
            height: parent.height - topPannel.height
            anchors.top: topPannel.bottom
            NotesList {
                id:notesList
                anchors.fill: parent
            }

            //states in NotesList

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
            x:200
            z:1
            MouseArea{
                width: parent.width
                height: topPannel.height
                anchors.bottom: parent.top
                anchors.horizontalCenter: parent.horizontalCenter
                onClicked: {
                    settingsSection.state=""
                    buttonsActive=true // включение нажатий на кнопки
                }
            }
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
                text: qSettings.isEnglish?"Choose or Create a Page":"Выберите или создайте \nстраницу"
                horizontalAlignment: Text.AlignHCenter
            }
        }
        TextINputWindow {
            id: userinput
            buttonsHovered: buttonsActive
            visible: false
            width: parent.width - leftColumn.width - verticalSeparator.width
            anchors.top: topPannel.bottom
            anchors.bottom: parent.bottom
            anchors.right: parent.right
            anchors.left: verticalSeparator.right


            titletext.onEditingFinished: {
                if(topPannel.searchfield.text != "")
                    return
                F.updateModelInformation()
            }
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

    }
    PasswordWindow{
        id:passwordWindow
        anchors.fill:parent
        visible:{
            if(qSettings.isFirstEnter) return false
            else {
                if(!qSettings.passwordOn){
                    return false
                }
               return  true;
            }
        }
        Component.onCompleted: {
            if(!qSettings.isFirstEnter && visible==false)
                mainWindowItem.visible=true
        }
        z:1
    }

    FirstEnterWindow{
        id:firstEnterWindow
        z:2
        anchors.fill: parent
        visible: qSettings.isFirstEnter?true:false



        states: State {
            name: "hidden"
            PropertyChanges {
                target: firstEnterWindow
                opacity:0
            }
        }
        transitions: [
            Transition {
                from: ""
                to: "hidden"
                OpacityAnimator{
                    target:firstEnterWindow
                    from:1
                    to:0
                    duration:1000
                }
            }
        ]
    }
    ChangePasswordWindow{
        id:changePasswordWindow
        anchors.centerIn: parent        
    }

Component.onCompleted: {
    // for debugging issues
    // qSettings.isFirstEnter=true;
}




    /*##^##
Designer {
    D{i:1;anchors_height:453;anchors_y:27}D{i:2;anchors_height:432;anchors_x:209;anchors_y:33}
D{i:7;anchors_height:171;anchors_width:148;anchors_x:42;anchors_y:187}
}
##^##*/
}
