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
        switch(name){
        case "aboutPageMenu":
            if(currentViewName!==name)
                mainViewRouter("qrc:/UI/PageViews/AboutPage.qml",{});
            break;
        case "chatMenu":
            if(currentViewName!==name)
                mainViewRouter("qrc:/UI/PageViews/ChatPage.qml",{});
            break;
        case "nodeMenu":
            if(currentViewName!==name)
                mainViewRouter("qrc:/UI/PageViews/NodeIndexPage.qml",{});
            break;
        case "dataMenu":
            if(currentViewName !== name)
                mainViewRouter("qrc:/UI/PageViews/DataShareIndexPage.qml",{});
            break;
        case "dagMenu" :
            if(currentViewName!==name)
                mainViewRouter("qrc:/UI/PageViews/Developing.qml",{});
            break;
        case "settMenu":
            if(currentViewName!==name)
                mainViewRouter("qrc:/UI/PageViews/DappSettingPage.qml",{});
            break;
        default:
            if(currentViewName!==name)
                mainViewRouter("qrc:/UI/PageViews/Developing.qml",{});
            break;
        }

        currentViewName = name;
    }

    ButtonGroup     {
        id                                      : itemBtnGroup;
    }

    ColumnLayout    {
        anchors.fill                            : parent;
        spacing                                 : 0;

        /* header */
        Label   {
            id                                  : headerImgRect;
            Layout.fillWidth                    : true;
            Layout.maximumWidth                 : 320*dp;
            Layout.preferredHeight              : 120*dp;
            Layout.maximumHeight                : 120*dp;
            color                               : settings.neroHeleneColor;
            background                          : Rectangle   {
                anchors.fill                    : parent;
                color                           : parent.color;
                Image {
                    Layout.fillWidth                : true;
                    height                          : parent.height;
                    source                          : "qrc:/images/nbs_header.png";
                    fillMode                        : Image.PreserveAspectFit;
                    z                               : 2;
                }
            }
            ColumnLayout  {
                anchors.fill                            : parent;
                spacing                                 : 0*dp;
                Label   {
                    id                                  : avatarRectID;
                    Layout.fillWidth                    : true;
                    Layout.fillHeight                   : true;
                    Layout.minimumHeight                : 80*dp;
                    Layout.maximumHeight                : 80*dp;
                    Layout.preferredHeight              : 80*dp;

                    background:  Rectangle {
                        anchors.centerIn                    : parent;
                        height                              : 60*dp;
                        width                               : 60*dp;
                        color                               : Qt.lighter("#ffffff");
                        radius                              : 30*dp;
                        Image {
                            anchors.fill                    : parent;
                            source                          : "http://www.lanbery.cn/img/lamborghini_logo.png";
                            fillMode                        : Image.PreserveAspectFit;
                        }
                    }
                }


                Text    {
                    Layout.fillHeight                   : true;
                    Layout.fillWidth                    : true;
                    Layout.minimumHeight                : 36*dp;
                    Layout.preferredHeight              : 36*dp;
                    text                                : "Lanbery cai";
                    color                               : foregroundColor;
                    wrapMode                            : Text.Wrap;
                    font    {
                        family                          : aweFont.name;
                        pixelSize                       : 16*dp;
                    }
                    horizontalAlignment                 : Text.AlignHCenter;
                }
            }
        }

        /* 功能菜单 */
        Rectangle   {
//            anchors.top                         : headerImgRect.bottom;
            Layout.fillWidth                    : true;
            Layout.fillHeight                   : true;
            Layout.preferredHeight              : (root.height-headerImgRect.height)*dp;

            height                              : (root.height-headerImgRect.height)*dp;
            color                               : settings.silingBarBgColor;
            Controls_1_4.ScrollView {
                id                              : silingScrollView;
                width                           : parent.width;
                height                          : (520-164)*dp;
                horizontalScrollBarPolicy       : Qt.ScrollBarAlwaysOff;
                verticalScrollBarPolicy         : Qt.ScrollBarAsNeeded;

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
                        anchors.leftMargin      : 11*dp;

                        verticalAlignment       : Label.AlignVCenter;
                        text                    : qsTr("网络");
                        font.family             : aweFont.name;
                        font.pixelSize          : 12*dp;
                        color                   : settings.foregroundColor;

                    }

                    ListItemBtn {
                        id                      : nodes;
                        idName                  : "nodeMenu";
                        symbolText              : "\uf1aa";
                        itemText                : "节点";
                        ButtonGroup.group       : itemBtnGroup;

                    }
                    ListItemBtn {
                        id                      : chatMenu;
                        idName                  : "chatMenu";
                        symbolText              : "\uf0c0";
                        itemText                : "聊天";
                        ButtonGroup.group       : itemBtnGroup;
                    }
                    ListItemBtn {
                        id                      : datasSilingBtn;
                        idName                  : "dataMenu";
                        symbolText              : "\uf20e";//\f20e;uf1b2
                        itemText                : "数据";
                        ButtonGroup.group       : itemBtnGroup;
                    }

                    Label   {
                        id                      : labelItemSett;
                        width                   : parent.width;
                        height                  : 28*dp;
                        anchors.left            : parent.left;
                        anchors.leftMargin      : 11*dp;
                        verticalAlignment       : Label.AlignVCenter;
                        text                    : qsTr("系统");
                        font.family             : aweFont.name;
                        font.pixelSize          : 12*dp;
                        color                   : settings.foregroundColor;

                    }

                    ListItemBtn {
                        id                      : settMenu;
                        idName                  : "settMenu";
                        symbolText              : "\uf013";
                        itemText                : "设置";
                        ButtonGroup.group       : itemBtnGroup;
                    }
                    ListItemBtn {
                        id                      : aboutMenu;
                        idName                  : "aboutPageMenu";
                        symbolText              : "\uf124";
                        itemText                : "关于";
                        ButtonGroup.group       : itemBtnGroup;
                    }

                    ListItemBtn {
                        id                      : dagMenu;
                        idName                  : "dagMenu";
                        symbolText              : "\uf0c1";
                        itemText                : "DAG";
                        ButtonGroup.group       : itemBtnGroup;
                    }
                    ListItemBtn {
                        id                      : storeMenu;
                        idName                  : "storeMenu";
                        symbolText              : "\uf1b3";
                        itemText                : "存储市场";
                        ButtonGroup.group       : itemBtnGroup;
                    }

                    ListItemBtn {
                        id                      : im6;
                        idName                  : "searchMarket";
                        symbolText              : "\uf2dc";
                        itemText                : "检索市场";
                        ButtonGroup.group       : itemBtnGroup;
                    }

                    ListItemBtn {
                        id                      : im2;
                        idName                  : "IMXXX";
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
                             font.pixelSize     : 11*dp;
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

