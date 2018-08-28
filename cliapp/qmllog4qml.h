#ifndef QMLLOG4QML_H
#define QMLLOG4QML_H

#include <QObject>

/**
 * @brief       The QmlLog4Qml class
 * @version     1.0
 * @author      lanbery
 * @date        2018-08-28
 */
class QmlLog4Qml : public QObject
{
    Q_OBJECT
public:
    QmlLog4Qml();

    Q_INVOKABLE void qDebug_Info(int type,QString strInfo);
    Q_INVOKABLE void truncateLog();


signals:

public slots:
};

#endif // QMLLOG4QML_H
