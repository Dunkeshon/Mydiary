import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import Diary 1.0
import "funclist.js" as F


Item {
    id:column
    property alias currentIndex: listw.currentIndex
    property alias model: myModel
    property alias sortModel: sortModel

    //Themes
    //for delegate each m_... property correspond its own ... property in delegate
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

    signal choosen()
    signal changeIndex();


    ListView {
        id: listw
        anchors.fill: parent
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
            bottomSeparatorColor : m_bottomSeparatorColor
            fillDelegateColor : m_fillDelegateColor
            //   innerChadowColor : m_innerChadowColor//: "black"
            titleTextColor :m_titleTextColor
            dateTextColor : m_dateTextColor
            enteredColor : m_enteredColor
            pressedColor : m_pressedColor
            modelDateTextRealized : m_modelDateTextRealized
            modelTitleTextRealized :m_modelTitleTextRealized
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
                if(model.Title.length>=16 && notesList.state != "Large")
                    return model.Title.substring(0,13)+'...'
                return model.Title
            }
            favorite: model.Favorite
            current: index == currentIndex? true : false
        }
    }

    states: [
        State {
            name: "Hidden"
            when: hideAllDelegates
            PropertyChanges {
                target: leftColumn
                x: -width - 1
                visible:false
            }
        },
        State {
            name: "Large"
            when: (notesList.currentIndex == -1 && topPannel.searchfield.state == "Active")
            PropertyChanges {
                target: leftColumn
                width: 400
            }
        }]

    transitions: [
        Transition {
            from: ""
            to: "Hidden"
            PropertyAnimation {
                easing.type: Easing.InOutQuad
                properties: "x, visible"
                duration: 450
            }

        },
        Transition {
            from: "Hidden"
            to: ""
            PropertyAnimation {
                easing.type: Easing.InOutQuad
                properties: "x"
                duration: 450
            }
        },
        Transition {
            from: ""
            to: "Large"
            PropertyAnimation {
                easing.type: Easing.InOutQuad
                properties: "x, width"
                duration: 450
            }
        },
        Transition {
            from: "Large"
            to: ""
            PropertyAnimation {
                easing.type: Easing.InOutQuad
                properties: "x, width"
                duration: 450
            }
        },
        Transition {
            from: "Large"
            to: "Hidden"
            PropertyAnimation {
                easing.type: Easing.InOutQuad
                properties: "x, width, visible"
                duration: 450
            }
        },
        Transition {
            from: "Hidden"
            to: "Large"
            PropertyAnimation {
                easing.type: Easing.InOutQuad
                properties: "x, width"
                duration: 450
            }
        }]
}




/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
