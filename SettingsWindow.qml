import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtGraphicalEffects 1.0

Item {


    MouseArea{
        id:emptyFocus
        anchors.left:parent.left
        anchors.top:parent.top
        anchors.bottom: parent.bottom
        width: parent.width-settingsArea.width
    }
    Rectangle{
        id:settingsArea
        width: 200
        color: "#6d84de"
        anchors.left: emptyFocus.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom

        Rectangle{
            id:themeTitle
            color: parent.color
            height: 80
            anchors.horizontalCenter: parent.horizontalCenter
            width: themeImage.width+ themeText.width

            anchors.margins: 5


            Rectangle{
                id:themeImage
                color: parent.color
                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter
                width: 40
                height: width
                Image {
                    id: themeIcon
                    anchors.fill: parent
                    anchors.margins: 3
                    source: "resources/images/themeIcon.svg"
                    visible: false
                }
                ColorOverlay {
                    id: themeColorOverlay
                    anchors.fill: themeIcon
                    source: themeIcon
                    transformOrigin: Item.Center
                    color: "white"
                }

            }
            Text{
                id:themeText
                anchors.margins: 5
                anchors.left: themeImage.right
                anchors.verticalCenter: parent.verticalCenter
                text: qsTr("Theme")
                font.family: "poppins_black"
                font.pixelSize:22
            }

        }
        Rectangle{
            id:themeSection
            anchors.top: themeTitle.bottom

            ThemeElement{
                id:defaultTheme
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.margins: 5
                themeName: "Default"
            }
            ThemeElement{
                id:roseTheme
                anchors.left: defaultTheme.right
                anchors.top: parent.top
                anchors.margins: 5
                themeName: "Rose"
                fontColor: "#FFB6B6"
                iconColor: "#FFB6B6"

            }
            ThemeElement{
                id:yellowTheme
                anchors.left: parent.left
                anchors.top: defaultTheme.bottom
                anchors.margins: 5
                themeName: "Yellow"
                fontColor: "#FFD749"
                iconColor: "#FFD749"


            }
            ThemeElement{
                id:darkTheme
                anchors.left: yellowTheme.right
                anchors.top: roseTheme.bottom
                anchors.margins: 5
                themeName: "Dark"
                fontColor: "#000000"
                iconColor: "#000000"

            }
        }



    }



}
