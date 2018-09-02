import QtQuick 2.11
import QtQuick.Controls 2.2

/**
 * @file    ListItemBtn.qml
 * @version 1.0
 * @brief   菜单按钮
 * @date    2018-09-02
 * @author  lanbery
 * @section LICENSE Copyright (c) 2018 - 2025 lanbery,NBS Chain Co.
 */
Button  {
    property color  _forceFontColor             : settings.itemBtnForceFontColor;   //前景色
    property real   _fontSize                   : 12*dp;
    property bool   selected                    : false;
    property bool   isSiling                    : true;             //是否侧边

    property real   itemFontSize                : 20*dp;
    property string symbolText;
    property string idName;
    property string itemText;


    id                                          : itmeBtn;
    height                                      : isSiling ? 30*dp : parent.height;
    width                                       : isSiling ? parent.width : 60*dp;

    Label   {
        id                                      : itemSymbol;
        anchors {
            left                                : parent.left;
            leftMargin                          : 15*dp;
            verticalCenter                      : parent.verticalCenter;
        }

        color                                   : _forceFontColor;
        width                                   : 25*dp;
        height                                  : parent.height;

        text                                    : symbolText;
        font.family                             : aweFont.name;
        font.pixelSize                          : 18*dp;
        verticalAlignment                       : Label.AlignVCenter;
        horizontalAlignment                     : Label.AlignHCenter;

    }

    Label   {
        id                                      : itemBtnName;
        height                                  : parent.height;
        anchors {
            left                                : isSiling ? itemSymbol.right : parent.left;
            leftMargin                          : isSiling ? 15*dp : 10*dp;
            right                               : parent.right;
            rightMargin                         : 3*dp;
        }
        color                                   : _forceFontColor;
        verticalAlignment                       : Label.AlignVCenter;
        wrapMode                                : Text.Wrap;
        text                                    : itemText;
        font.family                             : aweFont.name;
        font.pixelSize                          : _fontSize;
    }

    background  : Rectangle {
        id                                      : itemBackRect;
        //color                                   :
        visible                                 : false;
        width                                   : 2*dp;

    }



}
