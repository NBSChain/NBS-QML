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

    Layout.topMargin                        : 10*dp;
    //anchors.fill                            : parent;
    MessageListModel {
        id                                  : messageList;
    }
    //border.color: "red";
    ScrollView  {
        //Layout.fillWidth: true;
        anchors.fill                        : parent;

//        Layout.fillHeight: true;

        ListView    {
            //id                              : listView;
            //anchors.fill                    : parent;
            Layout.fillWidth                : true;
            Layout.fillHeight               : true;
            id                              : msgListViewID;
            clip                            : true;
            spacing                         : 5*dp;

            model                           : messageList;

            delegate                        : MessageDelegateRectangle {
                id                          : messageDelegate;
                Layout.fillWidth            : true;
                width                       : 0*dp;   //guanjian
                content                     : model.content;
                avatarUrl                   : model.avatar;
                sendTime                    : model.sendTime;
                self                        : model.self;
                msgid                       : model.msgid;

            }

        }
    }



}
