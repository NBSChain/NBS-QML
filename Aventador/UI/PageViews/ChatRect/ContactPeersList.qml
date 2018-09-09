import QtQuick 2.11
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.2
import SortFilterProxyModel 0.2


/**
 * @file    ContactPeersList.qml
 * @version 1.0
 * @brief   左侧联系人列表
 * @date    2018-09-09
 * @author  lanbery
 * @section LICENSE Copyright (c) 2018 - 2025 lanbery,NBS Chain Co.
 */
ColumnLayout {
    anchors.fill                                            : parent;
    spacing                                                 : 0;

    property alias      filterFavorite                      : searchBar.filterFavorite;
    property alias      searchText                          : searchBar.text;

    SearchBar   {
        id                                                  : searchBar;
        normalBgColor                                       : settings.grigioLynxColor;
        Layout.fillWidth                                    : true;
        z                                                   : 1;
    }

    /* */
    ListView    {
        id                                                  : peersListView;
        Layout.fillWidth                                    : true;
        Layout.fillHeight                                   : true;
    }
}


