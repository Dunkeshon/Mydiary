import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

Item {
    id:mainColumn
    property alias datetext: datetext
    property alias  titletext: title
    property alias usertext: userText

    Rectangle {
        id:topRect
        anchors.top: parent.top
        width: parent.width
        height: parent.height/7
        color: "#033749"

        Text {
            id: datetext
            width: 46
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.topMargin: 10
            anchors.leftMargin: 30
            text: qsTr("Date here")
            color: "white"
            font.pixelSize: 18
            Rectangle {
                id: blackCircle
                anchors.right: parent.left
                anchors.rightMargin: 5
                y:parent.height/2 + 2
                width: 20
                height: 20
                radius: 10
                color: "#64acc6"
            }
            Rectangle {
                id:separator
                anchors.top: parent.bottom
                anchors.left: blackCircle.left
                height: 1
                radius: 2
                width: mainColumn.width / 3
                color: "#64acc6"
            }

            TextField {
                id:title
                placeholderText:"Title"
                placeholderTextColor: "#aaaaaa"
                color: "white"
                anchors.top: separator.bottom
                anchors.left: blackCircle.right
                width: mainColumn.width
                height: parent.height + 3
                anchors.leftMargin: 5
                bottomPadding: 0
                leftPadding: 0
                font.pixelSize: 18
                maximumLength: 24
                selectionColor: "#3399FF"
                selectByMouse: true


                background: Rectangle {
                    visible: false
                }
            }
        }
    }

    Rectangle {
        anchors.top: topRect.bottom
        width: parent.width
        height: parent.height - topRect.height
        color: "#033749"
        ScrollView {
            anchors.fill: parent
            TextArea {
                id:userText
                renderType: Text.QtRendering
                leftPadding: 10
                placeholderText: qsTr("Enter Something)")
                placeholderTextColor: "#aaaaaa"
                color: "white"
                font.pixelSize: 18
                wrapMode: TextArea.WordWrap

                selectByMouse: true
                selectionColor: "#3399FF"
                focus: true
            }
        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
