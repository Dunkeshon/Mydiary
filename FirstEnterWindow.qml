import QtQuick 2.0
import QtQuick.Controls 2.12
Item {
    id:background
    SVGImage {
        id: backgroundTopLeft
        y:-20
        z:1
        iconSource:"qrc:/resources/images/defaultBackgroundTopLeft.svg"
        width: parent.width
        height: parent.height
        iconVisible: false // overlay
        image.visible: true
        image.cache: false
        image.clip: true
        imageOpacity: 0.72

    }
    SVGImage {
        id: backgroundTopRight
        z:1
        iconSource:"qrc:/resources/images/defaultBackgroundTopRight.svg"
        y:-20
        width: parent.width
        height: parent.height
        iconVisible: false // overlay
        image.visible: true
        image.cache: false
        image.clip: true
        imageOpacity: 0.72
    }
    SwipeView {
        id: view

        currentIndex: 0
        anchors.fill: parent

        Item {
            id: firstPage
            Text{
                id:firstText
                text: "Welcome to My Diary!"
                color: "black"
                anchors.left: parent.left
                anchors.leftMargin: parent.width * 0.06
                anchors.top: parent.top
                anchors.topMargin: parent.height*0.36
                font.pixelSize: parent.height * 0.06
                font.family: "poppins_black"
            }
            SVGImage{
                iconSource: "qrc:/resources/images/Thank you.svg"
                image.visible: true
                iconVisible: false
                anchors.top: firstText.bottom
                anchors.topMargin: parent.height * 0.02
                anchors.left: parent.left
                anchors.leftMargin: parent.width * 0.06
                height: parent.height*0.17
                width: height*2.9
            }
            SVGImage{
                iconSource: "qrc:/resources/images/Mobile.svg"
                image.visible: true
                iconVisible: false
                anchors.bottom:parent.bottom
                anchors.bottomMargin: parent.height * 0.17
                anchors.right: parent.right
                anchors.rightMargin: parent.width * 0.14
                height: parent.height*0.35
                width: height*1.54
            }

            //            Text {
            //                id: secondText
            //                text: "Thank you for join us.\nKeep your mind \norganised! "
            //                anchors.top: firstText.bottom
            //                anchors.topMargin: parent.height * 0.02
            //                anchors.left: parent.left
            //                anchors.leftMargin: parent.width * 0.06
            //                font.pixelSize:22 //parent.height * 0.04
            //                font.family: "poppinsThin"
            //            }
        }
        Item {
            id: secondPage
            Text{
                width: parent.width*0.35
                height: parent.height*0.2
                text:"Choose your \nlanguage:"
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font.family: "poppins_black"
                color: "black"
                anchors.left: parent.left
                anchors.leftMargin: parent.width * 0.15
                anchors.top: parent.top
                anchors.topMargin: parent.height*0.36
                font.pixelSize: parent.height * 0.07


            }
            Button{
                id:englishButton
                implicitWidth: 119
                implicitHeight: 51
                width:parent.width* 0.18
                height:parent.height*0.10
                anchors.left: parent.left
                anchors.leftMargin: parent.width*0.13
                anchors.top: parent.top
                anchors.topMargin: parent.height*0.63
                contentItem: Text{
                    text: "English"
                    font.pixelSize:englishButton.down?secondPage.height*0.035: secondPage.height*0.04
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    color: "white"
                }
                background: Rectangle{
                    radius: parent.width*0.2
                    color: parent.down?"#556ABA":"#7B90E3"
                    border.color: parent.down?"#FFFFFF":"#7077FF"
                    border.width: parent.down?3:1
                }
            }
            Button{
                id:russianButton
                implicitWidth: 119
                implicitHeight: 51
                width:englishButton.width
                height:englishButton.height
                anchors.left: englishButton.right
                anchors.leftMargin: parent.width*0.03
                anchors.verticalCenter: englishButton.verticalCenter

                contentItem: Text{
                    text: "Русский"
                    font.pixelSize:russianButton.down?secondPage.height*0.035: secondPage.height*0.04
                    horizontalAlignment:Text.AlignHCenter
                    verticalAlignment:Text.AlignVCenter
                    color: "white"
                }
                background: Rectangle{
                    radius: parent.width*0.2
                    color: parent.down?"#556ABA":"#7B90E3"
                    border.color: parent.down?"#FFFFFF":"#7077FF"
                    border.width: parent.down?3:1
                }
            }
            SVGImage{
                iconSource: "qrc:/resources/images/Web_SVG 1.svg"
                image.visible: true
                iconVisible: false
                anchors.bottom:parent.bottom
                anchors.bottomMargin: parent.height * 0.095
                anchors.right: parent.right
                anchors.rightMargin: parent.width * 0.1
                height: parent.height*0.47
                width: height*0.818
            }
        }
        Item {
            id: thirdPage
            Text {
                id:protectText
                text: "Do you want to \nprotect your data?"

                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font.family: "poppins_black"
                color: "black"
                anchors.left: parent.left
                anchors.leftMargin: parent.width * 0.11
                anchors.top: parent.top
                anchors.topMargin: parent.height*0.36
                font.pixelSize: parent.height * 0.07

            }
            Item {
                id: positioner
                anchors.top: parent.top
                anchors.topMargin: parent.height*0.63
                width:yesButton.width*2 + noButton.middleMargin
                height: yesButton.height
                anchors.horizontalCenter: protectText.horizontalCenter
                Button{
                    id:yesButton
                    implicitWidth: 87
                    implicitHeight: 51
                    anchors.left: parent.left
                    width:thirdPage.width* 0.135
                    height:thirdPage.height*0.10
                    contentItem: Text{
                        text: "YES"
                        font.pixelSize:yesButton.down?thirdPage.height*0.035: thirdPage.height*0.04
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        color: "white"
                    }
                    background: Rectangle{
                        radius: parent.width*0.29
                        color: parent.down?"#556ABA":"#7B90E3"
                        border.color: parent.down?"#FFFFFF":"#7077FF"
                        border.width: parent.down?3:1
                    }
                    onClicked: {
                        view.currentIndex++
                    }
                }
                Button{
                    property var  middleMargin: thirdPage.width*0.03
                    id:noButton
                    implicitWidth: 87
                    implicitHeight: 51
                    width:yesButton.width
                    height:yesButton.height
                    anchors.left: yesButton.right
                    anchors.leftMargin: middleMargin
                    anchors.verticalCenter: yesButton.verticalCenter
                    contentItem: Text{
                        text: "NO"
                        font.pixelSize:noButton.down?thirdPage.height*0.035: thirdPage.height*0.04
                        horizontalAlignment:Text.AlignHCenter
                        verticalAlignment:Text.AlignVCenter
                        color: "white"
                    }
                    background: Rectangle{
                        radius: parent.width*0.29
                        color: parent.down?"#556ABA":"#7B90E3"
                        border.color: parent.down?"#FFFFFF":"#7077FF"
                        border.width: parent.down?3:1
                    }
                    onClicked: {
                        view.currentIndex+=2
                    }
                }
            }
            SVGImage{
                iconSource: "qrc:/resources/images/protection.svg"
                image.visible: true
                iconVisible: false
                anchors.bottom:parent.bottom
                anchors.bottomMargin: parent.height * 0.095
                anchors.right: parent.right
                anchors.rightMargin: parent.width * 0.07
                height: parent.height*0.39
                width: height*1.19
            }
        }
        Item {
            id: fourthPage
            Text {
                id:prePasswordText
                text: "Let's set a password!"
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font.family: "poppins_black"
                color: "black"
                anchors.left: parent.left
                anchors.leftMargin: parent.width * 0.14
                anchors.top: parent.top
                anchors.topMargin: parent.height*0.38
                font.pixelSize: parent.height * 0.07
            }
            Item{
                id:passwordRect
                width: password.width
                height: password.height

                anchors.horizontalCenter: prePasswordText.horizontalCenter
                anchors.top: prePasswordText.bottom
                anchors.topMargin: parent.height*0.075
                MouseArea{
                    anchors.fill: parent
                    onClicked: password.forceActiveFocus()
                    cursorShape: Qt.IBeamCursor
                }
                TextField{
                    id:password
                    width: fourthPage.width*0.36
                    height: fourthPage.height*0.10
                    selectByMouse: true
                    anchors.centerIn: parent
                    echoMode: "Password"
                    font.pixelSize: fourthPage.height*0.035
                    color: "black"
                    horizontalAlignment: Text.AlignHCenter
                    placeholderText: "Password"
                    focus: true
                    background:
                        Rectangle {
                        color: "white"
                        border.color: "#7B90E3"
                        border.width: 2
                        radius: password.width*0.11
                    }
                    //                    onEnterPressed{
                    //                       // accept password ; next page
                    //                    }
                }
            }
            Button{
                id:confirmButton
                contentItem: Text {
                    text: "GO"
                    font.family: "poppins_black"
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    font.pixelSize: fourthPage.height*0.027
                    color:"#FFFFFF"
                }

                width: fourthPage.width*0.09
                height: fourthPage.height*0.05
                anchors.top: passwordRect.bottom
                anchors.horizontalCenter: passwordRect.horizontalCenter
                anchors.topMargin: fourthPage.height*0.039

                background: Rectangle{
                    radius: 26
                    border.color:confirmButton.down?"#FFFFFF":"#7077FF"

                    border.width: 1
                    color:confirmButton.down?"#556ABA":"#7B90E3"
                }
                onClicked: {
                    //if textField is not empty
                    view.currentIndex++
                    //save this password
                }
            }
            SVGImage{
                iconSource: "qrc:/resources/images/computerImage.svg"
                image.visible: true
                iconVisible: false
                anchors.bottom:parent.bottom
                anchors.bottomMargin: parent.height * 0.13
                anchors.right: parent.right
                anchors.rightMargin: parent.width * 0.11
                height: parent.height*0.38
                width: height*1.05
            }
        }
        Item{
            id:fifthPage
            Text {
                id: letsStartText
                text: "Let’s start!"

                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font.family: "poppins_black"
                color: "black"
                anchors.left: parent.left
                anchors.leftMargin: parent.width * 0.11
                anchors.top: parent.top
                anchors.topMargin: parent.height*0.38
                font.pixelSize: parent.height * 0.1
            }
            Button{
                id:beginButton

                width:parent.width*0.18
                height:parent.height*0.10
                anchors.top: letsStartText.bottom
                anchors.topMargin: parent.height*0.06
                anchors.horizontalCenter: letsStartText.horizontalCenter

                contentItem: Text{
                    text: "BEGIN"
                    font.pixelSize:beginButton.down?fifthPage.height*0.035: fifthPage.height*0.04
                    horizontalAlignment:Text.AlignHCenter
                    verticalAlignment:Text.AlignVCenter
                    color: "white"
                }
                background: Rectangle{
                    radius: parent.width*0.29
                    color: parent.down?"#556ABA":"#7B90E3"
                    border.color: parent.down?"#FFFFFF":"#7077FF"
                    border.width: parent.down?3:1
                }
                onClicked: {
                    firstEnterWindow.state="hidden";
                    passwordWindow.locked=false;
                    mainWindowItem.visible=true;
                    passwordWindow.visible=false;
                    visibilityOffTimer.start();
                    topLeftOffScreenAnim.start();
                    offScreenDelay.start();
                }
            }
            SVGImage{
                iconSource: "qrc:/resources/images/letsStartImage.svg"
                image.visible: true
                iconVisible: false
                anchors.bottom:parent.bottom
                anchors.bottomMargin: parent.height * 0.11
                anchors.right: parent.right
                anchors.rightMargin: parent.width * 0.12
                height: parent.height*0.38
                width: height*1.16
            }
        }
    }


    PageIndicator {
        id: indicator

        count: view.count
        currentIndex: view.currentIndex

        anchors.bottom: view.bottom
        anchors.horizontalCenter: parent.horizontalCenter
    }
    Timer{
        id:visibilityOffTimer
        interval: 1000;
        onTriggered:{
           qSettings.isFirstEnter=false;
        }
    }
    PropertyAnimation {
        id:topLeftOffScreenAnim
        target: backgroundTopLeft
        property: "y"

        easing.type: Easing.InOutExpo

        to: - (window.height * 0.5)
        duration: 1000
    }
    PropertyAnimation {
        id:topRightOffScreenAnim
        target: backgroundTopRight
        property: "y"

        easing.type: Easing.InOutExpo

        to: - (window.height * 0.5)
        duration: 800
    }
    Timer{
        id:offScreenDelay
        interval: 200;
        onTriggered:{
           topRightOffScreenAnim.start();
        }
    }

}
