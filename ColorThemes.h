#ifndef COLORTHEMES_H
#define COLORTHEMES_H
#include <QObject>
class ColorThemes:public QObject{
    Q_GADGET
public:
    enum Themes{
        DEFAULT_THEME,
        ROSE_THEME,
        YELLOW_THEME,
        DARK_THEME
    };
    Q_ENUM(Themes)


};

#endif // COLORTHEMES_H
