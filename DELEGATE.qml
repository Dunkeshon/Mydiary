import QtQuick 2.0
import QtGraphicalEffects 1.0
import QtQuick.Controls 2.12

//ItemDelegate{

//    property alias mouseArea: mousearea
//    property alias date: modelDateText.text
//    property alias title: modelTitleText.text
//    property bool current: false

//    id:control
//    contentItem:
//        MouseArea {
//        id: mousearea
//        hoverEnabled: true
//        //   anchors.fill: parent
//        cursorShape: Qt.PointingHandCursor
//        Item {
//            id: element
//            anchors.fill: parent
//            Text {
//                id: modelDateText
//                color: "black"
//                opacity: 0.56
//                font.family: "poppins_black"
//                font.pixelSize:12
//                anchors.right: parent.right
//                anchors.rightMargin: 4
//            }

//            Text {
//                id: modelTitleText
//                anchors.left: parent.left
//                anchors.leftMargin: 10
//                anchors.bottom: parent.bottom
//                anchors.bottomMargin: 5
//                color:"#404040"
//                verticalAlignment: Text.AlignVCenter
//                font.family: "merriweather"
//                font.pixelSize: 17
//            }
//        }
//    }
//    background:
//        Rectangle {
//        id: fillRect
//        anchors.fill: parent
//        color: {
//            if(control.pressed){
//                return "#93a6ee"
//            }
//            else if(mousearea.containsMouse){
//                return "#bbc7f4"
//            }
//            else{
//                return "white"
//            }

//        }
//        Rectangle
//        {
//            id: bottomSeparator
//            width: parent.width
//            height: 1
//            color: "#6d84de"
//            anchors.bottom: parent.bottom
//        }
//    }
//}

Item {
    id: delegate

    property alias mouseArea: mousearea
    property alias date: modelDateText.text
    property alias title: modelTitleText.text
    property bool current: false


    MouseArea {
        id: mousearea
        hoverEnabled: true
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor
    }

    Rectangle {
        id: fillRect
        anchors.fill: parent
        color: "white"
        Rectangle
        {
            id: bottomSeparator
            width: parent.width
            height: 1
            color: "#6d84de"
            anchors.bottom: parent.bottom
        }
    }

    InnerShadow {
        id: innerRect
        source: fillRect
        anchors.fill: fillRect
        samples: 16
        radius: 8.0
        verticalOffset: 3
        color: "black"
        opacity: 0.25
        visible: false
    }


    Item {
        id: element
        anchors.fill: parent
        Text {
            id: modelDateText
            color: "black"
            opacity: 0.56
            font.family: "poppins_black"
            font.pixelSize:12
            anchors.right: parent.right
            anchors.rightMargin: 4
        }

        Text {
            id: modelTitleText
            anchors.left: parent.left
            anchors.leftMargin: 10
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 5
            color:"#404040"
            verticalAlignment: Text.AlignVCenter
            font.family: "merriweather"
            font.pixelSize: 17
        }
    }

    states: [
        State {
            name: "delegateEntered"
            when: mousearea.containsMouse && !mousearea.pressed && !current
            PropertyChanges {
                target: fillRect
                color: "#bbc7f4"// наведен
            }
        },
        State {
            name: "delegatePressed"
            when: mousearea.containsPress && !current
            PropertyChanges {
                target: fillRect
                color: "#93a6ee"
            }
        },
        State {
            name: "delegateRealized"
            when: current
            PropertyChanges {
                target: fillRect
                color: "#93a6ee"
            }
            PropertyChanges {
                target: mousearea
                cursorShape: Qt.ArrowCursor
            }
            PropertyChanges {
                target: innerRect
                visible: true
            }
            PropertyChanges {
                target: modelTitleText
                color: "#00135F"
            }
            PropertyChanges {
                target: modelDateText
                opacity: 0.76
            }
        }]
    transitions: [
        Transition {
            from: ""
            to: "delegateEntered"
            PropertyAnimation {
                properties: "color"
                duration: 70
                easing.type: Easing.OutQuad
            }

        },
        Transition {
            from: "delegateEntered"
            to: ""
            PropertyAnimation {
                properties: "color"
                duration: 70
                easing.type: Easing.InQuad
            }
        },
        Transition {
            from: "delegateEntered"
            to: "delegatePressed"
            PropertyAnimation {
                properties: "color"
                duration: 70
                easing.type: Easing.OutQuad
            }
        },
        Transition {
            from: "delegatePressed"
            to: "delegateEntered"
            PropertyAnimation {
                properties: "color"
                duration: 150
                easing.type: Easing.InQuad
            }
        },
        Transition {
            from: "delegatePressed"
            to: ""
            PropertyAnimation {
                properties: "color"
                duration: 250
                easing.type: Easing.InQuad
            }
        }]
}
