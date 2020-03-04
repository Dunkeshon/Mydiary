import QtQuick 2.0
import QtQuick.Window 2.12
import QtQuick.Controls 2.12

Rectangle {
    property alias readonly: textField.readOnly
    property alias state: mainRect.state
    property alias text: textField.text
    property alias textfocus: textField.focus
    property color themeColor: "#617adb"
    property color textFieldColor: "white"
    property color placeholderTextColor: "#f5f5f5"
    property color textSelectionColor: "#3399FF"

    id: mainRect
    color: themeColor
    visible: false

    signal searchFinished(var searchText)


    TextField {
        id: textField
        onTextChanged: {
            searchFinished(text)
        }


        anchors.fill: parent
        font.pixelSize: 15
        font.family: "merriweather"
        leftPadding: 0
        bottomPadding: 8
        topPadding: 8
        placeholderText: "Search"
        placeholderTextColor: placeholderTextColor

        maximumLength: 20
        selectionColor: textSelectionColor
        selectByMouse: true
        focus: true
        color: textFieldColor


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
