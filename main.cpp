#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QSettings>
#include <QStyleHints>
#include "diarylist.h"
#include "diarylistmodel.h"
#include "ColorThemes.h"
#include "backend.h"


int main(int argc, char *argv[])
{
   // qputenv("QSG_VISUALIZE","overdraw");
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);
    QGuiApplication::styleHints()->setMousePressAndHoldInterval(1250);
    QCoreApplication::setOrganizationName("Opposite Direction");
    QCoreApplication::setApplicationName("MyDiary");

    qmlRegisterType<DiaryListModel>("Diary",1,0,"DiaryModel");
    qmlRegisterType<ProxyModel>("Diary",1,0,"SortFilterProxyModel");

    qmlRegisterUncreatableType<DiaryList>("Diary",1,0,"DiaryList",
         QStringLiteral("This object should not be created in qml"));
    qmlRegisterUncreatableType<ColorThemes>("Diary",1,0,"Themes",
         QStringLiteral("This object should not be created in qml"));



    DiaryList diaryList;
    BackEnd backEnd;

    QQmlApplicationEngine engine;


    engine.rootContext()->setContextProperty(QStringLiteral("diaryList"), &diaryList);
    engine.rootContext()->setContextProperty(QStringLiteral("backEnd"), &backEnd);


    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
