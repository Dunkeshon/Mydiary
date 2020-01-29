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
            x: 61
            y: 120
            width: window.width/5
            height: parent.height
        }


        TextINputWindow {
            id: userinput
            x: 298
            y: 27
        }

}


