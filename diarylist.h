#ifndef DIARYLIST_H
#define DIARYLIST_H

#include <QObject>
#include <QVector>
#include <QDate>

struct ListItem {
    QString currDate;
    QString userText;
    QString title;
};

class DiaryList: public QObject
{
    Q_OBJECT
public:
    explicit DiaryList(QObject *parent = nullptr);
    bool setItemAt(int index, const ListItem & item);

    QVector<ListItem> listItems() const;
private:
    QVector<ListItem> m_listItems;

signals:
    void preItemAdded();
    void postItemAdded();
    void preItemDeleted(int index);
    void postItemDeleted();
public slots:

    void addItem();
    void deleteItem();
};

#endif // DIARYLIST_H
