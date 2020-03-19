import QtQuick 2.0
import QtQuick.Controls 2.12
Item {
    id:background
    SVGImage {
        id: backgroundTopLeft
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
                text: "Welcome to My Diary!"
                color: "black"
                anchors.left: parent.left
                anchors.leftMargin: parent.width * 0.06
                anchors.top: parent.top
                anchors.topMargin: parent.height*0.36
                font.pixelSize: parent.height * 0.06
            }
        }
        Item {
            id: secondPage
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
