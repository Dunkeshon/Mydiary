import QtQuick 2.0
import Diary 1.0
import QtQuick.Controls 2.12
import QtGraphicalEffects 1.0

Item {
    id: delegate

    property alias mouseArea: mousearea
    property alias date: modelDateText.text
    property alias title: modelTitleText.text
    property bool current: false

    property color bottomSeparatorColor //: "#6d84de"
    property color fillDelegateColor //: "white"
 //   property color innerChadowColor //: "black"
    property color titleTextColor // : "#404040"
    property color dateTextColor //: "black"
    property color enteredColor //: "#bbc7f4"
    property color pressedColor //: "#93a6ee"
    property color modelDateTextRealized //: "#00135F"
    property color modelTitleTextRealized
  //  property color delegateRealized



    Component.onCompleted: {

    }

    MouseArea {
        id: mousearea
        hoverEnabled: true
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor
    }

    Rectangle {
        id: fillRect
        anchors.fill: parent
        color: fillDelegateColor
        // "#505050"
        Rectangle
        {
            id: bottomSeparator
            width: parent.width
            height: 1
            color:bottomSeparatorColor
            //Qt.rgba(255, 168, 168, 0.72)
            anchors.bottom: parent.bottom
        }


//        InnerShadow {
//            id: innerRect
//            source: fillRect
//            anchors.fill: fillRect
////            samples: 16
////            radius: 8.0
////            verticalOffset: 3
////            color:innerChadowColor
////            // opacity: 0.25
//            visible: false
//        }


        Item {
            id: element
            anchors.fill: parent
            Text {
                id: modelDateText
                color:dateTextColor
                //opacity: 0.56
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
                color:titleTextColor
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
                    color:enteredColor
                }
            },
            State {
                name: "delegatePressed"
                when: mousearea.containsPress && !current
                PropertyChanges {
                    target: fillRect
                    color: pressedColor

                }
            },
            State {
                // нажат и активен
                name: "delegateRealized"
                when: current
                PropertyChanges {
                    target: fillRect
                    color: pressedColor
                }
                PropertyChanges {
                    target: mousearea
                    cursorShape: Qt.ArrowCursor
                }
//                PropertyChanges {
//                    target: innerRect
//                    visible: true
//                }
                PropertyChanges {
                    target: modelTitleText
                    color: modelDateTextRealized
                }
                PropertyChanges {
                    target: modelDateText
                    color: modelDateTextRealized
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
}
