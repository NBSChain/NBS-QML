import QtQuick 2.11
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import QtQuick.Controls 1.4 as Controls_1_4

import "."
import "../Utils"

/**
 * @file    SilingBar.qml
 * @version 1.0
 * @brief   右侧滑动菜单
 * @date    2018-09-02
 * @author  lanbery
 * @section LICENSE Copyright (c) 2018 - 2025 lanbery,NBS Chain Co.
 */
Rectangle   {
    property string     currentViewName         : "HOME";
    id                                          : root;

    width                                       : parent.width;
    height                                      : parent.height;
    color                                       : settings.neroHeleneColor;


    function allReset(){
        for(var i =0 ;i<itemBtnGroup.buttons.length;++i){
            itemBtnGroup.buttons[i].reset();
        }
    }

    function btnGroupClicked(name){
        for(var i =0 ;i<itemBtnGroup.buttons.length;++i){
            if(itemBtnGroup.buttons[i].idName !== name)
                itemBtnGroup.buttons[i].reset();
        }

        currentViewName = name;
    }

    ButtonGroup     {
        id                                      : itemBtnGroup;
    }

    ColumnLayout    {
        anchors.fill                            : parent;

        Rectangle   {
            id                                  : headerImgRect;
            Layout.fillWidth                    : true;
            Layout.preferredHeight              : 120;
//            anchors.top                         : parent.top;
            color                               : settings.neroHeleneColor;

            Image {
                width                           : parent.width;
                source                          : "qrc:/images/bg.png";
                fillMode                        : Image.PreserveAspectFit;
            }
        }


        Rectangle   {
//            anchors.top                         : headerImgRect.bottom;
            Layout.fillWidth                    : true;
            Layout.preferredHeight              : (root.height-headerImgRect.height)*dp;
            color                               : settings.silingBarBgColor;
            Controls_1_4.ScrollView {
                id                              : silingScrollView;
                width                           : parent.width;
                height                          : (parent.height - headerImgRect.height-1)*dp;
                horizontalScrollBarPolicy       : Qt.ScrollBarAlwaysOff;

                Column  {
                    id                          : colItems;
                    anchors.left                : parent.left;
                    width                       : root.width;
                    spacing                     : 0;

                    Label   {
                        id                      : labelItemDiscover;
                        width                   : parent.width;
                        height                  : 30*dp;
                        anchors.left            : parent.left;
                        anchors.leftMargin      : 10*dp;
                        verticalAlignment       : Label.AlignVCenter;
                        text                    : qsTr("发现");
                        font.family             : aweFont.name;
                        font.pixelSize          : 12*dp;
                        color                   : settings.itemBtnForceFontColor;

                    }

                    ListItemBtn {
                        id                      : home;
                        idName                  : "HOMEMENU";
                        symbolText              : "\uf015";
                        itemText                : "主页";
                        selected                : true;
                        ButtonGroup.group       : itemBtnGroup;

                       // Component.objectName    : home.firstSelected();
                    }
                    ListItemBtn {
                        id                      : nodes;
                        idName                  : "NODESMENU";
                        symbolText              : "\uf0c1";
                        itemText                : "节点";
                        ButtonGroup.group       : itemBtnGroup;
                    }

                    ListItemBtn {
                        id                      : datasSilingBtn;
                        idName                  : "DATASMENU";
                        symbolText              : "\uf1b2";
                        itemText                : "数据";
                        ButtonGroup.group       : itemBtnGroup;
                    }
                    Label   {
                        id                      : labelItemSett;
                        width                   : parent.width;
                        height                  : 30*dp;
                        anchors.left            : parent.left;
                        anchors.leftMargin      : 10*dp;
                        verticalAlignment       : Label.AlignVCenter;
                        text                    : qsTr("我的");
                        font.family             : aweFont.name;
                        font.pixelSize          : 12*dp;
                        color                   : settings.itemBtnForceFontColor;

                    }
                    ListItemBtn {
                        id                      : im;
                        idName                  : "IMMENU";
                        symbolText              : "\uf0c0";
                        itemText                : "聊天";
                        ButtonGroup.group       : itemBtnGroup;
                    }
                    ListItemBtn {
                        id                      : settMenu;
                        idName                  : "CONFMENU";
                        symbolText              : "\uf013";
                        itemText                : "设置";
                        ButtonGroup.group       : itemBtnGroup;
                    }
                    ListItemBtn {
                        id                      : im3;
                        idName                  : "IM3";
                        symbolText              : "\uf124";
                        itemText                : "关于";
                        ButtonGroup.group       : itemBtnGroup;
                    }
                    ListItemBtn {
                        id                      : im2;
                        idName                  : "IM2";
                        symbolText              : "\uf1a3";
                        itemText                : "huracan";
                        ButtonGroup.group       : itemBtnGroup;
                    }
                    ListItemBtn {
                        id                      : im4;
                        idName                  : "IM4";
                        symbolText              : "\uf1aa";
                        itemText                : "DAG";
                        ButtonGroup.group       : itemBtnGroup;
                    }

                    ListItemBtn {
                        id                      : im6;
                        idName                  : "IM6";
                        symbolText              : "\uf0c0";
                        itemText                : "聊天";
                        ButtonGroup.group       : itemBtnGroup;
                    }
                    ListItemBtn {
                        id                      : im7;
                        idName                  : "IM7";
                        symbolText              : "\uf0c0";
                        itemText                : "聊天";
                        ButtonGroup.group       : itemBtnGroup;
                    }
                    ListItemBtn {
                        id                      : im8;
                        idName                  : "IM8";
                        symbolText              : "\uf0c0";
                        itemText                : "聊天";
                        ButtonGroup.group       : itemBtnGroup;
                    }


                }
            }
        }

    }


}
