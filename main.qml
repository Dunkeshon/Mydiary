import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

Window {
    visible: true
    visibility: Window.FullScreen
    width: 640
    height: 480
    title: qsTr("Hello World")
    DiaryList{
        width: 340
        height: 290
        anchors.verticalCenterOffset: 0
        anchors.horizontalCenterOffset: -131
        anchors.centerIn: parent
    }
}
