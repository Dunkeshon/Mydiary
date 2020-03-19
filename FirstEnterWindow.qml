import QtQuick 2.0
import QtQuick.Controls 2.12
Item {
    id:background
    SVGImage {
        id: backgroundTopLeft
        anchors.verticalCenterOffset: -20
        anchors.verticalCenter: parent.verticalCenter
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
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: -20
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
        }
    }

    PageIndicator {
        id: indicator

        count: view.count
        currentIndex: view.currentIndex

        anchors.bottom: view.bottom
        anchors.horizontalCenter: parent.horizontalCenter
    }

}
