import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import Diary 1.0

Window {
    id: window
    visible: true
    color: "#C4C4C4"
    minimumWidth: 640
    minimumHeight: 480
    width: 640
    height: 480
    title: qsTr("My Diary")

    ColumnLayout {
        id: leftColumn
        width: 200
        height: parent.height
        NotesList {
            id:notesList
            Layout.fillWidth: true
        }

        RowLayout {
            width: parent.width
            height: 40
            Button {
                Layout.fillWidth: true
                text: "ADD"
                onClicked: {
                    diaryList.addItem()
                    notesList.currentIndex=0
                    updateWindowInformation()
                }

            }
            Button {
                Layout.fillWidth: true
                text: "Del"
                onClicked: {
                    if(notesList.currentIndex == -1) { return; }
                    var temp = notesList.currentIndex
                    diaryList.deleteItem(notesList.currentIndex)
                    if(diaryList.endItem(temp)) { temp--; }
                    notesList.currentIndex = temp
                    updateWindowInformation()


                }
            }
        }
    }





    TextINputWindow {
        visible: true
        id: userinput
        x: leftColumn.width + verticalSeparator.width
        width: parent.width - leftColumn.width - verticalSeparator.width
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.right: parent.right


        titletext.onEditingFinished: {
            updateModelInformation()
        }
        usertext.onEditingFinished: {
            updateModelInformation()
        }
    }

    Rectangle {
        id: verticalSeparator
        color:"black"

        width: 2
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.left: leftColumn.right
    }

    Component.onCompleted: {
        userinput.visible=false
    }

    Component.onDestruction: {
        updateModelInformation()
    }

    function updateWindowInformation() {


        if(userinput.visible==false){
            userinput.visible=true;
        }
        if(notesList.currentIndex == -1){
            userinput.visible=false;
        }
        if(notesList.currentIndex == -1) { return }
        userinput.datetext.text = notesList.model.data(notesList.model.index(notesList.currentIndex, 0), 257)
        userinput.titletext.text = notesList.model.data(notesList.model.index(notesList.currentIndex, 0), 258)
        userinput.usertext.text = notesList.model.data(notesList.model.index(notesList.currentIndex, 0), 259)
    }

    // don't change data if we don't change anything
    function updateModelInformation() {
        if(notesList.currentIndex==-1){
            return
        }

        if(notesList.model.setData(notesList.model.index(notesList.currentIndex, 0), qsTr(userinput.titletext.text), 258)){
            return
        }
        notesList.model.setData(notesList.model.index(notesList.currentIndex, 0), qsTr(userinput.usertext.text), 259)
    }




    /*##^##
Designer {
    D{i:2;anchors_height:432;anchors_x:209;anchors_y:33}D{i:1;anchors_height:453;anchors_y:27}
D{i:7;anchors_height:171;anchors_width:148;anchors_x:42;anchors_y:187}
}
##^##*/
}
