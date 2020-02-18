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
                }
            }]

        transitions: [
            Transition {
                from: ""
                to: "Hidden"
                PropertyAnimation {
                    easing.type: Easing.InOutQuad
                    properties: "x"
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
        visible: true
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



        titletext.onEditingFinished: {
            updateModelInformation()
        }
        usertext.onEditingFinished: {
            updateModelInformation()
        }
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

        if(userinput.visible==false){
            userinput.visible=true;
            startRect.visible=false;
        }
        if(notesList.currentIndex == -1){
            userinput.visible=false;
            startRect.visible=true;
            return
        }
        userinput.datetext.text = notesList.model.data(notesList.model.index(notesList.currentIndex, 0), 257)
        userinput.titletext.text = notesList.model.data(notesList.model.index(notesList.currentIndex, 0), 258)
        userinput.usertext.text = notesList.model.data(notesList.model.index(notesList.currentIndex, 0), 259)
        userinput.editText.text = notesList.model.data(notesList.model.index(notesList.currentIndex, 0), 260)
        if(userinput.editText.text == userinput.datetext.text){
            userinput.editText.visible=false // read only or not?
             console.log("aaa")
        }
        else{
            userinput.editText.visible=true // read only or not?
            console.log(userinput.editText.text = notesList.model.data(notesList.model.index(notesList.currentIndex, 0), 260))
            console.log(userinput.usertext.text = notesList.model.data(notesList.model.index(notesList.currentIndex, 0), 259))
        }
    }

    // don't change data if we don't change anything
    // after committing changes
    function updateModelInformation() {
        if(notesList.currentIndex==-1){
            return
        }


        if(notesList.model.setData(notesList.model.index(notesList.currentIndex, 0), qsTr(userinput.titletext.text), 258)){
            notesList.model.setData(notesList.model.index(notesList.currentIndex, 0), qsTr("n"), 260)
            return
        }
        if(notesList.model.setData(notesList.model.index(notesList.currentIndex, 0), qsTr(userinput.usertext.text), 259)) {
            notesList.model.setData(notesList.model.index(notesList.currentIndex, 0), qsTr(""), 260)
        }
    }

    function addButtonRealization() {
        diaryList.addItem()
        updateModelInformation()
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
        diaryList.deleteItem(notesList.currentIndex)
        if(diaryList.endItem(temp)) { temp--; }
        notesList.currentIndex = temp
        updateWindowInformation()
    }





    /*##^##
Designer {
    D{i:1;anchors_height:453;anchors_y:27}D{i:2;anchors_height:432;anchors_x:209;anchors_y:33}
D{i:7;anchors_height:171;anchors_width:148;anchors_x:42;anchors_y:187}
}
##^##*/
}
