import QtQuick 2.0
//import QtQuick.Controls 2.12
import QtGraphicalEffects 1.0

MouseArea{
    id:themeArea

    property int iconMargins: 2
    property int icon_size: 18
    property color iconColor: "white"
    property color bColor: "#6d84de"
    property color enteredColor: "grey"// not owerload in themes changes
    property color pressedColor: "grey" // remove later
    property var themeName: "Theme"



    property alias mousearea: themeArea
    property bool changePressedTargetOnColorOverlay: false

    property color fontColor: "white"



    implicitWidth: 100
    implicitHeight: 50
    Rectangle{
        id:themeRect
        anchors.fill: parent
        color: bColor


    Rectangle{
        id:themeImage
        anchors.verticalCenter: parent.verticalCenter
        anchors.margins: 5
        anchors.left: parent.left

        width: icon_size
        height: icon_size
        color: bColor
        Image {
            id: themeIcon
            anchors.fill: parent
            anchors.margins: iconMargins
            source: "resources/images/themeIcon.svg"
            visible: false
        }

        ColorOverlay {
            id: themeColorOverlay
            anchors.fill: themeIcon
            source: themeIcon
            transformOrigin: Item.Center
            color: iconColor
        }

    }
    Text{
        id:themeText
        anchors.left: themeImage.right
        anchors.right: parent.right
        anchors.verticalCenter: parent.verticalCenter
        anchors.margins:5
        text: themeName
        font.family: "poppins_black"
        font.pixelSize:18
        color: fontColor
    }

    states: [
        State {
            name: "themeEntered"
            when: themeArea.containsMouse && !themeArea.pressed
            PropertyChanges {
                target: themeColorOverlay
                color: enteredColor
            }
        },
        State {
            name: "themePressed"
            when: themeArea.containsPress
            PropertyChanges {
                target: changePressedTargetOnColorOverlay ? themeColorOverlay : themeRect
                color: pressedColor

            }
        }]
    transitions: [
        Transition {
            from: ""
            to: "themeEntered"
            PropertyAnimation {
                properties: "color"
                duration: 250
                easing.type: Easing.OutQuad
            }

        },
        Transition {
            from: "themeEntered"
            to: ""
            PropertyAnimation {
                properties: "color"
                duration: 250
                easing.type: Easing.InQuad
            }
        },
        Transition {
            from: "themeEntered"
            to: "themePressed"
            PropertyAnimation {
                properties: "color"
                duration: 70
                easing.type: Easing.OutQuad
            }
        },
        Transition {
            from: "themePressed"
            to: "themeEntered"
            PropertyAnimation {
                properties: "color"
                duration: 150
                easing.type: Easing.InQuad
            }
        },
        Transition {
            from: "themePressed"
            to: ""
            PropertyAnimation {
                properties: "color"
                duration: 250
                easing.type: Easing.InQuad
            }
        }]
    }
}
