#include <QGuiApplication>
#include <QQmlApplicationEngine>

/**
 * @file
 * @version 1.0
 * @brief
 * @date    2018-08-16
 * @author  lanbery
 * @section LICENSE Copyright (c) 2018 - 2025 lanbery,NBS Chain Co.
 */
int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    /* Developer Info */
    QCoreApplication::setOrganizationName("NBS Aventador");
    QCoreApplication::setOrganizationDomain("nbsio.net");
    QCoreApplication::setApplicationName("NBSDapp");
    QCoreApplication::setApplicationVersion("v0.0.1");



    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/UI/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
