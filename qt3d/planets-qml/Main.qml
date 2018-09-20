import QtQuick 2.0
import QtQuick.Window 2.11
import QtQuick.Layouts 1.3

Window {
    visible: true
    ColumnLayout {
        id              : mainWindow;
        anchors.fill: parent;


        Rectangle {
            id          : topbar;
            Layout.fillWidth: true;
            Layout.minimumHeight: 40;
            Layout.maximumHeight: 40;
            Layout.preferredHeight: 40;
            color : "red";
        }

        Rectangle {
            id  :mainID;
            Layout.fillWidth: true;
            Layout.fillHeight: true;

            PlanetsMain {
                anchors.fill: parent;

            }

        }
    }
}
