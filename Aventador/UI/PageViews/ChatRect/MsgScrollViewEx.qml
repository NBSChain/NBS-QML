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

    //anchors.fill                            : parent;
    MessageListModel {
        id                                  : messageList;
    }

    ScrollView  {
        anchors.fill                        : parent;
        Layout.fillHeight: true;
        Layout.fillWidth: true;
        Layout.leftMargin: 10*dp;
        ListView    {
            anchors.fill                    : parent;
            id                              : msgListViewID;
            clip                            : true;
            spacing: 2*dp;

            model                           : messageList;

            delegate                        : MessageDelegateRectangle {
                id                          : messageDelegate;

                content                     : model.content;
                avatarUrl                   : model.avatar;
                sendTime                    : model.sendTime;
                self                        : model.self;
                msgid                       : model.msgid;
            }

        }
    }



}
