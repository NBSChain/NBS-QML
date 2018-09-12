import QtQuick 2.11
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.2

import "../Utils"
import "./SettingsPage"

/**
 * @file    DappSettingPage.qml
 * @version 1.0
 * @brief   设置页面
 * @date    2018-09-12
 * @author  lanbery
 * @section LICENSE Copyright (c) 2018 - 2025 lanbery,NBS Chain Co.
 */
ColumnLayout {
    property real   titleFontSize               : 16*dp;
    property real   normalFontSize              : 12*dp;
    property real   splitHeight                 : 0.5*dp;

    id                                          : root;
    anchors.fill                                : parent;
    spacing                                     : 5*dp;

    ButtonGroup {
        id                                      : nbsInterGrp;
    }

    /* Dapp 设置 */
    DappBaseConfigBoz {
        id                                      : dappBaseConfId;
        Layout.fillWidth                        : true;
        Layout.margins                          : 5*dp;
    }

    /* NBS NODE 设置 */
    NbsNodeBaseConfigBoz {
        id                                      : nbsNodeBaseConfId;
        Layout.fillWidth                        : true;
        Layout.margins                          : 5*dp;
    }

    GroupBox {
        id                                      : nodeBootstrapGrpBoz;
        Layout.fillWidth                        : true;
        Layout.fillHeight                       : true;
        Layout.margins                          : 5*dp;
        label: GrpBozLabel {
            anchors.left                        : parent.left;
            anchors.leftMargin                  : 15*dp;
            text                                : qsTr("Bootstrap 设置");
        }
    }

}
