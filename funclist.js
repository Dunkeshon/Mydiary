
function updateWindowInformation() {

    if(!userinput.visible)
        userinput.visible = true;

    if(notesList.currentIndex === -1){
        userinput.visible = false;
        return
    }

    // а тут она по приколу)
    var sourceIndex = notesList.sortModel.mapToSource(notesList.sortModel.index(notesList.currentIndex, 0))
    userinput.dateInfo = notesList.model.data(sourceIndex, DiaryModel.DateRole)
    userinput.titletext.text = notesList.model.data(sourceIndex, DiaryModel.TitleRole)
    userinput.usertext.text = notesList.model.data(sourceIndex, DiaryModel.TextRole)
    userinput.editInfo = notesList.model.data(sourceIndex, DiaryModel.LastEditRole)
}

// don't change data if we don't change anything
// after committing changes sets the date of editing
function updateModelInformation() {

    if(notesList.currentIndex === -1)
        return

    //тут эта переменная нужна потому что иначе setFilterFixedString уберет или переставит индекс
    //когда мы изменим title во время поиска. И, соответственно, все что после функции которая меняет title,
    //сохранится неправильно.
    var sourceIndex = notesList.sortModel.mapToSource(notesList.sortModel.index(notesList.currentIndex, 0))

    if(notesList.model.setData(sourceIndex, qsTr(userinput.usertext.text), DiaryModel.TextRole))
        notesList.model.setData(sourceIndex, diaryList.currDate(), DiaryModel.LastEditRole)

    if(notesList.model.setData(sourceIndex, qsTr(userinput.titletext.text), DiaryModel.TitleRole))
        notesList.model.setData(sourceIndex, diaryList.currDate(), DiaryModel.LastEditRole)
}

function addButtonRealization() {
    if(topPannel.searchfield.text !== "")
        topPannel.searchfield.text = ""
    else
        updateModelInformation()

    topPannel.searchfield.state = ""
    diaryList.addItem()
    notesList.currentIndex = 0
    updateWindowInformation()
}

function arrowButtonRealization() {
    if(leftColumn.state === "")
        leftColumn.state = "Hidden"
    else
        leftColumn.state = ""
}

function deleteButtonRealization() {
    var temp = notesList.currentIndex
    diaryList.deleteItem(notesList.sortModel.mapToSource(notesList.sortModel.index(notesList.currentIndex, 0)))
    if(notesList.sortModel.rowCount() === notesList.currentIndex) {temp--}
    notesList.currentIndex = temp
    updateWindowInformation()

    if(notesList.currentIndex === -1) {
        topPannel.searchfield.text = ""
        topPannel.searchfield.state = ""
    }
}
//function deleteElementRealization(){
//    var temp = notesList.currentIndex
//    diaryList.deleteItem(notesList.sortModel.mapToSource(notesList.sortModel.index(notesList.currentIndex, 0)))
//    if(notesList.sortModel.rowCount() === notesList.currentIndex) {temp--}
//    notesList.currentIndex = temp
//    updateWindowInformation()

//    if(notesList.currentIndex === -1) {
//        topPannel.searchfield.text = ""
//        topPannel.searchfield.state = ""
//    }
//}

function changeFilter(searchText) {
    updateModelInformation()
    notesList.currentIndex = -1
    updateWindowInformation()
    notesList.sortModel.setFilterFixedString(searchText)
}

function focusOff() {
    userinput.titletext.focus = false
    userinput.usertext.focus = false
    topPannel.searchfield.textfocus = false
}

function acceptPassword(){
    if(myPassword==="12345"){
        locked=false
        password.state="reanchored"
        unlockedAnim.start()
        //  unlockedAnim.start()
        acceptedTimer.running=true
        // подпрыгивание
    }
    else{
        lockedAnim.start()
        //дерганье
    }
}
function settingsButtonRealization(){
    settingsSection.state = "Active"
    window.buttonsActive=false
}
