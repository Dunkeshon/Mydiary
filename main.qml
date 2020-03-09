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
        visible: false
        id: userinput
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
        console.log(qSettings.colorTheme)
        qSettings.colorTheme=Themes.ROSE_THEME
        changeTheme(qSettings.colorTheme)
    }

    Component.onDestruction: {

        F.updateModelInformation()
        //qSettings.colorTheme /*= Themes.DEFAULT_THEME*/;
        console.log(qSettings.colorTheme)

    }

    function changeTheme(colorTheme){
        console.log(qSettings.colorTheme)
        switch(colorTheme){
        case Themes.DEFAULT_THEME:

            // main
            mainColorBackground = "white"
            startRect.children.enterTextTipColor= "#aaaaaa"
            verticalSeparator.separatorColor= "#6d84de"
            //BUTTON
            BUTTON.iconColor ="white"
            BUTTON.bColor = "white"
            BUTTON.enteredColor= "white"
            BUTTON.pressedColor= "white"
            BUTTON.toolTipStyleColor= "#ffffff"
            BUTTON.toolTipTextColor= "#8f000000"
            //DELEGATE
            notesList.m_fillDelegateColor="white"
            notesList.m_bottomSeparatorColor="#6d84de"
            notesList.m_innerChadowColor=Qt.rgba(0, 0, 0, 0.44)
            notesList.m_dateTextColor=Qt.rgba(0, 0, 0, 0.56)
            notesList.m_titleTextColor=Qt.rgba(0, 0, 0, 0.65)
            notesList.m_enteredColor="#bbc7f4"
            notesList.m_pressedColor="#93a6ee"
            notesList.m_modelTitleTextRealized="#00135F"
            notesList.m_modelDateTextRealized=QT.rgba(0, 0, 0, 0.76)
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
            SettingsWindow.themeColor="#6d84de"
            SettingsWindow.defaultSelect="white"
            SettingsWindow.roseSelect= "#FFB6B6"
            SettingsWindow.yellowSelect= "#FFD749"
            SettingsWindow.darkSelect= "#000000"
            //TextINputWindow
            TextINputWindow.themeColor= "#f4f5f8"
            TextINputWindow.textSelectionColor= "#3399FF"
            TextINputWindow.iconColor= "#aaaaaa"
            TextINputWindow.enteredButtonColor= "#777777"
            TextINputWindow.pressedButtonColor= "black"
            //ThemeElement
            ThemeElement.iconColor= "white"
            ThemeElement.bColor= "#6d84de"
            //TopPannel
            TopPannel.panelColor= "#6d84de"
            TopPannel.pressedColor= "#4c69d7"
            TopPannel.enteredColor= "#dddddd"



            break;
        case Themes.ROSE_THEME:
            //DELEGATE
            notesList.m_fillDelegateColor="white"
            notesList.m_bottomSeparatorColor= Qt.rgba(255, 168, 168, 0.72)
            notesList.m_innerChadowColor= Qt.rgba(123, 54, 54, 0.6)
            notesList.m_dateTextColor=Qt.rgba(123, 54, 54, 0.73)
            notesList.m_titleTextColor=Qt.rgba(123, 54, 54, 0.73)
            notesList.m_enteredColor="#FFE0E0"
            notesList.m_pressedColor="#FFC0C0"
            notesList.m_modelTitleTextRealized=Qt.rgba(123, 54, 54, 0.73)
            notesList.m_modelDateTextRealized=Qt.rgba(123, 54, 54, 0.73)


            break;
        case Themes.YELLOW_THEME:
//            notesList.m_fillDelegateColor=
//            notesList.m_bottomSeparatorColor=
//            notesList.m_innerChadowColor=
//            notesList.m_dateTextColor=
//            notesList.m_titleTextColor=
//            notesList.m_enteredColor=
//            notesList.m_pressedColor=
//            notesList.m_modelTitleTextRealized=
//            notesList.m_modelDateTextRealized=
            break;
        case Themes.DARK_THEME:
            notesList.m_fillDelegateColor="#505050"
            notesList.m_bottomSeparatorColor="white"
            notesList.m_innerChadowColor=Qt.rgba(0, 0, 0, 0.72)
            notesList.m_dateTextColor=Qt.rgba(255, 255, 255, 0.93)
            notesList.m_titleTextColor="#FFFFFF"
            notesList.m_enteredColor="#828282"
            notesList.m_pressedColor="#D8D8D8"
            notesList.m_modelTitleTextRealized="black"
            notesList.m_modelDateTextRealized=Qt.rgba(0, 0, 0, 0.93)
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
