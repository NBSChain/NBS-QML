import QtQuick 2.11
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.2
import QtGraphicalEffects 1.0

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
    property color      normalbgColor               : settings.silingBarBgColor;
    property color      forceFontColor              : settings.itemBtnForceFontColor;
    property color      hoveredBGColor              : settings.hoveredBgColorGray;

    id                                              : delegate;
    text                                            : model.nickName;

    Material.elevation                              : 1;
    Material.background                             : Qt.lighter(settings.neroHeleneColor);

    width                                           : parent ? parent.width : 0;
    leftPadding                                     : 10*dp;
    rightPadding                                    : 0*dp;

    contentItem : RowLayout {
        spacing                                     : 5*dp;

        Rectangle   {
            id                                      : avatarRect;
            height                                  : delegate.height;
            width                                   : height;
            color                                   : Qt.lighter(bgColor);

            Image   {
                id                                  : avatarView;
                anchors.fill                        : parent;
                source                              : (model.avatar !== "") ? model.avatar : "qrc:/images/logo.png";
                fillMode                            : Image.PreserveAspectFit;

            }

            Rectangle   {
                id                                  : imageMask;
                anchors.fill                        : parent;
                radius                              : 10*dp;
                visible                             : true;
                clip                                : true;
            }

            OpacityMask {
                anchors.fill                        : avatarRect;
                source                              : avatarView;
                maskSource                          : imageMask;
                visible                             : true;
                antialiasing                        : true;
                clip                                : true;
            }
        }

        ColumnLayout   {
           // anchors.fill                        : parent;
            Layout.fillWidth                        : true;
            Layout.fillHeight                       : true;
            spacing                                 : 5*dp;

            Text    {
                id                              : hash58Label;
                text                            : model.hash58;
                Layout.fillWidth                : true;
                Layout.minimumHeight            : 10*dp;
                Layout.preferredHeight          : 10*dp;
                Layout.maximumWidth             : 200*dp;
                color                           : forceFontColor
                elide                           : Text.ElideMiddle;
                wrapMode                        : Text.WrapAnywhere;

                font    {
                    family                      : aweFont.name;
                    pixelSize                   : 8*dp;
                }
            }

            Text    {
                id                              : nickNameLabel;
                text                            : delegate.text;
                color                           : foregroundColor;
                Layout.fillWidth                : true;
                Layout.fillHeight               : true;
                Layout.minimumHeight            : 14*dp;
                Layout.preferredHeight          : 14*dp;
                font    {
                    family                      : aweFont.name;
                    pixelSize                   : 12*dp;
                }
                verticalAlignment               : Text.AlignVCenter;
            }

        }

    }
}
