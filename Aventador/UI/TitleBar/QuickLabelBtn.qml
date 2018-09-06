import QtQuick 2.11
import QtQuick.Controls 2.2

/**
 * @file    QuickLabelBtn.qml
 * @version 1.0
 * @brief   快捷导航Button
 * @date    2018-09-03
 * @author  lanbery
 * @section LICENSE Copyright (c) 2018 - 2025 lanbery,NBS Chain Co.
 */
Button {
    //property var    qlbtnClicked                : (function(name){});
    property bool   selected                    : false;//

    property color  _normalFontColor            : settings.itemBtnForceFontColor;
    property color  _normalBgColor              : settings.grigioLynxColor;
    property color  _activedBgColor             : settings.rossoMarsColor;
    property color  _activedFontColor           : settings.foregroundColor;

    property string idName;
    property string labelText;

    id                                          : qlbtnRoot;
    width                                       : 50*dp;
    height                                      : parent.height;

    signal  qlbtnClicked(string name);

    background  : Rectangle {
        id                                          : qlBtnBg;
        color                                       : selected ? _activedBgColor : _normalBgColor;

        Label   {
            anchors.centerIn                        : parent;
            id                                      : quickLabel;
            text                                    : labelText;
            color                                   : selected ? _activedFontColor : _normalFontColor;
            font    {
                family                              : aweFont.name;
                pixelSize                           : 16*dp;
            }
            verticalAlignment                       : Label.AlignVCenter;
            horizontalAlignment                     : Label.AlignHCenter;
        }

        MouseArea   {
            id                                      : qlbtnMouseArea;
            anchors.fill                            : parent;
            hoverEnabled                            : true;
            cursorShape                             : Qt.PointingHandCursor;

            onEntered   : {
                if(!selected){
                    quickLabel.color                = _activedFontColor;
                }
            }

            onExited    : {
                if(!selected){
                    quickLabel.color                = _normalFontColor;
                }
            }

            onClicked   : {
                selected                            = true;
                quickLabel.color                    = _activedFontColor;
                qlBtnBg.color                       = _activedBgColor;
                qlbtnClicked(idName);
            }
        }
    }



    function    reset(){
        selected                = false;
        qlBtnBg.color           = _normalBgColor;
        quickLabel.color        = _normalFontColor;
    }

    Component.onCompleted                           : {
        qlbtnRoot.qlbtnClicked.connect(qlbtnGroupClicked);
    }


}
