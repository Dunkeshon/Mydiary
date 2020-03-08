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
    property color innerChadowColor //: "black"
    property color titleTextColor // : "#404040"
    property color dateTextColor //: "black"
    property color enteredColor //: "#bbc7f4"
    property color pressedColor //: "#93a6ee"
    property color modelDateTextRealized //: "#00135F"
    property color modelTitleTextRealized


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
        color: {
            switch(qSettings.colorTheme)
            {
           case Themes.DEFAULT_THEME:
               fillDelegateColor="white"
            break;
        case Themes.ROSE_THEME:

            fillDelegateColor="white"
            break;
        case Themes.YELLOW_THEME:

            break;
        case Themes.DARK_THEME:
            fillDelegateColor = "#505050"
            break;
        default: throw "Theme id out of range"
        }
            return fillDelegateColor
        }
    }
            //fillDelegateColor
       // "#505050"
        Rectangle
        {
            id: bottomSeparator
            width: parent.width
            height: 1
            color: {
                switch(qSettings.colorTheme)
                {
               case Themes.DEFAULT_THEME:
                   bottomSeparatorColor="#6d84de"
                break;
            case Themes.ROSE_THEME:
                bottomSeparatorColor=Qt.rgba(255, 168, 168, 0.72)
                break;
            case Themes.YELLOW_THEME:
                break;
            case Themes.DARK_THEME:
                bottomSeparatorColor = "white"
                break;
            default: throw "Theme id out of range"
            }
                return bottomSeparatorColor
            }
                //bottomSeparatorColor
            //Qt.rgba(255, 168, 168, 0.72)
            anchors.bottom: parent.bottom
        }


    InnerShadow {
        id: innerRect
        source: fillRect
        anchors.fill: fillRect
        samples: 16
        radius: 8.0
        verticalOffset: 3
        color: {
            switch(qSettings.colorTheme)
            {
           case Themes.DEFAULT_THEME:
               innerChadowColor=Qt.rgba(0, 0, 0, 0.44)
            break;
        case Themes.ROSE_THEME:
            innerChadowColor=Qt.rgba(123, 54, 54, 0.6)
            break;
        case Themes.YELLOW_THEME:
            break;
        case Themes.DARK_THEME:
            innerChadowColor = Qt.rgba(0, 0, 0, 0.72)
            break;
        default: throw "Theme id out of range"
        }
            return innerChadowColor
        }
            //innerChadowColor
       // opacity: 0.25
        visible: false
    }


    Item {
        id: element
        anchors.fill: parent
        Text {
            id: modelDateText
            color: {
                switch(qSettings.colorTheme)
                {
               case Themes.DEFAULT_THEME:
                   dateTextColor=Qt.rgba(0, 0, 0, 0.56)
                break;
            case Themes.ROSE_THEME:
                dateTextColor=Qt.rgba(123, 54, 54, 0.73)
                break;
            case Themes.YELLOW_THEME:
                break;
            case Themes.DARK_THEME:
                dateTextColor = At.rgba(255, 255, 255, 0.93)
                break;
            default: throw "Theme id out of range"
            }
                return dateTextColor
            }
                //dateTextColor
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
            color:{
                switch(qSettings.colorTheme)
                {
               case Themes.DEFAULT_THEME:
                   titleTextColor=Qt.rgba(0, 0, 0, 0.65)
                break;
            case Themes.ROSE_THEME:
                titleTextColor=Qt.rgba(123, 54, 54, 0.73)
                break;
            case Themes.YELLOW_THEME:
                break;
            case Themes.DARK_THEME:
                titleTextColor = "#FFFFFF"
                break;
            default: throw "Theme id out of range"
            }
                return titleTextColor
            }
                //titleTextColor
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

                color:{
                    switch(qSettings.colorTheme)
                    {
                   case Themes.DEFAULT_THEME:
                       enteredColor="#bbc7f4"
                    break;
                case Themes.ROSE_THEME:

                    enteredColor="#FFE0E0"
                    break;
                case Themes.YELLOW_THEME:

                    break;
                case Themes.DARK_THEME:
                    enteredColor = "#828282"
                    break;
                default: throw "Theme id out of range"
                }
                    return enteredColor
                }

            }
        },
        State {
            name: "delegatePressed"
            when: mousearea.containsPress && !current
            PropertyChanges {
                target: fillRect
                color: {
                    switch(qSettings.colorTheme)
                    {
                   case Themes.DEFAULT_THEME:
                       pressedColor="#93a6ee"
                    break;
                case Themes.ROSE_THEME:
                    pressedColor="#FFC0C0"
                    break;
                case Themes.YELLOW_THEME:
                    break;
                case Themes.DARK_THEME:
                    pressedColor = "#D8D8D8"
                    break;
                default: throw "Theme id out of range"
                }
                    return pressedColor
                }
                    //pressedColor

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
            PropertyChanges {
                target: innerRect
                visible: true
            }
            PropertyChanges {
                target: modelTitleText
                color: {
                    switch(qSettings.colorTheme)
                    {
                   case Themes.DEFAULT_THEME:
                       modelTitleTextRealized="#00135F"
                    break;
                case Themes.ROSE_THEME:
                    modelTitleTextRealized=Qt.rgba(123, 54, 54, 0.73)
                    break;
                case Themes.YELLOW_THEME:
                    break;
                case Themes.DARK_THEME:
                    modelTitleTextRealized = "black"
                    break;
                default: throw "Theme id out of range"
                }
                    return modelTitleTextRealized
                }
                    //modelDateTextRealized
            }
            PropertyChanges {
                target: modelDateText
                color:{
                    switch(qSettings.colorTheme)
                    {
                   case Themes.DEFAULT_THEME:
                       modelDateTextRealized=QT.rgba(0, 0, 0, 0.76)
                    break;
                case Themes.ROSE_THEME:
                    modelDateTextRealized=Qt.rgba(123, 54, 54, 0.73)
                    break;
                case Themes.YELLOW_THEME:
                    break;
                case Themes.DARK_THEME:
                    modelDateTextRealized = Qt.rgba(0, 0, 0, 0.93)
                    break;
                default: throw "Theme id out of range"
                }
                    return modelDateTextRealized
                }
                //modelDateTextRealized
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
