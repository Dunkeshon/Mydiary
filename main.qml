import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import Diary 1.0
import Qt.labs.settings 1.0

import "funclist.js" as F

Window {
    id: window
    property color mainColorBackground:"white" //
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

    SettingsWindow{
        id:settingsSection
        visible: false
        width:parent.width
        height: parent.height - topPannel.height
        anchors.top: topPannel.bottom
        x:200
        z:1

        states: [
            State {
                name: "Active"
                PropertyChanges {
                    target: settingsSection
                    x: 0
                    visible:true
                }
            }]

        transitions: [
            Transition {
                from: "Active"
                to: ""
                PropertyAnimation {
                    easing.type: Easing.InOutQuad
                    properties: "x, visible"
                    duration: 450
                }
            },
            Transition {
                from: ""
                to: "Active"
                PropertyAnimation {
                    easing.type: Easing.InOutQuad
                    properties: "x"
                    duration: 450
                }
            }]
    }

    Rectangle {
        //property color enterTextTipColor: "#aaaaaa"//
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
        property color separatorColor: "#6d84de" //
        id: verticalSeparator
        color:separatorColor
        width: 1
        anchors.top: topPannel.bottom
        anchors.bottom: parent.bottom
        anchors.left: leftColumn.right
    }

    Component.onCompleted: {
        console.log("mainwindow completed, theme is " + qSettings.colorTheme)
        qSettings.colorTheme=Themes.YELLOW_THEME
        changeTheme(qSettings.colorTheme)
    }

    Component.onDestruction: {

        F.updateModelInformation()
        //qSettings.colorTheme /*= Themes.DEFAULT_THEME*/;
        console.log(qSettings.colorTheme)

    }

    function changeTheme(colorTheme){
        console.log("Change theme started , theme is " + qSettings.colorTheme)
        switch(colorTheme){
        case Themes.DEFAULT_THEME:

            // main
            mainColorBackground = "white"
            startRect.children.enterTextTipColor= "#aaaaaa"
            verticalSeparator.separatorColor= "#6d84de"
            //BUTTON
//            BUTTON.iconColor ="white"
//            BUTTON.bColor = "white"
//            BUTTON.enteredColor= "white"
//            BUTTON.pressedColor= "white"
//            BUTTON.toolTipStyleColor= "#ffffff"
//            BUTTON.toolTipTextColor = "#8f000000"
            //DELEGATE
            notesList.m_fillDelegateColor="white"
            notesList.m_bottomSeparatorColor="#6d84de"
        //    notesList.m_innerChadowColor=Qt.rgba(0, 0, 0, 0.44)
            notesList.m_dateTextColor="#666666"
            notesList.m_titleTextColor="#666666"
            notesList.m_enteredColor="#bbc7f4"
            notesList.m_pressedColor="#93a6ee"
            notesList.m_modelTitleTextRealized="#00135F"
            notesList.m_modelDateTextRealized="#00135F"
            //            DELEGATE.bottomSeparatorColor= "#6d84de"
            //            DELEGATE.fillDelegateColor= "white"
            //            DELEGATE.innerChadowColor= "black"
            //            DELEGATE.titleTextColor= "#404040"
            //            DELEGATE.dateTextColor= "black"
            //            // undefined befor
            //            DELEGATE.enteredColor="#bbc7f4"
            //            // undefined befor

            //            DELEGATE.pressedColor= "#93a6ee"
            //            DELEGATE.modelDateTextRelised= "#00135F"
            //SearchField
            SearchField.themeColor= "#617adb"
            SearchField.textFieldColor= "white"
            SearchField.placeholderTextColor= "#f5f5f5"
            SearchField.textSelectionColor= "#3399FF"
            //SettingsWindow
            settingsSection.themeColor = "#6d84de"
            settingsSection.defaultSelect = "white"
            settingsSection.roseSelect = "#FFB6B6"
            settingsSection.yellowSelect = "#FFD749"
            settingsSection.darkSelect = "#000000"
            //TextINputWindow
            userinput.themeColor = "#f4f5f8"
            userinput.textSelectionColor = "#3399FF"
            userinput.iconColor = "#A5A4A5"
            userinput.enteredButtonColor = "#777777"
            userinput.pressedButtonColor = "black"
            //ThemeElement
            ThemeElement.iconColor = "white"
            ThemeElement.bColor = "#6d84de"
            //TopPannel
            TopPannel.panelColor = "#6d84de"
            TopPannel.pressedColor = "#4c69d7"
            TopPannel.enteredColor = "#dddddd"



            break;
        case Themes.ROSE_THEME:
            //DELEGATE
            notesList.m_fillDelegateColor="white"
            notesList.m_bottomSeparatorColor= "#ffa8a8"
         //   notesList.m_innerChadowColor= "#b08686"
            notesList.m_dateTextColor="#a37272"
            notesList.m_titleTextColor="#a37272"
            notesList.m_enteredColor="#FFE0E0"
            notesList.m_pressedColor="#FFC0C0"
            notesList.m_modelTitleTextRealized="#a37272"
            notesList.m_modelDateTextRealized="#a37272"
            //SettingsWindow
            settingsSection.themeColor="#F3CB9B"
            settingsSection.defaultSelect="white"
            settingsSection.roseSelect= "#FFFFFF"
            settingsSection.yellowSelect= "#FFDFB9"
            settingsSection.darkSelect= "#000000"
            //TextINputWindow
            userinput.themeColor = "#fff7f7"
            userinput.textSelectionColor = "#3399FF"
            userinput.iconColor = "#b08686"
            userinput.enteredButtonColor = "#955e5e"
            userinput.pressedButtonColor = "#7b3636"

            break;
        case Themes.YELLOW_THEME:
            notesList.m_fillDelegateColor="white"
            notesList.m_bottomSeparatorColor="#F3CB9B"
          //  notesList.m_innerChadowColor=
            notesList.m_dateTextColor="#b69d80"
            notesList.m_titleTextColor="#714A1C"
            notesList.m_enteredColor="#f9e5cd"
            notesList.m_pressedColor="#f5d5af"
            notesList.m_modelTitleTextRealized= "#5F401C"
            notesList.m_modelDateTextRealized= "#62421E"
            //SettingsWindow
            settingsSection.themeColor="#F3CB9B"
            settingsSection.defaultSelect="#7187df"
            settingsSection.roseSelect= "#FD7676"
            settingsSection.yellowSelect= "#FFFFFF"
            settingsSection.darkSelect= "#000000"
            //TextINputWindow
            userinput.themeColor = "#fdf5eb"
            userinput.textSelectionColor = "#3399FF"
            userinput.iconColor = "#b8a58e"
            userinput.enteredButtonColor = "#aa9277"
            userinput.pressedButtonColor = "#8d6e49"
            break;

        case Themes.DARK_THEME:
            notesList.m_fillDelegateColor="#505050"
            notesList.m_bottomSeparatorColor="white"
           // notesList.m_innerChadowColor=Qt.rgba(0, 0, 0, 0.72)
            notesList.m_dateTextColor="white"
            notesList.m_titleTextColor="#FFFFFF"
            notesList.m_enteredColor="#828282"
            notesList.m_pressedColor="#D8D8D8"
            notesList.m_modelTitleTextRealized="black"
            notesList.m_modelDateTextRealized="black"
            //SettingsWindow
            settingsSection.themeColor="#2B2B2B"
            settingsSection.defaultSelect="#7187df"
            settingsSection.roseSelect= "#FFB0B0"
            settingsSection.yellowSelect= "#F3CB9B"
            settingsSection.darkSelect= "#FFFFFF"
            //TextINputWindow
            userinput.themeColor = "#404040"
            userinput.textSelectionColor = "#3399FF"
            userinput.iconColor = "#white"
            userinput.enteredButtonColor = "#D6D6D6"
            userinput.pressedButtonColor = "#BABABA"
            break;
        default: throw "Theme id out of range"


        }
    }






    /*##^##
Designer {
    D{i:1;anchors_height:453;anchors_y:27}D{i:2;anchors_height:432;anchors_x:209;anchors_y:33}
D{i:7;anchors_height:171;anchors_width:148;anchors_x:42;anchors_y:187}
}
##^##*/
}
