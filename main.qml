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

    Rectangle {
        id: verticalSeparator
        color:"black"
        width: 2
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.left: leftColumn.right
    }

    ColumnLayout {
        id: leftColumn
        width: 200
        height: parent.height
        NotesList {
            id:notesList
            Layout.fillWidth: true

            Button {
                Layout.fillWidth: true
                height: 40
                text: "ADD"
                onClicked: {
                    diaryList.addItem()
                    notesList.currentIndex=0
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
            if(!notesList.model.setData(notesList.model.index(notesList.currentIndex, 0), qsTr(titletext.text), 258)) {
                console.log("Invalid")
            }
        }
        usertext.onEditingFinished: {
            if(!notesList.model.setData(notesList.model.index(notesList.currentIndex, 0), qsTr(usertext.text), 259)) {
                console.log("Invalid")
            }
        }
    }

    function updateWindowInformation() {
        if(userinput.visible==false){
            userinput.visible=true;
        }
        userinput.datetext.text = notesList.model.data(notesList.model.index(notesList.currentIndex, 0), 257)
        userinput.titletext.text = notesList.model.data(notesList.model.index(notesList.currentIndex, 0), 258)
        userinput.usertext.text = notesList.model.data(notesList.model.index(notesList.currentIndex, 0), 259)
    }

    Component.onCompleted: {
        userinput.visible=false
    }




    /*##^##
Designer {
    D{i:1;anchors_height:171;anchors_width:148;anchors_x:42;anchors_y:187}D{i:2;anchors_height:453;anchors_y:27}
D{i:3;anchors_height:432;anchors_x:209;anchors_y:33}
}
##^##*/
}
