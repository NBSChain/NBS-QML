import QtQuick 2.11
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3

import "./NodesPage"
/**
 * @file    NodeIndexPage.qml
 * @version 1.0
 * @brief   摘要
 *          节点信息主页
 * @date    2018-09-12
 * @author  lanbery
 * @section LICENSE Copyright (c) 2018 - 2025 lanbery,NBS Chain Co.
 */
RowLayout {
    id                                          : indexPage;

    anchors.fill                                : parent;
    spacing                                     : 0;

    /* LEFT */
    LeftNodesView {
        id                                      : leftView;
        Layout.fillHeight                       : true;
        Layout.minimumWidth                     : 260*dp;
        Layout.preferredWidth                   : 260*dp;
        Layout.maximumWidth                     : 260*dp;
    }

    Rectangle   {
        id                                      : rightViewRect;
        Layout.fillWidth                        : true;
        Layout.fillHeight                       : true;
        color                                   : bgColor;
        //border.color: "red";
    }
}
