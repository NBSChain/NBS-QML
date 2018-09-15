#ifndef APPMODEL_H
#define APPMODEL_H

#include <QObject>
#include <QSqlDatabase>

/*!
 * @file
 * @version 1.0
 * @brief   私有
 * @date    2018-09-15
 * @author  lanbery
 * @section LICENSE Copyright (c) 2018 - 2025 lanbery,NBS Chain Co.
 */
//class AppModelPrivate;

/**
 * @file    AppModel.h
 * @version 1.0
 * @brief
 * @date    2018-09-15
 * @author  lanbery
 * @section LICENSE Copyright (c) 2018 - 2025 lanbery,NBS Chain Co.
 */
class AppModel : public QObject
{
    Q_OBJECT

    enum IpfsFile{
        Author = Qt::UserRole+1,
        CreateTime ,
        FName,                      //文件名
        FSize,
        Hash58,
        State,                      //local ,data,pined,
        PHash,                      //上级hash
        isFile                     //是否文件
    };



public:
    explicit AppModel(QObject *parent = 0);

    //~AppModel();

signals:

public slots:

private:
    QSqlDatabase nbsDB;
    //AppModelPrivate *d;
};

#endif // APPMODEL_H
