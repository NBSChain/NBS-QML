#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include "./cpp/appmodel.h"
#include <QScreen>

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    /* Developer Info */
    QCoreApplication::setOrganizationName("NBS Chain");
    QCoreApplication::setOrganizationDomain("nbsio.net");
    QCoreApplication::setApplicationName("NBS Dapp");
    QCoreApplication::setApplicationVersion("v0.0.1");

    /* 分辨率处理 */
    qreal       refDpi      = 216.;
    qreal       refWidth    = 1000.;
    qreal       refHeigh    = 618.;

    QRect       rect        = QGuiApplication::primaryScreen()->geometry();
    qreal       height      = qMin(rect.height(),rect.width());
    qreal       width       = qMax(rect.width(),rect.height());

    qreal       dpi         = QGuiApplication::primaryScreen()->logicalDotsPerInch();
    qreal       dp2i        = QGuiApplication::primaryScreen()->physicalDotsPerInch();

    QString     d           = QGuiApplication::primaryScreen()->manufacturer();
    QString     d1          = QGuiApplication::primaryScreen()->name();
    QString     d12         = QGuiApplication::primaryScreen()->model();

    qreal       m_ratio     = qMin(height/refHeigh,width/refWidth);
    qreal       m_ratioFont = qMin(height*refDpi/(dpi*refHeigh),width*refDpi/(dpi*refWidth));



    qmlRegisterType<AppModel>("NBSAppModel",1,0,"AppModel");

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/UI/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
