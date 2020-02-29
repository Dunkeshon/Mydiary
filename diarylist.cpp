#include "diarylist.h"
#include <QDate>
#include <QSettings>
#include <QModelIndex>

DiaryList::DiaryList(QObject *parent) : QObject(parent)
{
    // выгрузка информации из настроек
    QSettings settings;
        const int size = settings.beginReadArray("ListItems");
        for(int i = 0; i < size; ++i) {
            settings.setArrayIndex(i);
            ListItem item;
            item.currDate = settings.value("currDate").toString();
            item.title = settings.value("title").toString();
            item.userText = settings.value("userText").toString();
            item.editDate = settings.value("editDate").toString();
            m_listItems.push_back(item);
        }
        settings.endArray();
}

DiaryList::~DiaryList()
{
    QSettings settings;
    settings.beginWriteArray("ListItems");
    for(int i = 0; i < m_listItems.size(); ++i) {
        settings.setArrayIndex(i);
        settings.setValue("currDate", m_listItems[i].currDate);
        settings.setValue("title", m_listItems[i].title);
        settings.setValue("userText", m_listItems[i].userText);
        settings.setValue("editDate",m_listItems[i].editDate);
    }
    settings.endArray();

}

bool DiaryList::setItemAt(int index, const ListItem &item)
{
    if(index < 0 || index > m_listItems.size())
        return false;

    const ListItem &oldItem = m_listItems.at(index);
    if(oldItem.currDate == item.currDate && oldItem.title == item.title && oldItem.userText == item.userText && oldItem.editDate==item.editDate) // не учтен заголовок
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
    // if we already have note, added today -> don't add it
    //    if(QDate::currentDate().toString() == m_listItems.front().currDate) {
    //        return;
    //    }

    emit preItemAdded();

    ListItem new_item;
    new_item.currDate = QDate::currentDate().toString("dd.MM.yyyy");
    new_item.title = "";
    new_item.userText = "";// УБРАТЬ ПОТОМ(не нада)
    new_item.editDate=new_item.currDate;
    m_listItems.push_front(new_item);

    emit postItemAdded();
}

void DiaryList::deleteItem(const QModelIndex &sourceIndex)
{
    preItemDeleted(sourceIndex.row());

    m_listItems.remove(sourceIndex.row());

    postItemDeleted();
}


//void DiaryList::deleteItem()
//{
//   //нужно передавать индекс выбранного пользователем эллемента
//}
