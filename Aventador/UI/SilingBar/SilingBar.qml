import QtQuick 2.11
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import QtQuick.Controls 1.4 as Controls_1_4
import QtQuick.Controls.Styles 1.4

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
    id                                          : root;
    property string         currentViewName     : "";
    width                                       : parent.width;
    height                                      : parent.height;
    color                                       : settings.neroHeleneColor;
    readonly property real  itemHeight          : 26*dp;
    readonly property real  itemFontSize        : 26*dp;
    property real           scrollBarHeight;


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

        /* 功能菜单 */
        Rectangle   {
//            anchors.top                         : headerImgRect.bottom;
            Layout.fillWidth                    : true;
            Layout.fillHeight                   : true;
            Layout.preferredHeight              : (root.height-headerImgRect.height-10)*dp;

            height                              : (root.height-headerImgRect.height-10)*dp;
            color                               : settings.silingBarBgColor;
            Controls_1_4.ScrollView {
                id                              : silingScrollView;
                width                           : parent.width;

                height                          : (520-120)*dp;
                horizontalScrollBarPolicy       : Qt.ScrollBarAlwaysOff;
                verticalScrollBarPolicy         : Qt.ScrollBarAlwaysOn;

                Column  {
                    id                          : colItems;
                    anchors.left                : parent.left;
                    width                       : root.width;
                    spacing                     : 0;

                    Label   {
                        id                      : labelItemDiscover;
                        width                   : parent.width;
                        height                  : 28*dp;
                        anchors.left            : parent.left;
                        anchors.leftMargin      : 10*dp;
                        verticalAlignment       : Label.AlignVCenter;
                        text                    : qsTr("网络");
                        font.family             : aweFont.name;
                        font.pixelSize          : 12*dp;
                        color                   : settings.foregroundColor;

                    }

//                    ListItemBtn {
//                        id                      : home;
//                        idName                  : "HOMEMENU";
//                        symbolText              : "\uf015";
//                        itemText                : "主页";
//                        selected                : true;
//                        ButtonGroup.group       : itemBtnGroup;

//                       // Component.objectName    : home.firstSelected();
//                    }
                    ListItemBtn {
                        id                      : nodes;
                        idName                  : "NODESMENU";
                        symbolText              : "\uf1aa";
                        itemText                : "节点";
                        ButtonGroup.group       : itemBtnGroup;

                    }
                    ListItemBtn {
                        id                      : im;
                        idName                  : "IMMENU";
                        symbolText              : "\uf0c0";
                        itemText                : "聊天";
                        ButtonGroup.group       : itemBtnGroup;
                    }
                    ListItemBtn {
                        id                      : datasSilingBtn;
                        idName                  : "DATASMENU";
                        symbolText              : "\uf20e";//\f20e;uf1b2
                        itemText                : "数据";
                        ButtonGroup.group       : itemBtnGroup;
                    }

                    Label   {
                        id                      : labelItemSett;
                        width                   : parent.width;
                        height                  : 28*dp;
                        anchors.left            : parent.left;
                        anchors.leftMargin      : 10*dp;
                        verticalAlignment       : Label.AlignVCenter;
                        text                    : qsTr("系统");
                        font.family             : aweFont.name;
                        font.pixelSize          : 12*dp;
                        color                   : settings.foregroundColor;

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
                        id                      : im4;
                        idName                  : "IM4";
                        symbolText              : "\uf0c1";
                        itemText                : "DAG";
                        ButtonGroup.group       : itemBtnGroup;
                    }
                    ListItemBtn {
                        id                      : im7;
                        idName                  : "IM7";
                        symbolText              : "\uf1b3";
                        itemText                : "存储";
                        ButtonGroup.group       : itemBtnGroup;
                    }

                    ListItemBtn {
                        id                      : im6;
                        idName                  : "IM6";
                        symbolText              : "\uf2dc";
                        itemText                : "mmm";
                        ButtonGroup.group       : itemBtnGroup;
                    }

                    ListItemBtn {
                        id                      : im2;
                        idName                  : "IM2";
                        symbolText              : "\uf1a3";
                        itemText                : "huracan";
                        ButtonGroup.group       : itemBtnGroup;
                    }
                    /* 收藏夹 */
                    Rectangle   {
                        id                      : favorateItemRect;
                        height                  : 28*dp;
                        width                   : parent.width;
                        color                   : settings.silingBarBgColor;
                        Label   {
                             id                 : favorateIconLabel;
                             //width              : 40*dp;
                             height             : parent.height;
                             verticalAlignment  : Label.AlignVCenter;
                             anchors    {
                                 left           : parent.left;
                                 leftMargin     : 5*dp;
                                 rightMargin    : 0*dp;
                             }
                             text               : "\uf2a1";
                             font.family        : aweFont.name;
                             font.pixelSize     : 12*dp;
                             color              : settings.foregroundColor;

                        }

                        Label   {
                            //width                   : 60*dp;
                            height              : parent.height;
                            anchors.left        : favorateIconLabel.right;
                            anchors.leftMargin  : 5*dp;
                            horizontalAlignment : Label.AlignLeft;
                            verticalAlignment   : Label.AlignVCenter;
                            text                : qsTr("收藏");
                            font.family         : aweFont.name;
                            font.pixelSize      : 12*dp;
                            color               : settings.foregroundColor;
                        }
                    }


                    ListItemBtn {
                        id                      : favItemMov;
                        idName                  : "FAVMOVIES";
                        symbolText              : "\uf03d";
                        itemText                : "视频";
                        ButtonGroup.group       : itemBtnGroup;
                    }
                    ListItemBtn {
                        id                      : favItemMusic;
                        idName                  : "FAVMUSIC";
                        symbolText              : "\uf001";
                        itemText                : "音乐";
                        ButtonGroup.group       : itemBtnGroup;
                    }
                    ListItemBtn {
                        id                      : favItemPic;
                        idName                  : "FAVPICS";
                        symbolText              : "\uf03e";
                        itemText                : "图片";
                        ButtonGroup.group       : itemBtnGroup;
                    }

                    ListItemBtn {
                        id                      : favItemDocs;
                        idName                  : "FAVDOCS";
                        symbolText              : "\uf0c5";
                        itemText                : "文档";
                        ButtonGroup.group       : itemBtnGroup;
                    }

                    ListItemBtn {
                        id                      : favItemIpsn;
                        idName                  : "FAVIPSN";
                        symbolText              : "\uf0e8";
                        itemText                : "IPSN";
                        ButtonGroup.group       : itemBtnGroup;
                    }

                }

                style   : ScrollViewStyle   {
                    handle                      : Rectangle {
                        implicitHeight          : 0;
                        implicitWidth           : 3*dp;
                        color                   : settings.grigioLynxColor;
                        radius                  : 3*dp;
                        anchors.fill            : parent;
                        anchors.top             : parent.top;
                        anchors.right           : parent.right;
                    }
                    scrollBarBackground         : Rectangle {
                        anchors.top             : parent.top;
                        anchors.right           : parent.right;
                        implicitWidth           : 3*dp;
                        implicitHeight          : 0;
                        color                   : settings.neroHeleneColor;
                    }

                    decrementControl            : Rectangle {
                        implicitWidth           : 0;
                        implicitHeight          : 0;
                    }
                    incrementControl            : Rectangle {
                        implicitWidth           : 0;
                        implicitHeight          : 1;
                    }
                }
            }
        }

    }

    function setSilingScrollViewHeight(h){
        silingScrollView.height = h;
    }

}

