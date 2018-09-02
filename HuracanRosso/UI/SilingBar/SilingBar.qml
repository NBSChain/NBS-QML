import QtQuick 2.11
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import QtQuick.Controls 1.4 as Controls_1_4

import "."
import "../Utils"

/**
 * @file    SilingBar.qml
 * @version 1.0
 * @brief   右侧滑动菜单
 * @date    2018-09-02
 * @author  lanbery
 * @section LICENSE Copyright (c) 2018 - 2025 lanbery,NBS Chain Co.
 */
Rectangle   {
    id                                          : root;

    width                                       : parent.width;
    height                                      : parent.height;
    color                                       : settings.grigioLynxColor;


    ColumnLayout    {
        anchors.fill                            : parent;

        Rectangle   {
            id                                  : headerImgRect;
            Layout.fillWidth                    : true;
            Layout.preferredHeight              : 120;
            anchors.top                         : parent.top;
            color                               : settings.neroHeleneColor;

            Image {
                width                           : parent.width;
                source                          : "qrc:/images/bg.png";
                fillMode                        : Image.PreserveAspectFit;
            }
        }


        Rectangle   {
            anchors.top                         : headerImgRect.bottom;
            Layout.fillWidth                    : true;
            Layout.preferredHeight              : (root.height-headerImgRect.height)*dp;
            color                               : settings.silingBarBgColor;
            Controls_1_4.ScrollView {
                id                              : silingScrollView;
                width                           : parent.width;
                height                          : (parent.height - headerImgRect.height-1)*dp;
                horizontalScrollBarPolicy       : Qt.ScrollBarAlwaysOff;

                Column  {
                    id                          : colItems;
                    anchors.left                : parent.left;
                    width                       : root.width;
                    spacing                     : 0;
                    ListItemBtn {

                        id                      : home;
                        idName                  : "HOME";
                        symbolText              : "\uf015";
                        itemText                : "主页";

                        selected                : true;
                    }


                }
            }
        }

    }


}
