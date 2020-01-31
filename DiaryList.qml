import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import Diary 1.0

ColumnLayout {

    Frame {
    background:Rectangle {
        id: rectangle
        border.width: 2
        border.color:"#917b7b"
        radius: 10
        clip: true
    }


        Layout.fillWidth: true
        Layout.fillHeight: true
        Layout.minimumWidth: 50
        Layout.minimumHeight: 150

        ListView {
            anchors.fill:parent
            clip: true
            model:DiaryModel{
                list: diaryList
            }
            delegate:Frame{
                width:parent.width
                background: Rectangle{
                    border.width: 1
                    border.color:"#917b7b"
                    radius: 5
                    clip: true
                }
                ColumnLayout{
                    width:parent.width
                    spacing: 6
                    Text {
                        anchors.leftMargin: 10
                        text: model.Date
                        font.pointSize: 16
                    }
                    Rectangle{
                        height: 1
                        width: 120 //frame1.width/2
                        color: "black"
                    }
                    Text {
                        text: model.Title
                        font.pointSize: 16
                        wrapMode: Text.WrapAnywhere
                    }
                }
            }
        }
    }
}
