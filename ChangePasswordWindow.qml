import QtQuick 2.0
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import "funclist.js" as F

Popup {
    property bool isChangingPassword:false
    property bool isRemoving:false
    property alias swipeView:view
    property var passwordRectBorderColor
    property var buttonTextPressedColor
    property var buttonTextColor
    property var buttonBorderPresedColor
    property var buttonBorderColor
    property var buttonPressedColor
    property var buttonBackgroundColor
    property var backgroundColor
    id: popup

    width: 400
    height: 250
    modal: true
    focus: true
    background: Rectangle{
        color: backgroundColor
    }

    closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutside

        SwipeView {
        id: view
        interactive: false
        currentIndex: 0
        anchors.fill: parent
        Item {
            id: oldPasswordPage
            visible: view.currentIndex==0?true:false
            Text {
                id: desciptionOldText
                text: qSettings.isEnglish ? "Enter сurrent password" : "Введите текущий пароль"
                anchors.bottom: passwordOldRect.top
                anchors.bottomMargin: 20
                anchors.horizontalCenter:passwordOldRect.horizontalCenter
                font.family: "poppins_black"
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: 28
            }
            Item{
                id:passwordOldRect
                property alias  passText : passwordOld.text
                width: 230
                height: 52
                anchors.centerIn: parent
                MouseArea{
                    anchors.fill: parent
                    onClicked: passwordOld.forceActiveFocus()
                    cursorShape: Qt.IBeamCursor
                }
                TextField{
                    id:passwordOld
                    width: 230
                    height: 52
                    selectByMouse: true
                    anchors.centerIn: parent
                    echoMode: "Password"
                    font.pixelSize: 18
                    color: "black"
                    horizontalAlignment: Text.AlignHCenter
                    placeholderText: qSettings.isEnglish?"Current password": "Текущий пароль"
                    focus: true
                    background:
                        Rectangle {
                        color: "white"
                        border.color: passwordRectBorderColor
                        border.width: 2
                        radius: 26
                    }
                    //validate password
                    Keys.onEnterPressed: {
                        F.validateOldPassword()
                        passwordOld.text=""
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
                        color : confirmButton.down ? buttonTextPressedColor : buttonTextColor

                    }

                    //validate password
                    onClicked:{
                        F.validateOldPassword()
                        passwordOldRect.passText=""
                    }
                    width: 70
                    height: 35
                    anchors.top: passwordOldRect.bottom
                    anchors.horizontalCenter: passwordOldRect.horizontalCenter
                    anchors.topMargin: 20

                    background: Rectangle{
                        radius: 26
                        border.color: confirmButton.down ? buttonBorderPresedColor : buttonBorderColor
                        border.width: 1
                        color : confirmButton.down ? buttonPressedColor: buttonBackgroundColor
                    }
                }
            }
        }
        Item {
            id: newPasswordPage
            visible: view.currentIndex==1?true:false
            Text {
                id: desciptionText
                text: qSettings.isEnglish ? "Enter new password" : "Введите новый пароль"
                anchors.bottom: passwordRect.top
                anchors.horizontalCenter:passwordRect.horizontalCenter
                anchors.bottomMargin: 20
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font.family: "poppins_black"
                font.pixelSize: 28
            }
            Item{
                id:passwordRect
                property alias  passText : password.text
                width: 230
                height: 52
                anchors.centerIn: parent
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
                    placeholderText: qSettings.isEnglish?"New password": "Новый пароль"
                    focus: true
                    background:
                        Rectangle {
                        color: "white"
                        border.color: passwordRectBorderColor
                        border.width: 2
                        radius: 26
                    }
                    Keys.onEnterPressed: {
                        if(password.text!==""){
                            qSettings.myPassword = password.text
                            password.text=""
                            F.whatToDoWithNewPassword();
                        }
                    }
                }
                Button{
                    z:3
                    id:confirmButtonNew
                    contentItem: Text {
                        text:qSettings.isEnglish?"GO":"Вперед"
                        font.family: "poppins_black"
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        font.pixelSize: 17
                        color : confirmButtonNew.down ? buttonTextPressedColor : buttonTextColor
                    }

                    //save password
                    onClicked: {
                        if(passwordRect.passText!==""){
                            qSettings.myPassword = passwordRect.passText
                            passwordRect.passText=""
                            F.whatToDoWithNewPassword();
                        }
                    }
                    width: 70
                    height: 35
                    anchors.top: passwordRect.bottom
                    anchors.horizontalCenter: passwordRect.horizontalCenter
                    anchors.topMargin: 20

                    background: Rectangle{
                        radius: 26
                        border.color: confirmButtonNew.down ? buttonBorderPresedColor : buttonBorderColor
                        border.width: 1
                        color : confirmButtonNew.down ? buttonPressedColor: buttonBackgroundColor
                    }
                }
            }
        }
    }
}

