import QtQuick 2.0
import QtQuick.Window 2.12
import QtQuick.Controls 2.12

Rectangle {
    property alias readonly: textField.readOnly
    property alias state: mainRect.state
    property alias text: textField.text
    property alias textfocus: textField.focus
    id: mainRect
    color: "#617adb"
    visible: false

    signal searchFinished(var searchText)


    TextField {
        onTextChanged: {
            searchFinished(text)
        }

        id: textField
        anchors.fill: parent
        font.pixelSize: 15
        font.family: "merriweather"
        leftPadding: 0
        bottomPadding: 8
        topPadding: 8
        placeholderText: "Search"
        placeholderTextColor: "#f5f5f5"

        maximumLength: 20
        selectionColor: "#3399FF"
        selectByMouse: true
        focus: true
        color: "white"


        background: Rectangle {
            visible: false
        }
    }

    states: [
        State {
            name: "Active"
            PropertyChanges {
                target: mainRect
                visible: true
                width: 220
            }
        }]

    transitions: [
        Transition {
            from: ""
            to: "Active"
            PropertyAnimation {
                properties: "width"
                duration: 250
                easing.type: Easing.OutQuad
            }

        },
        Transition {
            from: "Active"
            to: ""
            PropertyAnimation {
                properties: "width, visible"
                duration: 250
                easing.type: Easing.InQuad
            }
        }]

}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
