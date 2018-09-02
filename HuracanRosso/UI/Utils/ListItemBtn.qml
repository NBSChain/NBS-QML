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
    property color  _activedFontColor           : settings.rossoMarsColor;
    property real   _fontSize                   : 12*dp;
    property bool   selected                    : false;
    property bool   isSiling                    : true;             //是否侧边

    property real   itemFontSize                : 20*dp;
    property string symbolText;
    property string idName;
    property string itemText;


    id                                          : itemBtn;
    height                                      : isSiling ? 30*dp : parent.height;
    width                                       : isSiling ? parent.width : 60*dp;

    signal  btnClicked(string name);

    background  : Rectangle {
        id                                          : backgroundRect;
        color                                       : settings.silingBarBgColor;
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
            id                                      : itemLabelBtn;
            height                                  : parent.height;
            anchors {
                left                                : isSiling ? itemSymbol.right : parent.left;
                leftMargin                          : isSiling ? 15*dp : 10*dp;
                right                               : parent.right;
                rightMargin                         : 3*dp;
            }
            color                                   : selected ? _activedFontColor :_forceFontColor;
            verticalAlignment                       : Label.AlignVCenter;
            wrapMode                                : Text.Wrap;
            text                                    : itemText;
            font.family                             : aweFont.name;
            font.pixelSize                          : _fontSize;
        }
        Rectangle {
            id                                      : itemRightRect;
            color                                   : settings.rossoMarsColor;
            visible                                 : false;
            width                                   : 2*dp;
            height                                  : parent.height;
            anchors.right                           : parent.right;
        }

        MouseArea   {
            id                                      : itemMouseArea;
            anchors.fill                            : parent;
            hoverEnabled                            : true;
            cursorShape                             : Qt.PointingHandCursor;

            onEntered                               : {
                if(!selected){
                    itemLabelBtn.color      = settings.rossoMarsColor;
                    itemSymbol.color        = settings.rossoMarsColor;
                    parent.color            = settings.grigioLynxColor;
                }
            }

            onExited                                : {
                if(!selected){
                    itemLabelBtn.color      = _forceFontColor;
                    itemSymbol.color        = _forceFontColor;
                    parent.color            = settings.silingBarBgColor;
                }
            }

            onClicked                               : {
                selected                = true;
                itemRightRect.visible   = true;
                parent.color            = settings.grigioLynxColor;
                btnClicked(idName);
            }
        }
    }

    //reset all
    function    reset(){
        selected                = false;
        itemRightRect.visible   = false;
        itemSymbol.color        = _forceFontColor;
        itemLabelBtn.color      = _forceFontColor;
        backgroundRect.color    = settings.silingBarBgColor;
    }

    function    firstSelected(){
        selected                = true;
        itemRightRect.visible   = true;
        backgroundRect.color    = settings.grigioLynxColor;
    }

    Component.objectName                            : {
        itemBtn.btnClicked.connect(btnGroupClicked);
    }

}
