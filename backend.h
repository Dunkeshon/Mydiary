#ifndef BACKEND_H
#define BACKEND_H

#include <QObject>
#include <QMap>
#include <QString>
#include <random>
#include <cstdlib>
#include <QUrl>

class BackEnd: public QObject
{
    Q_OBJECT
private:
    QMap <int,QString> m_imagesMap{
        {0,"qrc:/animeTheme/Anime/catGirl.PNG"},
        {1,"qrc:/animeTheme/Anime/cuteGirl.png"},
        {2,"qrc:/animeTheme/Anime/niceGirl.png"},
        {3,"qrc:/animeTheme/Anime/nekoGirl.png"}
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
