import QtQuick 2.11
import QtQuick.Controls 2.2
import QtQuick.Controls 1.4 as Controls_1_4
import QtQuick.Layouts 1.3
import QtQuick.Controls.Styles 1.4

Item    {
    property alias      text                : searchTextField.text;

    Label {
        anchors.centerIn        : parent;
        width                   : 320*dp;
        height                  : 22*dp;

        background: RowLayout {
            spacing             : 10*dp;
            Controls_1_4.TextField {
                Layout.fillHeight               : true;
                Layout.fillWidth                : true;
                id                              : searchTextField;
                textColor                       : foregroundColor;

                placeholderText                 : qsTr("请输入文件名称或hash值...");
                style   : TextFieldStyle {
                    placeholderTextColor        : settings.itemBtnForceFontColor;
                    background: Rectangle {
                        color           : settings.silingBarBgColor;
                        border.color    : settings.hoveredBgColorGray;
                        radius          : 5*dp;
                    }
                }
                font    {
                    family              : aweFont.name;
                    pixelSize           : 14*dp;
                }

            }

            Text {
                text                        : "\uf002";
                color                       : foregroundColor;
                Layout.preferredWidth       : 20*dp;
                Layout.minimumWidth         : 20*dp;

                font {
                    family                  : aweFont.name;
                    pixelSize               : 16*dp;
                }
            }
        }
    }

}
