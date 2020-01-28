#ifndef DIARYLISTMODEL_H
#define DIARYLISTMODEL_H

#include <QAbstractListModel>

class DiaryListModel : public QAbstractListModel
{
    Q_OBJECT

public:
    explicit DiaryListModel(QObject *parent = nullptr);

    enum{
        DateRole = Qt::UserRole + 1,
        TextRole

    };
    // Basic functionality:
    int rowCount(const QModelIndex &parent = QModelIndex()) const override;

    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;

    // Editable:
    bool setData(const QModelIndex &index, const QVariant &value,
                 int role = Qt::EditRole) override;

    Qt::ItemFlags flags(const QModelIndex& index) const override;
    virtual QHash<int, QByteArray> roleNames()const override;

private:
};

#endif // DIARYLISTMODEL_H
