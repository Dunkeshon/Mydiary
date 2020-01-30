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
    color: "#b9b1b1"
    title: qsTr("Hello World")


        DiaryList{
            id:scrollarea
            width: 166
            anchors.top: parent.top
            anchors.topMargin: 65
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 12
            anchors.left: parent.left
            anchors.leftMargin: 11

        }


        TextINputWindow {
            id: userinput
            x: 298
            y: 27
        }

        Rectangle {
            id: rectangle
            border.color: "black"
            border.width: 3
            width: 5
            color: "#190808"
            anchors.top: parent.top
            anchors.topMargin: 32
            anchors.bottom: parent.bottom
            anchors.bottomMargin: -6
            anchors.left: parent.left
            anchors.leftMargin: 192
        }

        Rectangle {
            id: rectangle1
            border.color: "black"
            border.width: 3
            width: 52
            color: "#ffffff"
            radius: 10
            anchors.top: parent.top
            anchors.topMargin: 0
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 450
            anchors.left: parent.left
            anchors.leftMargin: 53

            Text {
                id: element3
                x: -21
                y: -14
                width: 92
                height: 57
                text: qsTr("Search")
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: 12
            }
        }

        Rectangle {
            id: frame
            x: 0
            width: 640
            height: 6
            border.color: "black"
            border.width: 5
            anchors.top: parent.top
            anchors.topMargin: 27
        }

        Text {
            id: element
            x: 218
            y: 54
            width: 109

            height: 23

            text: qsTr("10.01.2020")
            font.pixelSize: 16
        }

        Text {
            id: element1
            x: 218
            y: 83
            width: 139
            height: 24
            text: qsTr("Your title ")
            font.pixelSize: 20
        }

        Rectangle {
            id: rectangle2
            x: 192
            y: 113
            width: 198
            height: 4
            color: "#060505"
        }

        Text {
            id: element2
            x: 218
            y: 136
            width: 361
            height: 61
            text: qsTr("Your Text here dsjkjsdjkjkjk \n dsjkdsjkjkdsjkdsjkdskjkjdskjdsjkds")
            font.pixelSize: 18
        }

        Text {
            id: element4
            x: 35
            y: 39
            width: 119
            height: 20
            text: qsTr("January")
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 16
        }

        Rectangle {
            id: rectangle3
            x: -9
            y: -8
            width: 52
            color: "#ffffff"
            radius: 10
            anchors.bottomMargin: 450
            anchors.leftMargin: 0
            anchors.topMargin: 0
            border.width: 3
            border.color: "#000000"
            Text {
                id: element5
                x: -24
                y: -14
                width: 95
                height: 57
                text: qsTr("Menu")
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: 12
            }
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.bottom: parent.bottom
        }

        Rectangle {
            id: rectangle4
            x: 2
            y: 7
            width: 52
            color: "#ffffff"
            radius: 10
            anchors.bottomMargin: 450
            anchors.leftMargin: 104
            anchors.topMargin: 0
            border.width: 3
            border.color: "#000000"
            Text {
                id: element6
                x: -24
                y: -14
                width: 95
                height: 57
                text: qsTr("Calendar")
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: 12
            }
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.bottom: parent.bottom
        }

}



/*##^##
Designer {
    D{i:1;anchors_height:171;anchors_width:148;anchors_x:42;anchors_y:187}D{i:3;anchors_height:432;anchors_x:209;anchors_y:33}
D{i:4;anchors_height:102;anchors_x:19;anchors_y:33}D{i:12;anchors_height:102;anchors_x:19;anchors_y:33}
D{i:14;anchors_height:102;anchors_x:19;anchors_y:33}
}
##^##*/
