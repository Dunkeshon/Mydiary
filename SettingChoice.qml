import QtQuick 2.0
import QtQuick.Controls 2.12

Item {
    id: mainItem

    property color backgroundColor
    property var content
    property color textColor
    property alias mArea: choiceArea
    property alias fontSize: choicename.font.pixelSize
    property bool choiced: false



    Rectangle {
        anchors.fill: parent
        id:background
        color: backgroundColor

        Text {
            id: choicename
            anchors.centerIn: parent
            font.pixelSize: 20
            text: content
            color: textColor
        }
    }

    MouseArea {
        id: choiceArea
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor
        hoverEnabled: true
    }


    states: [
    State {
            name: "Entered"
            when: choiceArea.containsMouse && !choiceArea.pressed && !choiced
            PropertyChanges {
                target: choicename
                font.pixelSize: 24
            }
        },
        State {
            name: "Pressed"
            when: choiceArea.containsPress && !choiced
            PropertyChanges {
                target: choicename
                font.pixelSize: 24
                color: "white"
            }
        },
        State {
            name: "Choiced"
            when:choiced
            PropertyChanges {
                target: choicename
                color: "white"
            }
            PropertyChanges {
                target: choiceArea
                cursorShape: Qt.ArrowCursor
            }
        }

    ]

    transitions: [
        Transition {
            from: ""
            to: "Entered"
            PropertyAnimation {
                properties: "font.pixelSize"
                duration: 150
                easing.type: Easing.OutQuad
            }
        },
        Transition {
            from: "Entered"
            to: "Pressed"
            PropertyAnimation {
                properties: "color"
                duration: 150
                easing.type: Easing.OutQuad
            }
        }]

}
