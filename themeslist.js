
function changeTheme(colorTheme){
    switch(colorTheme){
    case Themes.DEFAULT_THEME:
        // main
        mainColorBackground = "white"
        startRect.children.enterTextTipColor= "#aaaaaa"
        verticalSeparator.separatorColor= "#6d84de"
        //DELEGATE
        notesList.m_fillDelegateColor="white"
        notesList.m_bottomSeparatorColor="#6d84de"
        //    notesList.m_innerChadowColor=Qt.rgba(0, 0, 0, 0.44)
        notesList.m_dateTextColor="#666666"
        notesList.m_titleTextColor="#666666"
        notesList.m_enteredColor="#bbc7f4"
        notesList.m_pressedColor="#93a6ee"
        notesList.m_modelTitleTextRealized="#00135F"
        notesList.m_modelDateTextRealized="#00135F"

        //SearchField

        //SettingsWindow
        settingsSection.themeColor = "#6d84de"
        settingsSection.defaultSelect = "white"
        settingsSection.roseSelect = "#FFB6B6"
        settingsSection.yellowSelect = "#FFD749"
        settingsSection.darkSelect = "#000000"

        //TextINputWindow
        userinput.themeColor = "#f4f5f8"
        userinput.textSelectionColor = "#3399FF"
        userinput.imageColor = "#A5A4A5"
        userinput.enteredButtonColor = "#777777"
        userinput.pressedButtonColor = "black"
        userinput.textColor="#4d4d4d"
        userinput.infoToolBackgroundColor="#A7B9FF"
        userinput.infoToolTipTextColor="#FFFFFF"
        userinput.infoToolBorderColor="#90AFFD"

        //TopPannel
        topPannel.panelColor = "#6d84de"
        topPannel.image_pressedColor = "#4c69d7"
        topPannel.image_enteredColor = "#dddddd"
        topPannel.imageColor = "#FFFFFF"
        topPannel.search_themeColor =  "#617adb"
        topPannel.search_textFieldColor = "white"
        topPannel.search_placeholderTextColor = "#f5f5f5"
        topPannel.search_textSelectionColor = "#3399FF"
        //deletingDialog
        deletingDialog.mainRectColor= "#A7B9FF"
        deletingDialog.mainBorderColor= "#6D84DE"
        deletingDialog.buttonTextColor= "#182763"
        deletingDialog.textColor= "white"
        deletingDialog.imageOverlayColor= "white"
        deletingDialog.buttonBorderColor= "#6D84DE"


        break;
    case Themes.ROSE_THEME:
        mainColorBackground = "white"
        startRect.children.enterTextTipColor= "#aaaaaa"
        verticalSeparator.separatorColor= "#ffa8a8"
        //DELEGATE
        notesList.m_fillDelegateColor="white"
        notesList.m_bottomSeparatorColor= "#ffa8a8"
        //   notesList.m_innerChadowColor= "#b08686"
        notesList.m_dateTextColor="#a37272"
        notesList.m_titleTextColor="#a37272"
        notesList.m_enteredColor="#FFE0E0"
        notesList.m_pressedColor="#FFC0C0"
        notesList.m_modelTitleTextRealized="#a37272"
        notesList.m_modelDateTextRealized="#a37272"
        //SettingsWindow
        settingsSection.themeColor="#FFB0B0"
        settingsSection.defaultSelect="#7187df"
        settingsSection.roseSelect= "#FFFFFF"
        settingsSection.yellowSelect= "#FFDFB9"
        settingsSection.darkSelect= "#000000"
        //TextINputWindow
        userinput.themeColor = "#fff7f7"
        userinput.textSelectionColor = "#3399FF"
        userinput.imageColor = "#b08686"
        userinput.enteredButtonColor = "#955e5e"
        userinput.pressedButtonColor = "#7b3636"
        userinput.textColor="#703131"
        userinput.infoToolBackgroundColor="#FFB6B6"
        userinput.infoToolTipTextColor="#FFFFFF"
        userinput.infoToolBorderColor="#e5d7d7"
        //TopPannel
        topPannel.panelColor = "#FFB6B6"
        topPannel.image_pressedColor = "#FF9595"
        topPannel.image_enteredColor = "#FFE3E3"
        topPannel.imageColor = "#FFFFFF"
        topPannel.search_themeColor =  "#FF9595"
        topPannel.search_textFieldColor = "white"
        topPannel.search_placeholderTextColor = "#f5f5f5"
        topPannel.search_textSelectionColor = "#3399FF"

        //deletingDialog
        deletingDialog.mainRectColor= "#FFB6B6"
        deletingDialog.mainBorderColor= "#CC8888"
        deletingDialog.buttonTextColor= "#703131"
        deletingDialog.textColor= "white"
        deletingDialog.imageOverlayColor= "white"
        deletingDialog.buttonBorderColor= "#CC8888"
        break;
    case Themes.YELLOW_THEME:
        mainColorBackground = "white"
        startRect.children.enterTextTipColor= "#F3CB9B"
        verticalSeparator.separatorColor= "#F3CB9B"
        notesList.m_fillDelegateColor="white"
        notesList.m_bottomSeparatorColor="#F3CB9B"
        //  notesList.m_innerChadowColor=
        notesList.m_dateTextColor="#b69d80"
        notesList.m_titleTextColor="#714A1C"
        notesList.m_enteredColor="#f9e5cd"
        notesList.m_pressedColor="#f5d5af"
        notesList.m_modelTitleTextRealized= "#5F401C"
        notesList.m_modelDateTextRealized= "#62421E"
        //SettingsWindow
        settingsSection.themeColor="#F3CB9B"
        settingsSection.defaultSelect="#7187df"
        settingsSection.roseSelect= "#FD7676"
        settingsSection.yellowSelect= "#FFFFFF"
        settingsSection.darkSelect= "#000000"
        //TextINputWindow
        userinput.themeColor = "#fdf5eb"
        userinput.textSelectionColor = "#3399FF"
        userinput.imageColor = "#b8a58e"
        userinput.enteredButtonColor = "#aa9277"
        userinput.pressedButtonColor = "#8d6e49"
        userinput.textColor="#714A1C"
        userinput.infoToolBackgroundColor="#F3CB9B"
        userinput.infoToolTipTextColor="#FFFFFF"
        userinput.infoToolBorderColor = "#CEA779"

        //TopPannel
        topPannel.panelColor = "#F3CB9B"
        topPannel.image_pressedColor = "#E6BC8A"
        topPannel.image_enteredColor = "#F9E6CE"
        topPannel.imageColor = "#FFFFFF"
        topPannel.search_themeColor = "#E3BA89"
        topPannel.search_textFieldColor = "white"
        topPannel.search_placeholderTextColor = "#f5f5f5"
        topPannel.search_textSelectionColor = "#3399FF"

        //deletingDialog
        deletingDialog.mainRectColor= "#EDC697"
        deletingDialog.mainBorderColor= "#FFFFFF"
        deletingDialog.buttonTextColor= "#714A1C"
        deletingDialog.textColor= "#714A1C"
        deletingDialog.imageOverlayColor= "#714A1C"
        deletingDialog.buttonBorderColor= "#714A1C"

        break;

    case Themes.DARK_THEME:
        mainColorBackground = "#2B2B2B"
        startRect.children.enterTextTipColor= "#FFFFFF"
        verticalSeparator.separatorColor= "#FFFFFF"
        notesList.m_fillDelegateColor="#505050"
        notesList.m_bottomSeparatorColor="white"
        // notesList.m_innerChadowColor=Qt.rgba(0, 0, 0, 0.72)
        notesList.m_dateTextColor="white"
        notesList.m_titleTextColor="#FFFFFF"
        notesList.m_enteredColor="#828282"
        notesList.m_pressedColor="#D8D8D8"
        notesList.m_modelTitleTextRealized="black"
        notesList.m_modelDateTextRealized="black"
        //SettingsWindow
        settingsSection.themeColor="#2B2B2B"
        settingsSection.defaultSelect="#7187df"
        settingsSection.roseSelect= "#FFB0B0"
        settingsSection.yellowSelect= "#F3CB9B"
        settingsSection.darkSelect= "#FFFFFF"
        //TextINputWindow
        userinput.themeColor = "#404040"
        userinput.textSelectionColor = "#3399FF"
        userinput.imageColor = "#FFFFFF"
        userinput.enteredButtonColor = "#D6D6D6"
        userinput.pressedButtonColor = "#BABABA"
        userinput.textColor="white"
        userinput.infoToolBackgroundColor="#EBEBEB"
        userinput.infoToolTipTextColor="#000000"
        userinput.infoToolBorderColor = "#949494"
        //TopPannel
        topPannel.panelColor = "#2D2D2D"
        topPannel.image_pressedColor = "#555555"
        topPannel.image_enteredColor = "#BABABA"
        topPannel.imageColor = "#FFFFFF"
        topPannel.search_themeColor = "#515151"
        topPannel.search_textFieldColor = "white"
        topPannel.search_placeholderTextColor = "#f5f5f5"
        topPannel.search_textSelectionColor = "#3399FF"

        //deletingDialog
        deletingDialog.mainRectColor= "#DEDEDE"
        deletingDialog.mainBorderColor= "#FFFFFF"
        deletingDialog.buttonTextColor= "#303030"
        deletingDialog.textColor= "#303030"
        deletingDialog.imageOverlayColor= "#303030"
        deletingDialog.buttonBorderColor= "#808080"

        break;
    default: throw "Theme id out of range"


    }
}

