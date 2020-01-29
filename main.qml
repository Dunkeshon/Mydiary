import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

Window {
    id: window
    visible: true
    minimumWidth:400
    minimumHeight: 400
    width: 640
    height: 480
   // color: "#b9b1b1"
    title: qsTr("Hello World")


        DiaryList{
            id:scrollarea
            width: 160
            anchors.top: parent.top
            anchors.topMargin: 83
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 37
            anchors.left: parent.left
            anchors.leftMargin: 30

        }


        TextINputWindow {
            id: userinput
            x: 298
            y: 27
        }

}



/*##^##
Designer {
    D{i:1;anchors_height:171;anchors_width:148;anchors_x:42;anchors_y:187}
}
##^##*/
