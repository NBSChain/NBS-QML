#ifndef APPMODEL_H
#define APPMODEL_H

#include <QObject>
/**
 * @file    AppModel.h
 * @version 1.0
 * @brief
 * @date    2018-09-13
 * @author  lanbery
 * @section LICENSE Copyright (c) 2018 - 2025 lanbery,NBS Chain Co.
 */
class AppModel : public QObject
{
    Q_OBJECT
public:
    explicit AppModel(QObject *parent = 0);

    ~AppModel();

    Q_INVOKABLE QVariantList searchDataList(const   QString& keywords);

    Q_INVOKABLE void initDataBases();

public:


signals:

public slots:
};

#endif // APPMODEL_H
