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
        property int colorTheme:Themes.ROSE_THEME
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
        changeTheme(qSettings.colorTheme)
    }

    Component.onDestruction: {
<<<<<<< HEAD
        updateModelInformation()
       //qSettings.colorTheme /*= Themes.DEFAULT_THEME*/;
        console.log(qSettings.colorTheme)
    }




    function updateWindowInformation() {

        if(!userinput.visible)
            userinput.visible = true;

        if(notesList.currentIndex == -1){
            userinput.visible = false;
            return
        }

        // а тут она по приколу)
        var sourceIndex = notesList.sortModel.mapToSource(notesList.sortModel.index(notesList.currentIndex, 0))
        userinput.dateInfo = notesList.model.data(sourceIndex, DiaryModel.DateRole)
        userinput.titletext.text = notesList.model.data(sourceIndex, DiaryModel.TitleRole)
        userinput.usertext.text = notesList.model.data(sourceIndex, DiaryModel.TextRole)
        userinput.editInfo = notesList.model.data(sourceIndex, DiaryModel.LastEditRole)
    }

    // don't change data if we don't change anything
    // after committing changes sets the date of editing
    function updateModelInformation() {

        if(notesList.currentIndex==-1)
            return

        //тут эта переменная нужна потому что иначе setFilterFixedString уберет или переставит индекс
        //когда мы изменим title во время поиска. И, соответственно, все что после функции которая меняет title,
        //сохранится неправильно.
        var sourceIndex = notesList.sortModel.mapToSource(notesList.sortModel.index(notesList.currentIndex, 0))

        if(notesList.model.setData(sourceIndex, qsTr(userinput.usertext.text), DiaryModel.TextRole))
            notesList.model.setData(sourceIndex, diaryList.currDate(), DiaryModel.LastEditRole)

        if(notesList.model.setData(sourceIndex, qsTr(userinput.titletext.text), DiaryModel.TitleRole))
            notesList.model.setData(sourceIndex, diaryList.currDate(), DiaryModel.LastEditRole)
    }

    function addButtonRealization() {
        if(topPannel.searchfield.text != "")
            topPannel.searchfield.text = ""
        else
            updateModelInformation()

        topPannel.searchfield.state = ""
        diaryList.addItem()
        notesList.currentIndex = 0
        updateWindowInformation()
    }
    function settingsButtonRealization(){
        if(settingsSection.state == "Active")
            settingsSection.state = ""
        else
            settingsSection.state = "Active"
    }

    function arrowButtonRealization() {
        if(leftColumn.state == "")
            leftColumn.state = "Hidden"
        else
            leftColumn.state = ""
    }

    function deleteButtonRealization() {
        var temp = notesList.currentIndex
        diaryList.deleteItem(notesList.sortModel.mapToSource(notesList.sortModel.index(notesList.currentIndex, 0)))
        if(notesList.sortModel.rowCount() === notesList.currentIndex) {temp--}
        notesList.currentIndex = temp
        updateWindowInformation()
    }

    function updateProxyModel(searchText) {
        updateModelInformation()
        notesList.currentIndex = -1
        updateWindowInformation()
        notesList.sortModel.setFilterFixedString(searchText)
    }

    function focusOff() {
        userinput.titletext.focus = false
        userinput.usertext.focus = false
        topPannel.searchfield.textfocus = false
=======
        F.updateModelInformation()
>>>>>>> password
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
            DELEGATE.enteredColor="#FFE0E0"

            break;
        case Themes.YELLOW_THEME:
            break;
        case Themes.DARK_THEME:
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
