import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import Diary 1.0
import QtGraphicalEffects 1.0


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
                hoverEnabled: true
                anchors.fill: parent
                onClicked: {
                    if(listw.currentIndex == -1) { //COPYPASTEK
                        listw.currentIndex = index
                        choosen()
                        return;
                    }

                    if(listw.currentIndex == index) {return;}
                    //trashButton.state = "current"
                    changeIndex() // emit signal
                    listw.currentIndex = index

                    choosen(); // emit signal
                    // при клике на обьект списка мы сразу переключаем index,
                    // но currentIndex нужно переключать в ручную
                }
                cursorShape: Qt.PointingHandCursor
            }

            Rectangle {
                id: fillRect
                anchors.fill: parent
                color: index==listw.currentIndex ? "#dee4fa"  : "white"
                Rectangle //
                {
                    id: bottomSeparator
                    width: parent.width
                    height: 1
                    color: "#6d84de"
                    anchors.bottom: parent.bottom
                }
            }


            Item {
                id: element
                anchors.fill: parent
                Text {
                    id: modelDateText
                    text: model.Date
                    color: index==listw.currentIndex ? "#707070"  : "#8f000000"
                    font.family: "poppins_black"
                    font.pixelSize:12
                    anchors.right: parent.right
                    anchors.rightMargin: 4
                }

                Text {
                    id: modelTitleText
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    text: {
                        if(model.Title.length>=16){
                            return model.Title.substring(0,13)+'...'
                        }
                        return model.Title
                    }
                    anchors.bottom: parent.bottom
                    color: index==listw.currentIndex ? "#404040"  : "#404040"
                    anchors.bottomMargin: 5
                    verticalAlignment: Text.AlignVCenter
                    font.family: "merriweather"




                font.pixelSize: 17
                }
            }
        }

        Rectangle {
            id:trashButton
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 1
            x: parent.width
            color: "#6d84de"
            opacity: 0.5
            width: 21
            height: 21
            visible: true

            Image {
                id: trashIcon
                source: "resources/images/trash.svg"
                anchors.fill: parent
            }

            ColorOverlay {
                id:trashOverlay
                anchors.fill: trashIcon
                source: trashIcon
                color: "black"
            }
            MouseArea{
                id: trashButtonMouseArea
                anchors.fill: parent
                enabled: false

            }
        }
    }
}




/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
