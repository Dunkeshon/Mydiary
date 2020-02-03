import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import Diary 1.0


ColumnLayout {
    Layout.fillWidth: true
    Layout.fillHeight: true
    Layout.minimumWidth: 50
    Layout.minimumHeight: 150

    ListView {
        property int curitem: currentIndex
        id:listw
        focus:true
        Layout.fillWidth: true
        Layout.fillHeight: true
        clip: true

        model:DiaryModel{
            list: diaryList
        }

        delegate: Frame {
            id:listdelegate
            width:parent.width
            height: 65
            MouseArea {
                anchors.fill: parent
                onClicked: listw.curitem = index
            }

            background: Rectangle {
                color: (index==listw.curitem) ? "lightsteelblue"  : "#C4C4C4"
                Text {
                    id: ind
                    text:index
                }
                Rectangle {
                    width: parent.width
                    height: 1
                    color: "black"

                    anchors.bottom: parent.bottom
                }
            }

            ColumnLayout {
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
                    font.pointSize: 16
                    //wrapMode: Text.WrapAnywhere
                }
            }


        }
    }
}
