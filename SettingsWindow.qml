import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtGraphicalEffects 1.0
import QtQuick.Window 2.12
import Diary 1.0
import "themeslist.js" as ThemesFunctions


Item {
    property alias  defaultButton: defaultTheme
    property alias  roseButton: roseTheme
    property alias  yellowButton: yellowTheme
    property alias  darkButton: darkTheme


    //Themes
    property color themeColor
    property color defaultSelect
    property color roseSelect
    property color yellowSelect
    property color darkSelect
    property color enteredDefault : "#7187df"
    property color enteredRose :"#DB6767"
    property color enteredYellow : "#FFDFB9"
    property color enteredDark :"#3D3838"
    id:mainArea




    MouseArea{
        id:emptyFocus
        anchors.left:parent.left
        anchors.top:parent.top
        anchors.bottom: parent.bottom
        width: parent.width-settingsArea.width
        onClicked: {
            mainArea.state=""
            window.buttonsActive = true
        }
    }


    Rectangle{
        id:settingsArea
        width: 200
        color: themeColor
        anchors.left: emptyFocus.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom

        MouseArea{
            anchors.fill: parent
        }

        SettingPart {
            id: themeTitle
            height: 80
            width:parent.width
            anchors.top: parent.top


            backgroundcolor: parent.color
            source: "resources/images/themeIcon.svg"
            content: "Theme"
        }

        Rectangle{
            id:themeSection
            anchors.top: themeTitle.bottom
            width: parent.width
            color: themeColor
            height: 80

            SettingChoice {
                id: defaultTheme
                height: 30
                width: parent.width/2 - 9
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.margins: 5
                content: "Default"
                backgroundColor: themeColor
                textColor: defaultSelect
                mArea.onClicked: {
                    choiced = true
                    darkTheme.choiced = roseTheme.choiced = yellowTheme.choiced = false
                    qSettings.colorTheme=Themes.DEFAULT_THEME
                    ThemesFunctions.changeTheme(Themes.DEFAULT_THEME)
                }
            }

            SettingChoice {
                id: roseTheme
                height: 30
                width: parent.width/2 - 9
                anchors.left: defaultTheme.right
                anchors.top: parent.top
                anchors.margins: 5
                content: "Rose"
                backgroundColor: themeColor
                textColor: roseSelect
                mArea.onClicked: {
                    choiced = true
                    defaultTheme.choiced = darkTheme.choiced = yellowTheme.choiced = false
                    qSettings.colorTheme=Themes.ROSE_THEME
                    ThemesFunctions.changeTheme(Themes.ROSE_THEME)
                }
            }

            SettingChoice {
                id: yellowTheme
                height: 30
                width: parent.width/2 - 9
                anchors.left: parent.left
                anchors.top: defaultTheme.bottom
                anchors.margins: 5
                content: "Yellow"
                backgroundColor: themeColor
                textColor: yellowSelect
                mArea.onClicked: {
                    choiced = true
                    defaultTheme.choiced = roseTheme.choiced = darkTheme.choiced = false
                    qSettings.colorTheme=Themes.YELLOW_THEME
                    ThemesFunctions.changeTheme(Themes.YELLOW_THEME)
                }
            }

            SettingChoice {
                id: darkTheme
                height: 30
                width: parent.width/2 - 9
                anchors.left: yellowTheme.right
                anchors.top: roseTheme.bottom
                anchors.margins: 5
                content: "Dark"
                backgroundColor: themeColor
                textColor: darkSelect
                mArea.onClicked: {
                    choiced = true
                    defaultTheme.choiced = roseTheme.choiced = yellowTheme.choiced = false
                    qSettings.colorTheme=Themes.DARK_THEME
                    ThemesFunctions.changeTheme(Themes.DARK_THEME)
                }
            }
        }


        SettingPart {
            id: languageTitle
            height: 80
            width:parent.width
            anchors.top: themeSection.bottom


            backgroundcolor: parent.color
            source: "resources/images/languageIcon.svg"
            content: "Language"
        }

        Rectangle{
            id:languageSection
            anchors.top: languageTitle.bottom
            width: parent.width
            color: themeColor
            height: 40

            SettingChoice {
                id: englishLanguage
                height: 30
                width: parent.width/2 - 9
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.margins: 5
                content: "English"
                backgroundColor: themeColor
                textColor: "white"
                mArea.onClicked: {
                    choiced = true
                    russianLanguage.choiced = false
                }
            }

            SettingChoice {
                id: russianLanguage
                height: 30
                width: parent.width/2 - 9
                anchors.left: englishLanguage.right
                anchors.top: parent.top
                anchors.margins: 5
                content: "Russian"
                backgroundColor: themeColor
                textColor: "white"
                mArea.onClicked: {
                    choiced = true
                    englishLanguage.choiced = false
                }
            }
        }

        SettingPart {
            id: passwordTitle
            height: 80
            width:parent.width
            anchors.top: languageSection.bottom


            backgroundcolor: parent.color
            source: "resources/images/passwordIcon.svg"
            content: "Password"
        }

        Rectangle{
            id:passwordSection
            anchors.top: passwordTitle.bottom
            width: parent.width
            color: themeColor
            height: 40

            SettingChoice {
                id: changePass
                height: 30
                width: parent.width/2 - 9
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.margins: 5
                content: "Change"
                backgroundColor: themeColor
                textColor: "white"
                mArea.onClicked: {
                    choiced = true
                    removePass.choiced = false
                }
            }

            SettingChoice {
                id: removePass
                height: 30
                width: parent.width/2 - 9
                anchors.left: changePass.right
                anchors.top: parent.top
                anchors.margins: 5
                content: "Remove"
                backgroundColor: themeColor
                textColor: "white"
                mArea.onClicked: {
                    choiced = true
                    changePass.choiced = false
                }
            }
        }



    }



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
