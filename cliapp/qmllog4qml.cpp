#include "qmllog4qml.h"
#include <QMutex>
#include <QFile>
#include <QDateTime>
#include <QTextStream>

/**
 * @brief       The QmlLog4Qml class
 * @version     1.0
 * @author      lanbery
 * @date        2018-08-28
 */

void outputMessage(QtMsgType type, const QMessageLogContext &context, const QString &msg){
    static QMutex mutex;
    mutex.lock();

    QString text;

    switch(type){
        case QtDebugMsg :
            text = QString("Debug:");
            break;
        case QtWarningMsg :
            text = QString("Debug:");
            break;
        case QtCriticalMsg :
            text = QString("Critical:");
            break;

        case QtFatalMsg:
            text = QString("Fatal:");
    }

    QString message = "";
    if(context.file != nullptr){
        QString context_info = QString("File:(%1) Line : (%2)").arg(QString(context.file)).arg(context.line);
        QString current_date_time = QDateTime::currentDateTime().toString("yyyy-MM-dd hh:mm:ss ddd");
        QString current_date_str = QString("(%1)").arg(current_date_time);

        message = QString("%1 %2 %3 %4").arg(text).arg(context_info).arg(msg).arg(current_date_str);

    }else {
        message = msg;
    }

    QFile file("nbs-cli.log");
    file.open(QIODevice::WriteOnly | QIODevice::Append);
    QTextStream text_stream(&file);
    text_stream << message << "\r\n";

    file.flush();
    file.close();
    mutex.unlock();
}

/**
 * @brief QmlLog4Qml::QmlLog4Qml
 */
QmlLog4Qml::QmlLog4Qml()
{
#ifndef _DEBUG
        qInstallMessageHandler(outputMessage);
#endif
}

/**
 * 技术实现类
 * @brief QmlLog4Qml::qDebug_Info
 * @param type
 * @param strInfo
 */
void QmlLog4Qml::qDebug_Info(int type, QString strInfo){

    QMessageLogContext context;
    context.file = nullptr;
    outputMessage((QtMsgType)type,context,strInfo);
}

/**
 * @brief QmlLog4Qml::truncateLog
 */
void QmlLog4Qml::truncateLog(){
    QFile file("nbs-cli.log");
    file.open(QIODevice::WriteOnly|QIODevice::Truncate);
    file.flush();
    file.close();
}
