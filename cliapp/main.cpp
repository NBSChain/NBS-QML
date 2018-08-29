/**
 * @file    CliApp
 * @version 1.0
 * @brief
 * @date    2018-08-29
 * @author  lanbery
 * @section LICENSE Copyright (c) 2018 - 2025 lanbery,NBS Chain Co.
 */
#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include <QFontDatabase>
#include <QDebug>

/**
 * @author lanbery
 * @brief qMain
 * @param argc
 * @param argv
 * @return
 */
int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    //添加字体
    int fontId                  = QFontDatabase :: addApplicationFont(":/Font/fontawesome-webfont.ttf");
    QStringList fontFamilies    = QFontDatabase :: applicationFontFamilies(fontId);
    qDebug() << "fontFamilies.size() " << fontFamilies.size();


    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
//    if (engine.rootObjects().isEmpty())
//        return -1;

    return app.exec();
}
