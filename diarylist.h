#ifndef DIARYLIST_H
#define DIARYLIST_H

#include <QObject>
#include <QVector>
#include <QDate>
#include <QMetaType>

struct ListItem {
    QString currDate;
    QString title;
    QString userText;

};

class DiaryList: public QObject
{
    Q_OBJECT
public:
    DiaryList(QObject *parent = nullptr);
    ~DiaryList();
    bool setItemAt(int index, const ListItem & item);

    QVector<ListItem> listItems() const;
private:
    QVector<ListItem> m_listItems;

signals:
    void preItemAdded();
    void postItemAdded();
//    void preItemDeleted(int index);
//    void postItemDeleted();
public slots:

    void addItem();
//    void deleteItem();
};



#endif // DIARYLIST_H
