import QtQuick 2.2
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import "."

/*!
 * @Author  : lanbery
 * @Date    : 2018-08-28
 * @Description
 * 导航菜单
 */
ToolBar {
    property alias title    : titleLabel.text

    property var inline     : ToolBar {
        id          : i
        visible     : false
        position    : ToolBar.Header
    }


}
