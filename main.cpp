#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QSettings>
#include "diarylist.h"
#include "diarylistmodel.h"
#include "sortfilterproxymodel.h"


int main(int argc, char *argv[])
{
    //qputenv("QSG_VISUALIZE","overdraw");
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);
    QCoreApplication::setOrganizationName("Opposite Direction");
    QCoreApplication::setApplicationName("MyDiary");

    qmlRegisterType<DiaryListModel>("Diary",1,0,"DiaryModel");
    qmlRegisterType<SortFilterProxyModel>("Diary",1,0,"SortFilterProxyModel");

    qmlRegisterUncreatableType<DiaryList>("Diary",1,0,"DiaryList",
         QStringLiteral("This object should not be created in qml"));

    DiaryList diaryList;

    QQmlApplicationEngine engine;

    engine.rootContext()->setContextProperty(QStringLiteral("diaryList"), &diaryList);
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
