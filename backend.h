#ifndef BACKEND_H
#define BACKEND_H

#include <QObject>
#include <QVector>
#include <QString>
#include <random>
#include <cstdlib>
#include <QUrl>

class BackEnd: public QObject
{
    Q_OBJECT
private:
    QVector< QString> m_images{
        "qrc:/animeTheme/Anime/catGirl.PNG",
        "qrc:/animeTheme/Anime/cuteGirl.png",
        "qrc:/animeTheme/Anime/niceGirl.png",
        "qrc:/animeTheme/Anime/nekoGirl.png",
        "qrc:/animeTheme/Anime/miku.png"
    };

// shuffle given array
// @param myarray array( pointer to first element)
// @param size size of array
template <typename T>
void shuffle_array(T * myarray,int size);

// generates random integer from given range
// @param from begin of randomizing range
// @param to end of randomizing range
int generate_random_int(int from,int to);

public:

    BackEnd(QObject *parent = nullptr);
    Q_INVOKABLE QUrl generateAnimeGirl();

};

#endif // BACKEND_H
