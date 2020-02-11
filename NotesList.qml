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
//    Layout.minimumWidth: 200
//    Layout.minimumHeight: 150

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
                    if(index == listw.currentIndex) {return}
                    if(listw.currentIndex != -1) {
                        changeIndex() // emit signal
                    }
                    listw.currentIndex = index
                    choosen(); // emit signal
                    // при клике на обьект списка мы сразу переключаем index,
                    // но currentIndex нужно переключать в ручную
                }
                onEntered: delegate.state = listw.currentIndex == index ? "delegatePressed" : "delegateEntered"
                onExited: delegate.state = ""
                onPressed: delegate.state = "delegatePressed"

                cursorShape: listw.currentIndex == index ? Qt.ArrowCursor : Qt.PointingHandCursor
            }

            Rectangle {
                id: fillRect
                anchors.fill: parent
                color: index==listw.currentIndex ? "#93a6ee"  : "white"
                Rectangle
                {
                    id: bottomSeparator
                    width: parent.width
                    height: 1
                    color: "#6d84de"
                    anchors.bottom: parent.bottom
                }
            }

            InnerShadow {
                id: innerRect
                source: fillRect
                anchors.fill: fillRect
                samples: 16
                radius: 8.0
                verticalOffset: 3
                color: "black"
                opacity: 0.25
                visible: index == currentIndex ? true : false
            }


            Item {
                id: element
                anchors.fill: parent
                Text {
                    id: modelDateText
                    text: model.Date
                    color: "black"
                    opacity: index == currentIndex ? 0.76 : 0.56
                    font.family: "poppins_black"
                    font.pixelSize:12
                    anchors.right: parent.right
                    anchors.rightMargin: 4
                }

                Text {
                    id: modelTitleText
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 5
                    text: {
                        if(model.Title.length>=16){
                            return model.Title.substring(0,13)+'...'
                        }
                        return model.Title
                    }

                    color: index==listw.currentIndex ? "#00135F"  : "#404040"
                    verticalAlignment: Text.AlignVCenter
                    font.family: "merriweather"
                    font.pixelSize: 17
                }
            }

            states: [
                State {
                    name: "delegateEntered"
                    PropertyChanges {
                        target: fillRect
                        color: "#bbc7f4"
                    }
                },
                State {
                    name: "delegatePressed"
                    PropertyChanges {
                        target: fillRect
                        color: "#93a6ee"
                    }
                }]
            transitions: [
                Transition {
                    from: ""
                    to: "delegateEntered"
                    PropertyAnimation {
                        properties: "color"
                        duration: 70
                        easing.type: Easing.OutQuad
                    }

                },
                Transition {
                    from: "delegateEntered"
                    to: ""
                    PropertyAnimation {
                        properties: "color"
                        duration: 70
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
    }
}




/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
