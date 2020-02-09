import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import Diary 1.0


ColumnLayout {
    id:column
    property alias currentIndex: listw.currentIndex
    property alias model: listw.model

    Layout.fillWidth: true
    Layout.fillHeight: true
    Layout.minimumWidth: 200
    Layout.minimumHeight: 150

    signal choosen()
    signal changeIndex();

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

            column.choosen.connect(updateWindowInformation)

            column.changeIndex.connect(updateModelInformation);
        }

        delegate: Item {
            width:parent.width
            height: 50

            MouseArea {
                id:mousearea
                anchors.fill: parent
                onClicked: {
                    if(listw.currentIndex == -1) { //COPYPASTEK
                        listw.currentIndex = index
                        choosen()
                        return;
                    }
                    if(listw.currentIndex == index) {return;}
                    changeIndex() // emit signal
                    listw.currentIndex = index
                    choosen(); // emit signal
                }

                cursorShape: Qt.PointingHandCursor
            }

            Rectangle {
                anchors.fill: parent
                color: index==listw.currentIndex ? "#5189be"  : "#E5E5E5"
                Rectangle //
                {
                    width: parent.width
                    height: 1
                    color: "black"
                    anchors.bottom: parent.bottom
                }
            }


            Item{
                id: element
                anchors.fill: parent
                Text {
                    id: modelDateText                   
                    text: model.Date
                    color: index==listw.currentIndex ? "white"  : "#8f000000"
                    font.pixelSize: 12
                    anchors.right: parent.right
                    anchors.rightMargin: 4
                }

                Text {
                    id: modelTitleText
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    text: model.Title
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 5
                    verticalAlignment: Text.AlignVCenter
                    font.family: "Tahoma"
                    font.bold: true
                    opacity: 0.65
                    font.pixelSize: 17
                }
            }
        }
    }
}



/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
