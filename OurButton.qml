import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtGraphicalEffects 1.0

//need to set source image
Rectangle {
    property var imageMargin: 3
    property var size: 25
    property alias sourceImage:icon.source
    property var toolTipText: "nothing"
    property alias clickable: mousearea
    id: button
    height: size
    width: size
    color: parent.color
    radius: height

    ToolTip {
        id:buttonToolTip
        //text: qsTr("Delete note")
        delay: 1000
        timeout: 5000
        visible: mousearea.containsMouse ? true : false
        contentItem: Text {
            text: toolTipText
            styleColor: "#ffffff"
            font.family: "poppins_black"
            color: "#8f000000"
        }
    }
    Image {
        id: icon
        anchors.fill: parent
        anchors.margins: imageMargin
    }

    ColorOverlay {
        id: buttonColorOverlay
        anchors.fill: icon
        source: icon
        color: "#aaaaaa"
    }

    MouseArea {
        id:mousearea
        anchors.fill: parent
        hoverEnabled: true
        onClicked: {
            //ButtonChecked()
            button.state = "buttonEntered"
        }
        onEntered: button.state = "buttonEntered"
        onExited: button.state = ""
        onPressed: button.state = "buttonPressed"
        cursorShape: Qt.PointingHandCursor
    }

    states: [
        State {
            name: "buttonEntered"
            PropertyChanges {
                target: buttonColorOverlay
                color: "#777777"
            }
        },
        State {
            name: "buttonPressed"
            PropertyChanges {
                target: buttonColorOverlay
                color: "black"
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
