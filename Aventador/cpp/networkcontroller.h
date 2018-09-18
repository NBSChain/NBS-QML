#ifndef NETWORKCONTROLLER_H
#define NETWORKCONTROLLER_H

#include <QObject>
#include <QTcpServer>
#include <QTcpSocket>
/**
 * @file    networkcontroller.h
 * @version 1.0
 * @brief
 * @date    2018-09-18
 * @author  lanbery
 * @section LICENSE Copyright (c) 2018 - 2025 lanbery,NBS Chain Co.
 */
class NetworkController : public QObject
{
    Q_OBJECT

public:
    explicit NetworkController(QObject *parent = nullptr);

private:
    QTcpServer m_server;

private slots:
    void newConnection();
    void disconnected();
    void readyRead();

signals:
    void commandAccepted(QString command,QString value);
};

#endif // NETWORKCONTROLLER_H
