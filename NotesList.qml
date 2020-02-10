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
            id: delegate
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
                onEntered: delegate.state = "delegateEntered"


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
                    color: "black"
                    anchors.bottom: parent.bottom
                }
            }

            InnerShadow {
                id: innerRect
                source: fillRect
                anchors.fill: fillRect
                samples: 16
                radius: 8.0
                horizontalOffset: -3
                verticalOffset: 3
                color: "black"
                opacity: 0.25
                visible: false
            }


            Item {
                id: element
                anchors.fill: parent
                Text {
                    id: modelDateText
                    text: model.Date
                    color: index==listw.currentIndex ? "white"  : "#8f000000"
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
                    color: index==listw.currentIndex ? "white"  : "black"
                    anchors.bottomMargin: 5
                    verticalAlignment: Text.AlignVCenter
                    font.family: "merriweather"
                    font.bold: true
                    opacity: 0.65
                    font.pixelSize: 17
                }
            }

            states: [
                State {
                    name: "delegateEntered"
                    PropertyChanges {
                        target: fillRect
                        color: "#5976E5"
                        opacity: 0.21
                    }
                },
                State {
                    name: "delegatePressed"
                    PropertyChanges {
                        target: fillRect
                        color: "#5976E5"
                        opacity: 0.35
                    }
                },
                State {
                    name: "delegateChecked"
                    PropertyChanges {
                        target: fillRect
                        color: "#5976E5"
                        opacity: 0.35
                    }
                    PropertyChanges {
                        target: innerRect
                        visible: true
                    }
                }]
            transitions: [
                Transition {
                    from: ""
                    to: "delegateEntered"
                    PropertyAnimation {
                        properties: "color"
                        duration: 250
                        easing.type: Easing.OutQuad
                    }

                },
                Transition {
                    from: "delegateEntered"
                    to: ""
                    PropertyAnimation {
                        properties: "color"
                        duration: 250
                        easing.type: Easing.InQuad
                    }
                },
                Transition {
                    from: "delegateEntered"
                    to: "delegatePressed"
                    PropertyAnimation {
                        properties: "color"
                        duration: 70
                        easing.type: Easing.OutQuad
                    }
                },
                Transition {
                    from: "delegatePressed"
                    to: "delegateEntered"
                    PropertyAnimation {
                        properties: "color"
                        duration: 150
                        easing.type: Easing.InQuad
                    }
                },
                Transition {
                    from: "delegatePressed"
                    to: ""
                    PropertyAnimation {
                        properties: "color"
                        duration: 250
                        easing.type: Easing.InQuad
                    }
                }]
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
