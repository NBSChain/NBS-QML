import QtQuick 2.11
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2
/**
 * @file    QuickLabelLayout.qml
 * @version 1.0
 * @brief   快捷菜单栏
 * @date    2018-09-03
 * @author  lanbery
 * @section LICENSE Copyright (c) 2018 - 2025 lanbery,NBS Chain Co.
 */
RowLayout {

    id                                      : quickLabelLayout;
    anchors.fill                            : parent;
    spacing                                 : 1*dp;

    Rectangle   {
        color                               : settings.grigioLynxColor;

        Text    {
            anchors.centerIn                : parent;
            text                            : "Datas";
        }


    }
    Rectangle   {
        color                               : settings.grigioLynxColor;

        Text    {
            anchors.centerIn                : parent;
            text                            : "IM";
        }


    }

}
