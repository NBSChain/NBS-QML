import QtQuick 2.11
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import SortFilterProxyModel 0.2

import "../../DataModels"

Rectangle {
    id                                      : root;
    color                                   : settings.silingBarBgColor;

    ContactPeerModel    {
        id                                  : peersModel;
    }

    SortFilterProxyModel    {
        id                                  : proxyModel;
        sourceModel                         : peersModel;

        sorters : [
            RoleSorter  {
                roleName    : "favorite";
                sortOrder   : Qt.DescendingOrder;
            },
            StringSorter {roleName: "nickName"},
            StringSorter {roleName: "hash58"}
        ]
        filters : [
            ValueFilter {
                id                          : favFilter;
                roleName                    : "favorite";
                enabled                     : searchBar.filterFavorite;
                value                       : true;
            },
            AnyOf   {
                RegExpFilter    {
                    roleName                : "nickName";
                    pattern                 : "^" + searchBar.text;
                    caseSensitivity         : Qt.CaseInsensitive;
                }
                RegExpFilter    {
                    roleName                : "hash58";
                    pattern                 : "^" + searchBar.text;
                    caseSensitivity         : Qt.CaseInsensitive;
                }
            }
        ]
        proxyRoles  : SwitchRole {
            name                            : "sectionRole";
            filters                         : ValueFilter {
                roleName                    : "favorite";
                value                       : true;
                SwitchRole.value            : "*";
            }
            defaultRoleName                 : "nickName";
        }
    }

    ColumnLayout {
        anchors.fill                                            : parent;
        spacing                                                 : 0;
        SearchBar   {
            id                                                  : searchBar;
            normalBgColor                                       : Qt.lighter(settings.grigioLynxColor);
            Layout.fillWidth                                    : true;
            z                                                   : 1;
        }

        /* */
        ListView    {
            id                                                  : peersListView;
            Layout.fillWidth                                    : true;
            Layout.fillHeight                                   : true;
            clip                                                : true;
            model                                               : proxyModel;
            delegate                                            : PeerDelegate {id:delegate;bgColor: color;normalbgColor: color;}
            focus                                               : true;

            highlight   : Rectangle {
                color                                           : Qt.lighter(settings.grigioLynxColor);
                opacity                                         : 0.35;
                z                                               : peersListView.z +2;
            }

//            ScrollBar.vertical: {

//            }

        }

    }
}
