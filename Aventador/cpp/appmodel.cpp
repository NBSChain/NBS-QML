#include "appmodel.h"

#include <QDir>
#include <QStandardPaths>
#include <QCoreApplication>
#include <QSqlError>
#include <QSqlQuery>
#include <QDebug>

//class AppModelPrivate {
//public :
//    static const QString dbFileName = "nbs.db";
//}
/**
 * @file    AppModel.cpp
 * @version 1.0
 * @brief
 * @date    2018-09-15
 * @author  lanbery
 * @section LICENSE Copyright (c) 2018 - 2025 lanbery,NBS Chain Co.
 */
AppModel::AppModel(QObject *parent) : QObject(parent)
{
//    nbsDB = QSqlDatabase::addDatabase("QSQLITE");
//    if(QDir().mkpath(QStandardPaths::writableLocation(QStandardPaths::AppDataLocation))){
//        QString dbPath =
//                QStandardPaths::writableLocation(QStandardPaths::AppDataLocation)
//                + QDir::separator()
//                + QCoreApplication::applicationName()
//                + ".db";
//#ifdef QT_DEBUG
//        qDebug() << "nbsDB Path:" << QDir::toNativeSeparators(dbPath);
//#endif

//    }
//    if(QSqlDatabase::contains("nbs_sqlite_conn")){
//        nbsDB = QSqlDatabase::database("nbs_sqlite_conn");
//    }else {
//        nbsDB = QSqlDatabase::addDatabase("QSQLITE","nbs_sqlite_conn");
//        nbsDB.setDatabaseName("nbs.db");
//        nbsDB.setUserName("nbs");
//        nbsDB.setPassword("nbs123");

//    }

//    if(!nbsDB.open()){
//       qDebug()<< "Error: failed to connect nbsDB ." << nbsDB.lastError();
//    }else {
//        QSqlQuery sql_query;
//        QString create_nbs_data = "create table test ("
//                                  "id int primary key,"
//                                  "name varchar(30),"
//                                  "age int)";
//        sql_query.prepare(create_nbs_data);
//        sql_query.exec();
//        qDebug()<< "log insert table.";
//    }


}
