#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickView>
#include <QQmlContext>
#include <QOpenGLContext>
#include "cpp/networkcontroller.h"
#include <QScreen>


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

    NetworkController networkController;
    QScreen *screen = app.screens()[0];
    int scrW = screen->size().width();
    int scrH = screen->size().height();
    /* viewer */

    QQuickView viewer;
    viewer.setFlags(Qt::FramelessWindowHint);
    viewer.setColor(QColor(Qt::transparent));


    viewer.setFormat(format);
    viewer.rootContext()->setContextProperty("networkController",&networkController);
    viewer.setResizeMode(QQuickView::SizeRootObjectToView);
    viewer.setSource(QUrl(mainQmlApp));


    viewer.setPosition((scrW-viewer.width())/2,(scrH-viewer.height())/2);//居中显示
    viewer.show();
    viewer.rootContext()->setContextProperty("mainWindow",&viewer);

    QObject::connect(viewer.engine(),SIGNAL(quit()),qApp,SLOT(quit()));



    //qmlRegisterType<NetworkController>("NbsIo",1,0,"NetworkController");

    /* main view settings */

//    QQmlApplicationEngine engine;
//    engine.load(QUrl(mainQmlApp));
//    if (engine.rootObjects().isEmpty())
//        return -1;

    return app.exec();
}
