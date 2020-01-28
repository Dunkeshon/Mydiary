#include "diarylist.h"

DiaryList::DiaryList(QObject *parent) : QObject(parent)
{
    // выгрузка информации из настроек
    // QSettings ...
}

QVector<ListItem> DiaryList::listItems() const
{
    return m_listItems;
}

void DiaryList::setListItems(const QVector<ListItem> &listItems)
{
    m_listItems = listItems;
}
