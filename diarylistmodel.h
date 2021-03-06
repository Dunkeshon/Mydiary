#ifndef DIARYLISTMODEL_H
#define DIARYLISTMODEL_H

#include <QAbstractListModel>
#include <QSortFilterProxyModel>

class DiaryList;

class DiaryListModel : public QAbstractListModel
{
    Q_OBJECT
    Q_PROPERTY(DiaryList *list READ list WRITE setList)

public:
    explicit DiaryListModel(QObject *parent = nullptr);
    enum RoleEnums {
        DateRole = Qt::UserRole + 1,
        TitleRole,
        TextRole,
        LastEditRole,
        FavoriteRole

    };
    Q_ENUM(RoleEnums)
    // Basic functionality:
    int rowCount(const QModelIndex &parent = QModelIndex()) const override;

    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;

    // Editable:
    bool setData(const QModelIndex &index, const QVariant &value,
                 int role = Qt::EditRole) override;


    Qt::ItemFlags flags(const QModelIndex& index) const override;
    virtual QHash<int, QByteArray> roleNames()const override;
    DiaryList *list()const;
    void setList(DiaryList *list);

private:
    DiaryList* m_list;
};



class ProxyModel : public  QSortFilterProxyModel
{
    Q_OBJECT
public:
    ProxyModel(){}
};

#endif // DIARYLISTMODEL_H
