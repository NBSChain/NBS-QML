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
    property color  _normalBackgroundColor      : settings.silingBarBgColor;
    property real   _fontSize                   : 12*dp;
    property bool   selected                    : false;
    property bool   isSiling                    : true;             //是否侧边

    property real   itemFontSize                : 14*dp;

    property string symbolText;
    property string idName;
    property string itemText;


    id                                          : itemBtn;
    height                                      : 30*dp;
    width                                       : parent.width;

    signal  btnClicked(string name);

    background  : Rectangle {
        id                                          : backgroundRect;
        color                                       : selected ? settings.grigioLynxColor : _normalBackgroundColor;
        Rectangle {
            id                                      : itemRightRect;
            color                                   : settings.rossoMarsColor;
            visible                                 : selected ? true : false;
            width                                   : 2*dp;
            height                                  : parent.height;
            anchors.left                            : parent.left;
        }
        Label   {
            id                                      : itemSymbol;
            anchors {
                left                                : itemRightRect.right;
                leftMargin                          : 15*dp;
                verticalCenter                      : parent.verticalCenter;
            }

            color                                   : selected ? _activedFontColor : _forceFontColor;
            width                                   : 25*dp;
            height                                  : parent.height;

            text                                    : symbolText;
            font.family                             : aweFont.name;
            font.pixelSize                          : itemFontSize;
            verticalAlignment                       : Label.AlignVCenter;
            horizontalAlignment                     : Label.AlignHCenter;

        }

        Label   {
            id                                      : itemLabelBtn;
            height                                  : parent.height;
            anchors {
                left                                : itemSymbol.right;
                leftMargin                          : 10*dp;
                right                               : parent.right;
                rightMargin                         : 3*dp;
            }
            color                                   : selected ? _activedFontColor : _forceFontColor;
            verticalAlignment                       : Label.AlignVCenter;
            wrapMode                                : Text.Wrap;
            text                                    : itemText;
            font.family                             : aweFont.name;
            font.pixelSize                          : itemFontSize;
        }


        MouseArea   {
            id                                      : itemMouseArea;
            anchors.fill                            : parent;
            hoverEnabled                            : true;
            cursorShape                             : Qt.PointingHandCursor;

            onEntered                               : {
                if(!selected){
                    itemLabelBtn.color      = _activedFontColor;
                    itemSymbol.color        = _activedFontColor;
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

    Component.onCompleted                            : {
        itemBtn.btnClicked.connect(btnGroupClicked);
    }

}
