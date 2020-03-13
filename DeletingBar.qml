import QtQuick 2.0

Rectangle {
    id: deletingBar

    property var mainColor
    property var backgroundBarColor
    property var barWidth

    width: barWidth
    height: 7
    radius: 7
    border.width: 1
    border.color: backgroundBarColor

    Rectangle {
        id:deletingBarProgress
        anchors.left: parent.left
        height: parent.height
        radius: parent.radius
        color: mainColor
        width: 0
    }


    states: [
        State {
            name: "Active"
            PropertyChanges {
                target: deletingBarProgress
                width: deletingBar.width
            }
        }]
    transitions: [
        Transition {
            from: ""
            to: "Active"
            PropertyAnimation {
                duration: 1200
                properties: "width"
                easing.type: Easing.Linear
            }
        },
        Transition {
            from: "Active"
            to: ""
            PropertyAnimation {
                duration: 150
                properties: "width"
                easing.type: Easing.InQuad
            }
        }]
}
