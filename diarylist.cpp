#include "diarylist.h"
#include <QDate>

DiaryList::DiaryList(QObject *parent) : QObject(parent)
{
    // выгрузка информации из настроек
    // QSettings ...
    for(int i = 0; i< 10; i++){
        m_listItems.push_back({"12.01.2222","# ",""});
    }
}

bool DiaryList::setItemAt(int index, const ListItem &item)
{
    if(index < 0 || index > m_listItems.size())
        return false;

    const ListItem &oldItem = m_listItems.at(index);
    if(oldItem.currDate == item.currDate && oldItem.userText == item.userText) // не учтен заголовок
        return false;

    m_listItems[index] = item;
    return true;
}

QVector<ListItem> DiaryList::listItems() const
{
    return m_listItems;
}

void DiaryList::addItem()
{
    emit preItemAdded();

    ListItem new_item;
    new_item.currDate = QDate::currentDate().toString();
    new_item.title = "# ";
    new_item.userText = "";// УБРАТЬ ПОТОМ(не нада)
    m_listItems.push_back(new_item);

    emit postItemAdded();
}

void DiaryList::deleteItem()
{
   //нужно передавать индекс выбранного пользователем эллемента
}
