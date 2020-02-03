import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import Diary 1.0


ColumnLayout {
    id:column
    property alias currentIndex: listw.currentIndex
    signal choosen(int curIndex)

//    function sendToPost(ourIndex) {
//           console.log("Choosen: " + (ourIndex+1) )
//       }
    // этим сигналом мы высылаем информацию о выбранной заметке
//    Component.onCompleted: {
//          column.choosen.connect(sendToPost)
//      }
    Layout.fillWidth: true
    Layout.fillHeight: true
    Layout.minimumWidth: 50
    Layout.minimumHeight: 150


    ListView {  
        id:listw
        Layout.fillWidth: true
        Layout.fillHeight: true
        clip: true
        focus:true


        model:DiaryModel{
            list: diaryList
        }

        Component.onCompleted: {
            listw.currentIndex = -1
        }

        delegate: Item {
            width:parent.width
            height: modelDateText.height*2 + delegateSeparator.height +modelTitleText.height*2
            MouseArea {
                id:mousearea
                anchors.fill: parent
                onClicked:{ listw.currentIndex = index
                   choosen(listw.currentIndex); // emit signal
                }

                cursorShape: Qt.PointingHandCursor
            }

            Rectangle {
                anchors.fill: parent
                color: index==listw.currentIndex ? "#5189be"  : "#C4C4C4"
                Rectangle {
                    width: parent.width
                    height: 1
                    color: "black"
                    anchors.bottom: parent.bottom
                }
            }

            ColumnLayout {

                anchors.fill: parent
                anchors.margins: 10
                Text {
                    id: modelDateText
                    text: model.Date
                    font.pixelSize: 16
                }
                Rectangle{
                    id: delegateSeparator
                    height: 1
                    width: 120 //frame1.width/2
                    color: "black"
                }
                Text {
                    id: modelTitleText
                    text: model.Title
                    font.pixelSize: 16
                    //wrapMode: Text.WrapAnywhere
                }
            }


        }
    }
}


