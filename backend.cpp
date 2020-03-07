#include "backend.h"
#include <QDebug>

int BackEnd::generate_random_int(int from, int to)
{
    std::random_device rd;   // non-deterministic generator
    std::mt19937 gen(rd());  // to seed mersenne twister.
    std::uniform_int_distribution<> dist(from,to);
    return dist(gen); // returns generated item
}

BackEnd::BackEnd(QObject *parent) : QObject(parent)
{

}

QUrl BackEnd::generateAnimeGirl()
{

   int randomInt = generate_random_int(0,m_imagesMap.size()-1);
   qDebug()<<QString::number(randomInt);
    qDebug()<<m_imagesMap[randomInt];
   return QUrl( m_imagesMap[randomInt]);
}

template<typename T>
void BackEnd::shuffle_array(T *myarray, int size)
{
    std::random_device rd; // non-deterministic generator
    std::mt19937 gen(rd()); // to seed mersenne twister.
    std::shuffle(&(myarray[0]),&(myarray[size-1]),gen);
}
