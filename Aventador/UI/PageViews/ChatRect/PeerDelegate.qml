import QtQuick 2.11
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.2

/**
 * @file    PeerDelegate.qml
 * @version 1.0
 * @brief   节点展示
 * @date    2018-09-09
 * @author  lanbery
 * @section LICENSE Copyright (c) 2018 - 2025 lanbery,NBS Chain Co.
 */
ItemDelegate {
    property color      bgColor                     : settings.silingBarBgColor;
    property color      forceFontColor              : settings.itemBtnForceFontColor;
    id                                              : delegate;
    text                                            : model.nickName;

    width                                           : parent ? parent.width : 0;
    leftPadding                                     : 16*dp;
    rightPadding                                    : 0*dp;

    contentItem : RowLayout {
        spacing                                     : 5*dp;

        Rectangle   {
            id                                      : avatarRect;
            height                                  : delegate.height;
            width                                   : height;
            radius                                  : 6*dp;
            color: bgColor;

        }

        Label   {
            id                  : labelHash;
            Layout.fillWidth    : true;
            text                : delegate.text;
            color               : forceFontColor;

            background  : Rectangle{
                anchors.fill: parent;
                color: bgColor;
            }
        }


    }

}
