import QtQuick 2.0
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtGraphicalEffects 1.0

Rectangle {
    property alias color: button.color
    property alias iconSource: buttonIcon.source
    property alias iconColor: buttonColorOverlay.color
    property alias iconRotation: buttonColorOverlay.rotation
    property alias mousearea: buttonArea
    id: button

    signal buttonChecked()

    Image {
        id: buttonIcon
        anchors.fill: parent
        anchors.margins: 6
        visible: false
    }

    ColorOverlay {
        id: buttonColorOverlay
        anchors.fill: buttonIcon
        source: buttonIcon
        transformOrigin: Item.Center
        color: "#ffffff"
    }

    MouseArea {
        id:buttonArea
        anchors.fill: parent
        hoverEnabled: true
        onClicked: {
            buttonChecked()
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
                color: "#70E883"
            }
        },
        State {
            name: "buttonPressed"
            PropertyChanges {
                target: button
                color: "#4c69d7"
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
