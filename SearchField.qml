import QtQuick 2.0
import QtQuick.Window 2.12
import QtQuick.Controls 2.12

Rectangle {
    property alias color: mainRect.color
    property alias read: textField.readOnly
    id: mainRect
    color: "#617adb"

    TextField {
        id: textField
        anchors.fill: parent
        font.pixelSize: 15
        font.family: "merriweather"
        leftPadding: 0
        bottomPadding: 8
        topPadding: 8
        placeholderText: "Search"
        placeholderTextColor: "#f5f5f5"

        readOnly: true
        maximumLength: 20
        selectionColor: "#3399FF"
        selectByMouse: true
        color: "white"


        background: Rectangle {
            visible: false
        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
