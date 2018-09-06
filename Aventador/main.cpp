#include <QGuiApplication>
#include <QQmlApplicationEngine>

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    /* Developer Info */
    QCoreApplication::setOrganizationName("NBS Aventador");
    QCoreApplication::setOrganizationDomain("nbsio.net");
    QCoreApplication::setApplicationName("NBS Dapp");
    QCoreApplication::setApplicationVersion("v0.0.1");

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/UI/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
