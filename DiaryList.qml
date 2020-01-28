import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import Diary 1.0


Frame{
//    radius: 5
//    border.color: "black"
//    border.width: 2
    ListView{
        implicitHeight: 250
        implicitWidth: 100
        anchors.fill:parent
        clip: true
        model:DiaryModel{
            list: diaryList
        }
        delegate: ColumnLayout{
            width:parent.width
            Text {
                id: dateField
                text: model.Date
                font.pointSize: 16
            }
            Rectangle{
                height: 1
                width: parent.width
                color: "black"
            }

//            ToolSeparator{
//                id: toolSeparator
//                orientation: Qt.Horizontal
//                width:parent.fillWidth
//            }


                Text {
                    id: userTextField
                    text: model.Text
                    wrapMode: Text.WrapAnywhere
                }

        }


    }
}
