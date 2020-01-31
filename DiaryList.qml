import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import Diary 1.0

Item {
    Layout.fillWidth: true
    Layout.fillHeight: true
    Layout.minimumWidth: 50
    Layout.minimumHeight: 150

    ListView {
        anchors.rightMargin: 58
        anchors.bottomMargin: -16
        anchors.leftMargin: -58
        anchors.topMargin: 16
        anchors.fill:parent
        clip: true

        model:DiaryModel{
            list: diaryList
        }

        delegate: Item {
            width:parent.width

            ColumnLayout {
                Text {
                    id: modelDateText
                    text: model.Date
                    font.pixelSize: 16
                }
                Rectangle{
                    id: delegateSeparator
                    height: 2
                    width: 120 //frame1.width/2
                    color: "black"
                }
                Text {
                    text: model.Title
                    font.pointSize: 16
                    wrapMode: Text.WrapAnywhere
                }
            }

            //                background: Rectangle{
            //                    border.width: 1
            //                    border.color: "black"
            //                    radius: 5
            //                    clip: true
            //                }
        }
    }
}
