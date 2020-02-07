#include "diarylistmodel.h"
#include "diarylist.h"

DiaryListModel::DiaryListModel(QObject *parent)
    : QAbstractListModel(parent),
      m_list(nullptr)
{}

int DiaryListModel::rowCount(const QModelIndex &parent) const
{
    // For list models only the root node (an invalid parent) should return the list's size. For all
    // other (valid) parents, rowCount() should return 0 so that it does not become a tree model.
    if (parent.isValid() || !m_list)
        return 0;

    return m_list->listItems().size();
}

QVariant DiaryListModel::data(const QModelIndex &index, int role) const
{
    if (!index.isValid() || !m_list)
        return QVariant();

    const ListItem item = m_list->listItems().at(index.row());
    switch (role) {
    case DateRole: return QVariant(item.currDate);
    case TitleRole: return QVariant(item.title);
    case TextRole: return QVariant(item.userText);
    }
    return QVariant();
}

// if we edit a note , that was created today -> add editing date
// works by checking if we are working with 0 index or not
// if we will decide to let create multiple notes a day -> change realization
bool DiaryListModel::setData(const QModelIndex &index, const QVariant &value, int role)
{
    if(!m_list){
        return false;
    }
    if (data(index, role) != value) {
        ListItem item = m_list->listItems().at(index.row());

        switch(role) {
        case DateRole: item.currDate = value.toString();
            break;
        case TextRole:
            /*                if(index.row()!=0){  if we edit a note , that was created today -> add editing date
                                 item.userText = value.toString(); + " [ "+ QDate::currentDate().toString( "'Дата изменения :' dddd, d MMMM yyyy") + " ] " ;
                                }
                                else{
                                 item.userText = value.toString();
                             }*/
            item.userText = value.toString();
            break;
        case TitleRole: item.title = value.toString();
            break;
        }

        if(m_list->setItemAt(index.row(),item)) {
            emit dataChanged(index, index, QVector<int>() << role);
            return true;
        }
    }
    return false;
}

Qt::ItemFlags DiaryListModel::flags(const QModelIndex &index) const
{
    if (!index.isValid())
        return Qt::NoItemFlags;

    return Qt::ItemIsEditable;
}


QHash<int, QByteArray> DiaryListModel::roleNames() const
{
    QHash <int, QByteArray>Roles;
    Roles[DateRole] = "Date";
    Roles[TextRole] = "Text";
    Roles[TitleRole] = "Title";
    return Roles;
}

DiaryList *DiaryListModel::list() const
{
    return m_list;
}

void DiaryListModel::setList(DiaryList *list)
{
    // beginResetModel();
    // если лист не nullptr
    // отсоеденить лист который был до этого
    // если лист не nullptr
    //подключить сигналы,
    //endResetModel();

    beginResetModel();
    if(m_list){
        m_list->disconnect(this);
    }

    m_list = list;

    if(m_list){
        connect(m_list,&DiaryList::preItemAdded,this,[=](){
            const int index = 0;// вставка в начало
            beginInsertRows(QModelIndex(),index,index);
        });
        connect(m_list,&DiaryList::postItemAdded,this,[=](){
            endInsertRows();
        });
        connect(m_list,&DiaryList::preItemDeleted,this,[=](int index){
            beginRemoveRows(QModelIndex(),index,index);
        });
        connect(m_list,&DiaryList::postItemDeleted,this,[=](){
            endRemoveRows();
        });
    }

    endResetModel();

}
