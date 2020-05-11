import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Window 2.12
import Diary 1.0
import "funclist.js" as F
import QtGraphicalEffects 1.0


Item{
    id:pWindow
    //Themes
    property color buttonBackgroundColor
    property color buttonHoveredColor
    property color buttonPressedColor


    property color buttonBorderColor
    property color buttonBorderHoveredColor
    property color buttonBorderPresedColor

    property color buttonTextColor
    property color buttonTextHoveredColor
    property color buttonTextPressedColor
    property color passwordRectBorderColor
    property color lockOverlayColor
    property color backgroundColor
    property color backgroundTopRightColor
    property color backgroundTopLeftColor
    property color backgroundBottomRightColor
    property color backgroundBottomLeftColor



    property alias myPassword:password.text
    property bool locked: true
    property alias  openingPasswordAnim: openingPasswordAnim
    anchors.fill: parent
    onLockedChanged: {
        if(locked==true){
            mainWindowItem.enabled=false
        }
        else {
            mainWindowItem.enabled=true
        }
    }

    Component.onCompleted: {
        password.forceActiveFocus()
    }

    Item{
        z:1
        anchors.fill: parent

        SVGImage {
            id: backgroundTopLeft
            iconSource:"qrc:/resources/images/defaultBackgroundTopLeft.svg"
            z:1
            width: parent.width
            height: parent.height
            iconVisible: true
            image.cache: false
            image.clip: true
            iconColor: backgroundTopLeftColor
            imageOpacity: 0.72
        }
        SVGImage {
            id: backgroundTopRight
            iconSource:"qrc:/resources/images/defaultBackgroundTopRight.svg"
            z:1
            width: parent.width
            height: parent.height
            iconVisible: true
            image.cache: false
            image.clip: true
            iconColor: backgroundTopRightColor
            imageOpacity: 0.72
        }
        SVGImage {
            id: backgroundBottomLeft
            iconSource:"qrc:/resources/images/defaultBackgroundBottomLeft.svg"
            z:1
            width: parent.width
            height: parent.height
            iconVisible: true
            image.cache: false
            image.clip: true
            iconColor: backgroundBottomLeftColor
            imageOpacity: 0.46
        }
        SVGImage {
            id: backgroundBottomRight
            iconSource:"qrc:/resources/images/defaultBackgroundBottomRight.svg"
            z:1
            width: parent.width
            height: parent.height
            iconVisible: true
            image.cache: false
            image.clip: true
            iconColor: backgroundBottomRightColor
            imageOpacity: 0.72
        }
        //                Image {
        //                    id: animeImage
        //                    x: 383
        //                    y: 89
        //                    z:2
        //                    width:282
        //                    height: 401
        //                    anchors.bottomMargin: -10
        //                    anchors.rightMargin: -25
        //                    anchors.right: parent.right
        //                    anchors.bottom: parent.bottom
        //                    source: { return backEnd.generateAnimeGirl()}
        //                    clip: true
        //                    cache: false
        //                    sourceSize.width: width*Screen.devicePixelRatio
        //                    sourceSize.height: height*Screen.devicePixelRatio
        //                }
        Timer{
            id:intervalOffTimer
            interval: 200;
            onTriggered:{
                // go second top
                topRightOffScreenAnim.start()
                bottomLeftOffScreenAnim.start()
            }
        }
        Timer{
            id:intervalOnTimer
            interval: 200;
            onTriggered:{
                // go second top
                topRightOnScreenAnim.start()
                bottomLeftOnScreenAnim.start()
            }
        }
        Timer{
            id:closingLockOnTimer
            interval: 600;
            onTriggered:{
                // go second top
                contentRect.passwordRect.state="reanchored"
                lockingLockOnAnim.start()
                opacityContentRectOn.start()
            }
        }
        PropertyAnimation {
            id:lockingLockOnAnim
            target: lock
            property: "anchors.verticalCenterOffset"

            easing.type: Easing.InCirc
            from:-30
            to: 0
            duration: 400
            onStarted: {
                //contentRect.passwordRect.state="reanchored"*/ //return anchors to normal
                //  contentRect.lock.state="reanchored" //return anchors to normal
            }
            onFinished: {
                contentRect.passwordRect.state="" //return anchors to normal
                //   contentRect.lock.state="" //return anchors to normal
            }
        }
        PropertyAnimation {
            id:topRightOffScreenAnim
            target: backgroundTopRight
            property: "y"

            easing.type: Easing.InOutExpo

            to: - (window.height * 0.5)
            duration: 800
        }
        PropertyAnimation {
            id:topRightOnScreenAnim
            target: backgroundTopRight
            property: "y"

            easing.type: Easing.InOutExpo

            to: 0
            duration: 800
        }
        PropertyAnimation {
            id:bottomLeftOffScreenAnim
            target: backgroundBottomLeft
            property: "y"

            easing.type: Easing.InOutExpo

            to: (window.height * 0.3)
            duration: 800
        }
        PropertyAnimation {
            id:bottomLeftOnScreenAnim
            target: backgroundBottomLeft
            property: "y"

            easing.type: Easing.InOutExpo

            to: 0
            duration: 800
        }
        ParallelAnimation{
            id:endingPasswordAnim
            PropertyAnimation {
                target: backgroundTopLeft
                property: "y"

                easing.type: Easing.InOutExpo

                to: - (window.height * 0.5)
                duration: 1000
            }
            PropertyAnimation {
                target: backgroundBottomRight
                property: "y"

                easing.type: Easing.InOutExpo// Easing.InOutSine

                to: (window.height * 0.3)
                duration: 1000
            }
            OpacityAnimator{
                target:contentRect
                from:1
                to:0
                duration:800
            }
            OpacityAnimator{
                target:backgroundRect
                from:1
                to:0
                duration:800
            }
            onStarted: {
                mainWindowItem.visible=true
                intervalOffTimer.start()
            }

            onFinished: {
                pWindow.visible=false
            }

        }
        ParallelAnimation{
            id:openingPasswordAnim
            PropertyAnimation {
                target: backgroundTopLeft
                property: "y"

                easing.type:Easing.InOutQuint // Easing.InOutExpo

                to: 0
                duration: 1000
            }
            PropertyAnimation {
                target: backgroundBottomRight
                property: "y"

                easing.type: Easing.InOutExpo

                to: 0
                duration: 1000
            }
            onStarted: {
                intervalOnTimer.start()
                closingLockOnTimer.start()
                contentRect.passwordRect.state="" //return anchors to normal
                contentRect.lock.state="" //return anchors to normal
                pWindow.visible=true
                backgroundRect.opacity=0
                contentRect.opacity=0
            }

            onFinished: {
                mainWindowItem.visible=false
                /*passwordWindow.*/locked = true
            }

            //                OpacityAnimator{
            //                    target:contentRect
            //                    from:0
            //                    to:1
            //                    duration:800
            //                }
            OpacityAnimator{
                target:backgroundRect
                from:0
                to:1
                duration:800
            }
        }
        OpacityAnimator{
            id:opacityContentRectOn
            target:contentRect
            from:0
            to:1
            duration:400
        }
        Item{
            property alias  lock : lock
            property alias  passwordRect : passwordRect
            z:3
            id:contentRect
            anchors.fill: parent
            Image {
                id: lock
                anchors.centerIn: parent
                width: 100
                height: 86
                source:locked==true? "qrc:/resources/images/new_lock.svg":"qrc:/resources/images/new_unlock.svg"
                sourceSize.width: width*Screen.devicePixelRatio
                sourceSize.height: height*Screen.devicePixelRatio
                states: [
                    State {
                        name: "reancored"
                        AnchorChanges {
                            target: lock
                            anchors.horizontalCenter: undefined
                            anchors.verticalCenter: undefined
                        }
                    }
                ]
                SequentialAnimation{
                    id: unlockedAnim
                    PropertyAnimation {
                        target: lock
                        property: "anchors.verticalCenterOffset"
                        easing.type: Easing.Linear
                        to: -25
                        duration: 100
                    }
                    PropertyAnimation {
                        target: lock
                        property: "anchors.verticalCenterOffset"
                        easing.type: Easing.OutBounce
                        to: 0
                        duration: 800
                    }
                }
                SequentialAnimation{
                    id: lockedAnim
                    PropertyAnimation {
                        target: lock
                        property: "anchors.horizontalCenterOffset"
                        easing.type: Easing.Linear
                        to: -20
                        duration: 200
                    }
                    PropertyAnimation {
                        target: lock
                        property: "anchors.horizontalCenterOffset"
                        easing.type: Easing.Linear
                        to: 20
                        duration: 200
                    }
                    PropertyAnimation {
                        target: lock
                        property: "anchors.horizontalCenterOffset"

                        easing.type: Easing.Linear
                        to: -10
                        duration: 100
                    }
                    PropertyAnimation {
                        target: lock
                        property: "anchors.horizontalCenterOffset"
                        easing.type: Easing.Linear
                        to: 10
                        duration: 100
                    }
                    PropertyAnimation {
                        target: lock
                        property: "anchors.horizontalCenterOffset"
                        easing.type: Easing.Linear
                        to: 0
                        duration:100
                    }
                }
            }
            ColorOverlay {
                id: lockOverlay
                anchors.fill: lock
                source: lock
                transformOrigin: Item.Center
                color: lockOverlayColor
            }
            Item{
                id:passwordRect
                width: 230
                height: 52
                z:3
                anchors.top: lock.bottom
                anchors.horizontalCenter: lock.horizontalCenter
                anchors.topMargin: 20
                states: [
                    State {
                        name: "reanchored"
                        AnchorChanges {
                            target: passwordRect
                            anchors.top: undefined
                        }
                    }
                ]
                MouseArea{
                    anchors.fill: parent
                    onClicked: password.forceActiveFocus()
                    cursorShape: Qt.IBeamCursor
                }
                TextField{
                    id:password
                    width: 230
                    height: 52
                    selectByMouse: true
                    anchors.centerIn: parent
                    echoMode: "Password"
                    font.pixelSize: 18
                    color: "black"
                    horizontalAlignment: Text.AlignHCenter
                    placeholderText: qSettings.isEnglish?"Password": "Введите пароль"
                    focus: true
                    background:
                        Rectangle {
                        color: "white"
                        border.color: passwordRectBorderColor
                        border.width: 2
                        radius: 26
                    }
                    onEditingFinished: F.acceptPassword()
                }
            }
            Button{
                z:3
                id:confirmButton
                contentItem: Text {
                    text:qSettings.isEnglish?"GO":"Вперед"
                    font.family: "poppins_black"
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    font.pixelSize: 17
                    color:{
                        if(confirmButton.down){
                            return buttonTextPressedColor
                        }
//                        else if(confirmButton.hovered){
//                            return buttonTextHoveredColor
//                        }
                        else {
                            return  buttonTextColor
                        }
                    }
                }

                onClicked:F.acceptPassword()
                width: 70
                height: 35
                anchors.top: passwordRect.bottom
                anchors.horizontalCenter: passwordRect.horizontalCenter
                anchors.topMargin: 20

                background: Rectangle{
                    radius: 26
                    border.color:{
                        if(confirmButton.down){
                            return buttonBorderPresedColor
                        }
//                        else if(confirmButton.hovered){
//                            return buttonBorderHoveredColor
//                        }
                        else {
                            return buttonBorderColor
                        }
                    }
                    border.width: 1
                    color: {
                        if(confirmButton.down){
                            return buttonPressedColor
                        }
//                        else if(confirmButton.hovered){
//                            return buttonHoveredColor
//                        }
                        else {
                            return  buttonBackgroundColor
                        }
                    }
                }
            }
        }
    }
    Rectangle {
        id:backgroundRect
        z:0
        anchors.fill: parent
        color: backgroundColor
    }
}



/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
