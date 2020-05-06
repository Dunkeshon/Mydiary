import QtQuick 2.0

Item {
    id: mainItem

    property color backgroundcolor
    property var content
    property alias source: titleImage.iconSource


    Rectangle{
        id: title
        color: backgroundcolor
        anchors.fill: parent

        SVGImage {
            id: titleImage
            width: parent.height/2
            height: width
            anchors.right: titleText.left
            anchors.rightMargin: 3
            anchors.top: parent.top
            anchors.topMargin: parent.height/4
            iconMargins: 3
        }
        Text{
            id: titleText
            anchors.centerIn: parent
            text: content
            font.family: "poppins_black"
            font.pixelSize:22
            color: "white"
        }
    }
}
