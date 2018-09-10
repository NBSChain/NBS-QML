import QtQuick 2.11
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.2
import QtQuick.Layouts 1.3

/**
 * @file    RightChatRect.qml
 * @version 1.0
 * @brief   聊天窗口
 * @date    2018-09-10
 * @author  lanbery
 * @section LICENSE Copyright (c) 2018 - 2025 lanbery,NBS Chain Co.
 */
ColumnLayout {

    id                                              : root;
    anchors.fill                                    : parent;

    ListView {
        id                                          : msgListView;
        Layout.fillHeight                           : true;
        Layout.fillWidth                            : true;


    }
}
