#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickView>
#include <QQmlContext>
#include <QOpenGLContext>
#include <QDir>

#include <QScreen>
//#include "cpp/networkcontroller.h"

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


    const QString mainQmlApp = QStringLiteral("qrc:/UI/main.qml");
    QSurfaceFormat format;
    if(QOpenGLContext::openGLModuleType() == QOpenGLContext::LibGL){
        format.setVersion(3,2);
        format.setProfile(QSurfaceFormat::CoreProfile);
    }
    format.setDepthBufferSize(24);
    format.setStencilBufferSize(8);
    format.setSamples(4);


    QScreen *screen = app.screens()[0];
    int scrW = screen->size().width();
    int scrH = screen->size().height();
    /* viewer */

    QQuickView viewer;
    viewer.setFlags(Qt::FramelessWindowHint);
    viewer.setColor(QColor(Qt::transparent));

    #ifdef Q_OS_WIN
        QString extraImportPath(QStringLiteral("%1/../../../../%2"));
    #else
        QString extraImportPath(QStringLiteral("%1/../../../%2"));
    #endif
    viewer.engine()->addImportPath(extraImportPath.arg(QGuiApplication::applicationDirPath(),
                                                           QString::fromLatin1("qml")));
//    NetworkController networkController;
//    viewer.rootContext()->setContextProperty("networkController",&networkController);

    viewer.setFormat(format);
    viewer.setResizeMode(QQuickView::SizeRootObjectToView);
    viewer.setSource(QUrl(mainQmlApp));


    viewer.setPosition((scrW-viewer.width())/2,(scrH-viewer.height())/2);//居中显示
    viewer.show();
    viewer.rootContext()->setContextProperty("viewer",&viewer);
    QObject::connect(viewer.engine(),SIGNAL(quit()),qApp,SLOT(quit()));



    /* main view settings */
//    qmlRegisterType<NetworkController>("NbsIo",1,0,"NetworkController");
//    QSurfaceFormat::setDefaultFormat(format);
//    QQmlApplicationEngine engine;
//    engine.load(QUrl(mainQmlApp));

//    if (engine.rootObjects().isEmpty())
//        return -1;

    return app.exec();
}
