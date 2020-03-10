import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import Diary 1.0
import "funclist.js" as F


ColumnLayout {
    id:column
    property alias currentIndex: listw.currentIndex
    property alias model: myModel
    property alias sortModel: sortModel

    //for delegate

    property color m_bottomSeparatorColor //: "#6d84de"
    property color m_fillDelegateColor //: "white"
 //   property color m_innerChadowColor //: "black"
    property color m_titleTextColor // : "#404040"
    property color m_dateTextColor //: "black"
    property color m_enteredColor //: "#bbc7f4"
    property color m_pressedColor //: "#93a6ee"
    property color m_modelDateTextRealized //: "#00135F"
    property color m_modelTitleTextRealized
    property color m_textColor
 //   property color m_delegateRealized


    Layout.fillWidth: true
    Layout.fillHeight: true

    signal choosen()
    signal changeIndex();


    ListView {
        id: listw
        Layout.fillWidth: true
        Layout.fillHeight: true
        clip: true
        focus:true


        DiaryModel
        {
            id:myModel
            list: diaryList
        }

        model: SortFilterProxyModel
        {
            id:sortModel
            sourceModel:myModel
            filterRole:DiaryModel.TitleRole
        }

        Component.onCompleted: {
            currentIndex = -1

            column.choosen.connect(F.updateWindowInformation)

            column.changeIndex.connect(F.updateModelInformation);

            column.changeIndex.connect(F.focusOff)
        }

        delegate: DELEGATE {
            Component.onCompleted: {
                console.log("delegate completed")
                //console.log("fillDelegateColor expected: "+"white")
                //console.log("fillDelegateColor received: "+fillDelegateColor.toString()+"\n")
                console.log("pressedColor expected: "+"#FFC0C0")
                console.log("fillDelegateColor received: "+pressedColor.toString()+"\n")
                console.log("bottomSeparatorColor expected: "+"#ffa8a8".toString())
                console.log("bottomSeparatorColor received: "+bottomSeparatorColor.toString()+"\n")

            }

            bottomSeparatorColor : m_bottomSeparatorColor //: "#6d84de"
            fillDelegateColor : m_fillDelegateColor //: "white"
         //   innerChadowColor : m_innerChadowColor//: "black"
            titleTextColor :m_titleTextColor// : "#404040"
            dateTextColor : m_dateTextColor //: "black"
            enteredColor : m_enteredColor //: "#bbc7f4"
            pressedColor : m_pressedColor//: "#93a6ee"
            modelDateTextRealized : m_modelDateTextRealized//: "#00135F"
            modelTitleTextRealized :m_modelTitleTextRealized
            //delegateRealized :  m_delegateRealized
            width: parent.width
            height: 50

            mouseArea.onClicked: {
                if(index == currentIndex) {return}
                changeIndex() // emit signal
                currentIndex = index
                choosen(); // emit signal
                // при клике на обьект списка мы сразу переключаем index,
                // но currentIndex нужно переключать в ручную
            }

            date: model.Date
            title: {
                if(model.Title.length>=16)
                    return model.Title.substring(0,13)+'...'
                return model.Title
            }

            current: index == currentIndex ? true : false
        }
    }
}




/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
