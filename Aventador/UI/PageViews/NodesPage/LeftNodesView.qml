import QtQuick 2.11
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import SortFilterProxyModel 0.2

import "../../DataModels"

/**
 * @file    LeftNodesView.qml
 * @version 1.0
 * @brief   摘要
 *
 * @date    2018-09-12
 * @author  lanbery
 * @section LICENSE Copyright (c) 2018 - 2025 lanbery,NBS Chain Co.
 */
Rectangle {
    id                                              : rootNodesRect;
    color                                           : normalBgColor;

    NodeInfoModel {
        id                                          : nodeModel;
    }

    SortFilterProxyModel {
        id                                          : proxyModel;
        sourceModel                                 : nodeModel;

        sorters : [
            RoleSorter {
                roleName        : "storageOnly";
                sortOrder       : Qt.DescendingOrder;
            },
            StringSorter    {roleName: "hash58"},
            StringSorter    {roleName: "locations"}
        ]

        filters : [
            ValueFilter {
                id                  : storageFilter;
                roleName            : "storageOnly";
                enabled             : searchBar.filterStorage;
                value               : true;
            },
            AnyOf   {
                RegExpFilter    {
                    roleName        : "hash58";
                    pattern         : "^Qm"+searchBar.text;
                    caseSensitivity : Qt.CaseInsensitive;
                }
                RegExpFilter    {
                    roleName        : "locations";
                    pattern         : "^"+searchBar.text;
                    caseSensitivity : Qt.CaseInsensitive;
                }
            }
        ]

        proxyRoles : SwitchRole {
            name                    : "sectionRole";
            filters                 : ValueFilter {
                roleName            : "storageOnly";
                value               : true;
                SwitchRole.value    : "*";
            }
            defaultRoleName         : "hash58";
        }
    }

    /* UI View */
    ColumnLayout    {
        anchors.fill                : parent;
        spacing                     : 0;
        SearcherBar    {
            id                      : searchBar;
            Layout.preferredHeight  : 32*dp;
            normalBgColor           : Qt.lighter(settings.grigioLynxColor);
            Layout.fillWidth        : true;
            z                       : 1;
        }

        ListView    {
            id                      : listView;
            Layout.fillWidth        : true;
            Layout.fillHeight       : true;
            clip                    : true;
            model                   : proxyModel;
            delegate                : NodeInFoDelegate {
                id                  : nodelDelegate;
                bgColor             : color;
                normalbgColor       : color;
            }
            focus                   : true;

            highlight               : Rectangle {
                color               : Qt.lighter(settings.grigioLynxColor);
                opacity             : 0.35;
                z                   : listView.z + 2;
            }
        }
    }
}
