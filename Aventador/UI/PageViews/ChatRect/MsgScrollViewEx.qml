import QtQuick 2.11
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3

import "../../DataModels"

/**
 * @file    MsgScrollViewEx.qml
 * @version 1.0
 * @brief   消息展示区
 * @date    2018-09-11
 * @author  lanbery
 * @section LICENSE Copyright (c) 2018 - 2025 lanbery,NBS Chain Co.
 */
Rectangle {
    property alias      color               : rootMsgRect.color;
    id                                      : rootMsgRect;

    MessageListModel {
        id                                  : messageList;
    }



    ScrollView  {
        anchors.fill                        : parent;

        ListView    {
            id                              : msgListViewID;
            clip                            : true;

            model                           : messageList;

            delegate                        : MessageDelegateRectangle {
                id                          : messageDelegate;
            }

        }
    }



}
