
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
        userinput.textSelectionColor = "#b8c5fd"
        userinput.imageColor = "#A5A4A5"
        userinput.pannelColor = "#6d84de"
        userinput.enteredButtonColor = "#777777"
        userinput.pressedButtonColor = "black"
        userinput.textColor="#4d4d4d"
        userinput.textPlaceholderColor="#B7BACA"
        userinput.infoToolBackgroundColor="#A7B9FF"
        userinput.infoToolTipTextColor="#FFFFFF"
        userinput.infoToolBorderColor="#90AFFD"
        userinput.buttonsToolTipBordersColor  = "#3D54B1"
        userinput.buttonsToolTipTextColor = "#3D54B1"
        //TopPannel
        topPannel.panelColor = "#6d84de"
        topPannel.image_pressedColor = "#4c69d7"
        topPannel.image_enteredColor = "#dddddd"
        topPannel.imageColor = "#FFFFFF"
        topPannel.search_themeColor =  "#617adb"
        topPannel.search_textFieldColor = "white"
        topPannel.search_textSelectionColor = "#3399FF"
        topPannel.buttonsToolTipBordersColor  = "#3D54B1"
        topPannel.buttonsToolTipTextColor = "#3D54B1"
        //passwordWindow
        passwordWindow.buttonBackgroundColor = "#7B90E3"
        passwordWindow.buttonHoveredColor="#C4D0FF"
        passwordWindow.buttonPressedColor="#556ABA"
        passwordWindow.buttonTextHoveredColor="#364996"
        passwordWindow.buttonTextPressedColor="#FFFFFF"
        passwordWindow.buttonBorderColor = "#7077FF"
        passwordWindow.buttonBorderPresedColor="#FFFFFF"
        passwordWindow.buttonBorderHoveredColor="#364996"
        passwordWindow.buttonTextColor = "#FFFFFF"
        passwordWindow.passwordRectBorderColor = "#7B90E3"
        passwordWindow.lockOverlayColor = "#364996"
        passwordWindow.backgroundColor = "#f4f5f8"
        passwordWindow.backgroundTopRightColor="#3454d1"
        passwordWindow.backgroundTopLeftColor="#4764d8"
        passwordWindow.backgroundBottomLeftColor="#3454d1"
        passwordWindow.backgroundBottomRightColor="#4764d8"

        // changePasswordWindow
        changePasswordWindow.passwordRectBorderColor = "#7B90E3"
        changePasswordWindow.buttonTextPressedColor = "#FFFFFF"
        changePasswordWindow.buttonTextColor= "#FFFFFF"
        changePasswordWindow.buttonBorderPresedColor= "#FFFFFF"
        changePasswordWindow.buttonBorderColor = "#7077FF"
        changePasswordWindow.buttonPressedColor = "#556ABA"
        changePasswordWindow.buttonBackgroundColor = "#7B90E3"
                break;
    case Themes.ROSE_THEME:
        mainColorBackground = "white"
        startRect.children.enterTextTipColor= "#aaaaaa"
        verticalSeparator.separatorColor= "#ffa8a8"
        //DELEGATE
        notesList.m_fillDelegateColor="white"
        notesList.m_bottomSeparatorColor= "#ffa8a8"
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
        userinput.themeColor ="#fff7f7"
        userinput.textSelectionColor = "#ffb4b4"
        userinput.imageColor = "#b08686"
        userinput.pannelColor = "#FFB6B6"
        userinput.enteredButtonColor = "#955e5e"
        userinput.pressedButtonColor = "#7b3636"
        userinput.textColor="#703131"
        userinput.textPlaceholderColor="#CDA5A5"
        userinput.infoToolBackgroundColor="#FFB6B6"
        userinput.infoToolTipTextColor="#FFFFFF"
        userinput.infoToolBorderColor="#e5d7d7"
        userinput.buttonsToolTipBordersColor  = "#915C5C"
        userinput.buttonsToolTipTextColor = "#905C5C"
        //TopPannel
        topPannel.panelColor = "#FFB6B6"
        topPannel.image_pressedColor = "#FF9595"
        topPannel.image_enteredColor = "#FFE3E3"
        topPannel.imageColor = "#FFFFFF"
        topPannel.search_themeColor =  "#FF9595"
        topPannel.search_textFieldColor = "white"
        topPannel.search_textSelectionColor = "#3399FF"
        topPannel.buttonsToolTipBordersColor  = "#915C5C"
        topPannel.buttonsToolTipTextColor = "#905C5C"
        //passwordWindow
        passwordWindow.buttonBackgroundColor = "#FFC2C4"
        passwordWindow.buttonHoveredColor="#FFE4E5"
        passwordWindow.buttonPressedColor="#C86567"

        passwordWindow.buttonTextColor = "#C57275"
        passwordWindow.buttonTextHoveredColor="#9F3438"
        passwordWindow.buttonTextPressedColor="#FFFFFF"

        passwordWindow.buttonBorderColor = "#C16D70"
        passwordWindow.buttonBorderPresedColor="#FFFFFF"
        passwordWindow.buttonBorderHoveredColor="#9F3438"
        passwordWindow.passwordRectBorderColor = "#F9AAAB"
        passwordWindow.lockOverlayColor = "#FE8D8D"
        passwordWindow.backgroundColor = "#FFF7F7"
        passwordWindow.backgroundTopRightColor="#ffb6b6"
        passwordWindow.backgroundTopLeftColor="#ffb6b6"
        passwordWindow.backgroundBottomLeftColor="#fbcbcc"
        passwordWindow.backgroundBottomRightColor="#fcc4c5"

        // changePasswordWindow TO DO
        changePasswordWindow.passwordRectBorderColor = "#7B90E3"
        changePasswordWindow.buttonTextPressedColor = "#FFFFFF"
        changePasswordWindow.buttonTextColor= "#FFFFFF"
        changePasswordWindow.buttonBorderPresedColor= "#FFFFFF"
        changePasswordWindow.buttonBorderColor = "#7077FF"
        changePasswordWindow.buttonPressedColor = "#556ABA"
        changePasswordWindow.buttonBackgroundColor = "#7B90E3"
        break;
    case Themes.YELLOW_THEME:
        mainColorBackground = "white"
        startRect.children.enterTextTipColor= "#F3CB9B"
        verticalSeparator.separatorColor= "#F3CB9B"
        notesList.m_fillDelegateColor="white"
        notesList.m_bottomSeparatorColor="#F3CB9B"
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
        userinput.textSelectionColor = "#d6b994"
        userinput.imageColor = "#b8a58e"
        userinput.pannelColor = "#F3CB9B"
        userinput.enteredButtonColor = "#aa9277"
        userinput.pressedButtonColor = "#8d6e49"
        userinput.textColor="#714A1C"
        userinput.textPlaceholderColor="#D2B99B"
        userinput.infoToolBackgroundColor="#F3CB9B"
        userinput.infoToolTipTextColor="#FFFFFF"
        userinput.infoToolBorderColor = "#CEA779"
        userinput.buttonsToolTipBordersColor  = "#714A1C"
        userinput.buttonsToolTipTextColor = "#714A1C"

        //TopPannel
        topPannel.panelColor = "#F3CB9B"
        topPannel.image_pressedColor = "#E6BC8A"
        topPannel.image_enteredColor = "#F9E6CE"
        topPannel.imageColor = "#FFFFFF"
        topPannel.search_themeColor = "#E3BA89"
        topPannel.search_textFieldColor = "white"
        topPannel.search_textSelectionColor = "#3399FF"
        topPannel.buttonsToolTipBordersColor  = "#714A1C"
        topPannel.buttonsToolTipTextColor = "#714A1C"

        //passwordWindow

        passwordWindow.buttonBackgroundColor = "#D6A76F"

        passwordWindow.buttonHoveredColor="#F0CEA6"
        passwordWindow.buttonPressedColor="#885517"
        passwordWindow.buttonTextHoveredColor="#765835"
        passwordWindow.buttonTextPressedColor="#FFFFFF"

        passwordWindow.buttonBorderPresedColor="#FFFFFF"
        passwordWindow.buttonBorderHoveredColor="#765835"
        passwordWindow.buttonBorderColor = "#976D3B"
        passwordWindow.buttonTextColor = "white"
        passwordWindow.passwordRectBorderColor = "#D6A76F"
        passwordWindow.lockOverlayColor = "#D6A76F"
        passwordWindow.backgroundColor = "#FDF5EB"
        passwordWindow.backgroundTopRightColor="#f3cb9b"
        passwordWindow.backgroundTopLeftColor="#f3cb9b"
        passwordWindow.backgroundBottomLeftColor="#f6d7b1"
        passwordWindow.backgroundBottomRightColor="#f6d7b1"

        // changePasswordWindow TO DO
        changePasswordWindow.passwordRectBorderColor = "#7B90E3"
        changePasswordWindow.buttonTextPressedColor = "#FFFFFF"
        changePasswordWindow.buttonTextColor= "#FFFFFF"
        changePasswordWindow.buttonBorderPresedColor= "#FFFFFF"
        changePasswordWindow.buttonBorderColor = "#7077FF"
        changePasswordWindow.buttonPressedColor = "#556ABA"
        changePasswordWindow.buttonBackgroundColor = "#7B90E3"

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
        userinput.textSelectionColor = "#dcdcdc"
        userinput.imageColor = "#FFFFFF"
        userinput.pannelColor = "#2D2D2D"
        userinput.enteredButtonColor = "#D6D6D6"
        userinput.pressedButtonColor = "#BABABA"
        userinput.textColor="white"
        userinput.textPlaceholderColor="#9c9494"
        userinput.infoToolBackgroundColor="#EBEBEB"
        userinput.infoToolTipTextColor="#000000"
        userinput.infoToolBorderColor = "#949494"
        userinput.buttonsToolTipBordersColor  = "#403F3F"
        userinput.buttonsToolTipTextColor = "#403F3F"
        //TopPannel
        topPannel.panelColor = "#2D2D2D"
        topPannel.image_pressedColor = "#555555"
        topPannel.image_enteredColor = "#BABABA"
        topPannel.imageColor = "#FFFFFF"
        topPannel.search_themeColor = "#515151"
        topPannel.search_textFieldColor = "white"
        topPannel.search_textSelectionColor = "#3399FF"
        topPannel.buttonsToolTipBordersColor  = "#403F3F"
        topPannel.buttonsToolTipTextColor = "#403F3F"
        //passwordWindow
        passwordWindow.buttonBackgroundColor = "#1C1C1C"
        passwordWindow.buttonHoveredColor="#BDBDBD"
        passwordWindow.buttonPressedColor="#FFFFFF"

        passwordWindow.buttonBorderColor = "white"
        passwordWindow.buttonBorderPresedColor="#000000"
        passwordWindow.buttonBorderHoveredColor="#727272"

        passwordWindow.buttonTextColor = "white"
        passwordWindow.buttonTextHoveredColor="#727272"
        passwordWindow.buttonTextPressedColor="#000000"
        passwordWindow.passwordRectBorderColor = "#B1B1B1"
        passwordWindow.lockOverlayColor = "white"
        passwordWindow.backgroundColor = "#373737"
        passwordWindow.backgroundTopRightColor="white"
        passwordWindow.backgroundTopLeftColor="white"
        passwordWindow.backgroundBottomLeftColor="white"
        passwordWindow.backgroundBottomRightColor="white"

        // changePasswordWindow TO DO
        changePasswordWindow.passwordRectBorderColor = "#7B90E3"
        changePasswordWindow.buttonTextPressedColor = "#FFFFFF"
        changePasswordWindow.buttonTextColor= "#FFFFFF"
        changePasswordWindow.buttonBorderPresedColor= "#FFFFFF"
        changePasswordWindow.buttonBorderColor = "#7077FF"
        changePasswordWindow.buttonPressedColor = "#556ABA"
        changePasswordWindow.buttonBackgroundColor = "#7B90E3"
        break;
    default: throw "Theme id out of range"


    }
    if(settingsSection.defaultButton.enabled === false){
        settingsSection.defaultButton.enabled = true
    }
    else if(settingsSection.roseButton.enabled === false){
        settingsSection.roseButton.enabled=true
    }
    else if(settingsSection.yellowButton.enabled === false){
        settingsSection.yellowButton.enabled = true
    }
    else{
        settingsSection.darkButton.enabled = true
    }


    switch(qSettings.colorTheme){
    case Themes.DEFAULT_THEME:
        settingsSection.defaultButton.enabled = false
        break
    case Themes.ROSE_THEME:
        settingsSection.roseButton.enabled = false
        break
    case Themes.YELLOW_THEME:
        settingsSection.yellowButton.enabled = false
        break
    case Themes.DARK_THEME:
        settingsSection.darkButton.enabled = false
        break
    default: throw "Theme id out of range"



    }
}

