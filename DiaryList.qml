import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import Diary 1.0

ColumnLayout{
    Frame{
        id:frame1
    background:Rectangle{
        id: rectangle
        border.width: 2
        border.color:"#917b7b"
        radius: 10
        clip: true
    }


        Layout.fillWidth: true
        Layout.fillHeight: true
        Layout.minimumWidth: 50
//        Layout.preferredWidth: Layout.width
//        Layout.preferredHeight: Layout.height
       // Layout.maximumWidth: 300
        Layout.minimumHeight: 150

        ListView{
            id:listw
            anchors.fill:parent
            clip: true
            model:DiaryModel{
                list: diaryList
            }
            delegate:
                Frame{

                width:parent.width
                background: Rectangle{
                    border.width: 1
                    border.color:"#917b7b"
                    radius: 2
                    clip: true
                }


                ColumnLayout{

                    width:parent.width
                    spacing: 6

                    Text {
                        id: dateField
                        anchors.leftMargin: 10
                        text: model.Date
                        font.pointSize: 16
                    }
                    Rectangle{
                        id:separator
                        height: 1
                        width: parent.width/2
                        color: "black"
                    }


                    Text {
                        id: titleField
                        text: model.Title
                        font.pointSize: 16
                        wrapMode: Text.WrapAnywhere
                    }
//                    Rectangle{
//                        id:separator2
//                        height: 1
//                        width: frame1.width
//                        color: "black"
//                    }

                }
            }




        }
    }
}
