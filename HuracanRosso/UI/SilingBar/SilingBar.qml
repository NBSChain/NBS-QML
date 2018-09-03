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

                    ListItemBtn {
                        id                      : home;
                        idName                  : "HOME";
                        symbolText              : "\uf015";
                        itemText                : "主页";
                        selected                : true;
                        ButtonGroup.group       : itemBtnGroup;

                       // Component.objectName    : home.firstSelected();
                    }
                    ListItemBtn {
                        id                      : nodes;
                        idName                  : "MEDIA";
                        symbolText              : "\uf0c1";
                        itemText                : "节点";
                        ButtonGroup.group       : itemBtnGroup;
                    }

                    ListItemBtn {
                        id                      : im;
                        idName                  : "IM";
                        symbolText              : "\uf0c0";
                        itemText                : "聊天";
                        ButtonGroup.group       : itemBtnGroup;
                    }
                    ListItemBtn {
                        id                      : im1;
                        idName                  : "IM1";
                        symbolText              : "\uf0c0";
                        itemText                : "聊天";
                        ButtonGroup.group       : itemBtnGroup;
                    }
                    ListItemBtn {
                        id                      : im2;
                        idName                  : "IM2";
                        symbolText              : "\uf0c0";
                        itemText                : "聊天";
                        ButtonGroup.group       : itemBtnGroup;
                    }
                    ListItemBtn {
                        id                      : im3;
                        idName                  : "IM3";
                        symbolText              : "\uf0c0";
                        itemText                : "聊天";
                        ButtonGroup.group       : itemBtnGroup;
                    }
                    ListItemBtn {
                        id                      : im4;
                        idName                  : "IM4";
                        symbolText              : "\uf0c0";
                        itemText                : "聊天";
                        ButtonGroup.group       : itemBtnGroup;
                    }
                    ListItemBtn {
                        id                      : im5;
                        idName                  : "IM5";
                        symbolText              : "\uf0c0";
                        itemText                : "聊天";
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
