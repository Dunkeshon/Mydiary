import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import Diary 1.0

Window {
    id: window
    visible: true
    color: "white"
    minimumWidth: 640
    minimumHeight: 480
    width: 640
    height: 480
    title: qsTr("My Diary")
    FontLoader { id: poppins_black; source:"qrc:/resources/fonts/poppins_/Poppins-Black.ttf"}
    FontLoader { id: merriweather; source:"qrc:/resources/fonts/poppins_/Merriweather-Regular.ttf"}


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

    Rectangle {
        id: startRect
        visible: userinput.visible ? false : true
        color:userinput.color
        width: parent.width - leftColumn.width - verticalSeparator.width
        anchors.top: topPannel.bottom
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        anchors.left: verticalSeparator.right

        Text {
            anchors.centerIn: parent
            font.pixelSize: 17
            font.family: "merriweather"
            color: "#aaaaaa"
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
        id: verticalSeparator
        color:"#6d84de"

        width: 1
        anchors.top: topPannel.bottom
        anchors.bottom: parent.bottom
        anchors.left: leftColumn.right
    }

    Component.onDestruction: {
        updateModelInformation()
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

    function arrowButtonRealization() {
        if(leftColumn.state == "") {
            leftColumn.state = "Hidden"
            return
        }
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
    }






    /*##^##
Designer {
    D{i:1;anchors_height:453;anchors_y:27}D{i:2;anchors_height:432;anchors_x:209;anchors_y:33}
D{i:7;anchors_height:171;anchors_width:148;anchors_x:42;anchors_y:187}
}
##^##*/
}
