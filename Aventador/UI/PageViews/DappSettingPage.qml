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
        label   :  GrpBozLabel {
            text                                : qsTr("Bootstrap 设置");
            anchors.left                        : parent.left;
            anchors.leftMargin                  : 15*dp;
            Layout.preferredWidth               : 200*dp;
        }

        ListModel {
            id          : bootstrapModels;
            ListElement {addr : "/ip4/47.52.172.234/tcp/4001/ipfs/QmcZ7vMAKR6PpZKSDmYnTstue1Ep1PAxVD7ZE24EyZ6dDv"};
            ListElement {addr : "/ip4/93.108.33.59/tcp/4001/ipfs/QmeUTyuWTNL3NGyQUZ1WisL59z9rkJnXTXDViJEZLfjNgn"};
            ListElement {addr : "/ip4/95.179.139.23/tcp/34171/ipfs/QmPENzaWtRZh5KMUpnxjeMFfRW7VbeNPJrJnj1Bmk621Ej"};
            ListElement {addr : "/dnsaddr/bootstrap.libp2p.io/ipfs/QmNnooDu7bfjPFoTZYxMNLWUQJyrVwtbZg5gBMjTezGAJN"};
            ListElement {addr : "/dnsaddr/bootstrap.libp2p.io/ipfs/QmcZf59bWwK5XFi76CZX8cbJ4BhTzzA3gU1ZjYZcYW3dwt"};
            ListElement {addr : "/ip4/104.236.179.241/tcp/4001/ipfs/QmSoLPppuBtQSGwKDZT2M73ULpjvfd3aZ6ha4oFGL1KrGM"};
        }

        ScrollView {
            anchors.fill: parnt;

            ListView {

            }
        }
    }

}
