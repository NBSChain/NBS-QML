#ifndef APPMODEL_H
#define APPMODEL_H

#include <QObject>

class AppModel : public QObject
{
    Q_OBJECT
public:
    explicit AppModel(QObject *parent = 0);

    ~AppModel();


signals:

public slots:
};

#endif // APPMODEL_H
