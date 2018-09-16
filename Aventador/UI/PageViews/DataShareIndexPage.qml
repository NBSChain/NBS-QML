import QtQuick 2.11
import QtQuick.Controls 2.2
import QtQuick.Controls 1.4 as Controls_1_4
import QtQuick.Layouts 1.3

import "./DatasPage"
import "../DataModels"

/**
 * @file    DataShareIndexPage.qml
 * @version 1.0
 * @brief   数据管理
 * @date    2018-09-13
 * @author  lanbery
 * @section LICENSE Copyright (c) 2018 - 2025 lanbery,NBS Chain Co.
 */
ColumnLayout {

    id                                          : rootIndex;
    anchors.fill                                : parent;
    spacing                                     : 20*dp;

    DataSearcherBar {
        id                                      : searcherBar;
        Layout.fillWidth                        : true;
        Layout.topMargin                        : 20*dp;
        Layout.preferredHeight                  : 32*dp;
        Layout.minimumHeight                    : 32*dp;
        Layout.maximumHeight                    : 32*dp;
    }

//    Rectangle {
//        Layout.fillWidth: true;
//        Layout.fillHeight: true;
//        color   :bgColor;
//        //border.color: "red";
//    }

    Controls_1_4.TableView   {
        id                                      : tableView;
        Layout.fillWidth                        : true;
        Layout.fillHeight                       : true;
        frameVisible                            : false;

        model                                   : DataFileListModel {id:dataFiles;}

//        headerDelegate      : Component {
//            id              : headerDelegate;
//            Rectangle   {
//                id              : headTitleRect;
//                Text    {
//                    anchors.centerIn: parent;

//                }
//            }
//        }

    }

}
