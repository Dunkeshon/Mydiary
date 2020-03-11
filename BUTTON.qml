import QtQuick 2.0
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtGraphicalEffects 1.0
import "funclist.js" as F
import Diary 1.0

Rectangle {
    //override
    property alias iconSource: buttonIcon.source
    property var size: 0
    property var iconMargins: 0
    property color iconColor//: "white"
    property color bColor //: "white"
    property color enteredColor//: "white"
    property color pressedColor//: "white"


    property alias mousearea: buttonArea
    property alias iconRotation: buttonColorOverlay.rotation
    property bool changePressedTargetOnColorOverlay: false



    //toolTip
    property var toolTipText: "nothing"
    property int toolDelay: 1000
    property int toolTimeout: 5000
    property color toolBackgroundColor : "white" //for themes
    property color toolBorderColor : "#bfbfbf" //for themes
    property color toolTipTextColor: "#333333"

    id: button
    color: bColor
    width: size
    height: size

    signal buttonChecked() //connect

    Component.onCompleted: {
        button.buttonChecked.connect(F.focusOff)
    }


    Image {
        id: buttonIcon
        anchors.fill: parent
        anchors.margins: iconMargins
        visible: false // we transform overlay, not an image
        sourceSize.width: width*Screen.devicePixelRatio
        sourceSize.height: height*Screen.devicePixelRatio
    }

    ColorOverlay {
        id: buttonColorOverlay
        anchors.fill: buttonIcon
        source: buttonIcon
        transformOrigin: Item.Center
        color: iconColor
    }

    MouseArea {
        id:buttonArea
        anchors.fill: parent
        hoverEnabled: true
        onClicked: {
            buttonChecked()
        }
        cursorShape: Qt.PointingHandCursor
    }

    ToolTip {
        id:buttonToolTip
        delay: toolDelay
        timeout: toolTimeout
        visible: mousearea.containsMouse ? true : false

        contentItem: Rectangle {
            anchors.fill: parent
            border.color: toolBorderColor
            border.width: 2
            color: toolBackgroundColor
            Text {
                anchors.centerIn: parent
                text: toolTipText
                font.family: "poppins_black"
                color: toolTipTextColor
            }

        }
    }

    states: [
        State {
            name: "buttonEntered"
            when: buttonArea.containsMouse && !buttonArea.pressed
            PropertyChanges {
                target: buttonColorOverlay
                color: enteredColor
            }
        },
        State {
            name: "buttonPressed"
            when: buttonArea.containsPress
            PropertyChanges {
                target: changePressedTargetOnColorOverlay ? buttonColorOverlay : button
                color: pressedColor
            }
        }]
    transitions: [
        Transition {
            from: ""
            to: "buttonEntered"
            PropertyAnimation {
                properties: "color"
                duration: 250
                easing.type: Easing.OutQuad
            }

        },
        Transition {
            from: "buttonEntered"
            to: ""
            PropertyAnimation {
                properties: "color"
                duration: 250
                easing.type: Easing.InQuad
            }
        },
        Transition {
            from: "buttonEntered"
            to: "buttonPressed"
            PropertyAnimation {
                properties: "color"
                duration: 70
                easing.type: Easing.OutQuad
            }
        },
        Transition {
            from: "buttonPressed"
            to: "buttonEntered"
            PropertyAnimation {
                properties: "color"
                duration: 150
                easing.type: Easing.InQuad
            }
        },
        Transition {
            from: "buttonPressed"
            to: ""
            PropertyAnimation {
                properties: "color"
                duration: 250
                easing.type: Easing.InQuad
            }
        }]
}
