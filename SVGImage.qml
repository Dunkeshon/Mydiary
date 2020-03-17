import QtQuick 2.0
import QtQuick.Window 2.12
import QtGraphicalEffects 1.0

Item {
    id: item
    property alias iconSource: image.source
    property var iconMargins: 0
    property color iconColor: "white"
    property alias iconVisible: imageOverlay.visible

    Image {
        id: image
        anchors.fill: parent
        anchors.margins: iconMargins
        visible: false // we transform overlay, not an image
        sourceSize.width: width*Screen.devicePixelRatio
        sourceSize.height: height*Screen.devicePixelRatio
    }

    ColorOverlay {
        id: imageOverlay
        anchors.fill: image
        source: image
        color: iconColor
    }
}
