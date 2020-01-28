#ifndef DIARYLIST_H
#define DIARYLIST_H

#include <QObject>
#include <QVector>

struct ListItem {
    QString currDate;
    QString userText;
};

class DiaryList: public QObject
{
    Q_OBJECT
public:
    explicit DiaryList(QObject *parent = nullptr);

    QVector<ListItem> listItems() const;
    void setListItems(const QVector<ListItem> &listItems);

private:
    QVector<ListItem> m_listItems;
};

#endif // DIARYLIST_H
