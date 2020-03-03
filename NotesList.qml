import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import Diary 1.0


ColumnLayout {
    id:column
    property alias currentIndex: listw.currentIndex
    property alias model: myModel
    property alias sortModel: sortModel

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

            column.choosen.connect(updateWindowInformation)

            column.changeIndex.connect(updateModelInformation);

            column.changeIndex.connect(focusOff)
        }

        delegate: DELEGATE {
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
                if(model.Title.length>=16){
                    return model.Title.substring(0,13)+'...'
                }
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
