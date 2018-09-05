import QtQuick 2.11
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
/**
 * @file    IndexView.qml
 * @version 1.0
 * @brief   首页
 * @date    2018-09-05
 * @author  lanbery
 * @section LICENSE Copyright (c) 2018 - 2025 lanbery,NBS Chain Co.
 */
Page {
    id                                  :rootPager;

    header                              : Rectangle {
           width                        : parent.width;
           color                        : "red";
           height                       : 40*dp;
    }

    RowLayout {
        anchors.fill                    : parent;

        Label {
            text                        : qsTr("Index Pages");
            Layout.fillWidth            : true;
        }
    }

}
