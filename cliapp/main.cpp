#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include "qmllog4qml.h"

#include <QQmlContext>

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    //app
    QGuiApplication app(argc, argv);

    //
    QCoreApplication::setOrganizationName("NBS,lanbery");
    QCoreApplication::setOrganizationDomain("nbsio.net");
    QCoreApplication::setApplicationName("NBS 客户端");

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
