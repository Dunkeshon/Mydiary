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
                                   {0,"qrc:/resources/images/catGirl.svg"},
                                   {1,"qrc:/resources/images/cuteGirl.svg"},
                                   {2,"qrc:/resources/images/santaGirl.svg"},
                                   {3,"qrc:/resources/images/shyCatGirl.svg"},
                                   {4,"qrc:/resources/images/hmmGirl.svg"},
                                   {5,"qrc:/resources/images/niceGirl.svg"},
                                   {6,"qrc:/resources/images/nerdGirl2.svg"}
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
