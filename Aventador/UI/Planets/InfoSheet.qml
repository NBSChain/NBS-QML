/****************************************************************************
**
** Copyright (C) 2016 The Qt Company Ltd.
** Contact: https://www.qt.io/licensing/
**
** This file is part of the Qt3D module of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:BSD$
** Commercial License Usage
** Licensees holding valid commercial Qt licenses may use this file in
** accordance with the commercial license agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and The Qt Company. For licensing terms
** and conditions see https://www.qt.io/terms-conditions. For further
** information use the contact form at https://www.qt.io/contact-us.
**
** BSD License Usage
** Alternatively, you may use this file under the terms of the BSD license
** as follows:
**
** "Redistribution and use in source and binary forms, with or without
** modification, are permitted provided that the following conditions are
** met:
**   * Redistributions of source code must retain the above copyright
**     notice, this list of conditions and the following disclaimer.
**   * Redistributions in binary form must reproduce the above copyright
**     notice, this list of conditions and the following disclaimer in
**     the documentation and/or other materials provided with the
**     distribution.
**   * Neither the name of The Qt Company Ltd nor the names of its
**     contributors may be used to endorse or promote products derived
**     from this software without specific prior written permission.
**
**
** THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
** "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
** LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
** A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
** OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
** SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
** LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
** DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
** THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
** (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
** OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE."
**
** $QT_END_LICENSE$
**
****************************************************************************/

import QtQuick 2.0

Item {
    id: infoSheet

    width: 280
    height: 450
    anchors.verticalCenter: parent.verticalCenter

    property alias planet: planetText.planet
    property alias radius: infoText.radius
    property alias temperature: infoText.temperature
    property alias orbitalPeriod: infoText.orbitalPeriod
    property alias distance: infoText.distance
    property alias exampleDetails: infoText.exampleDetails

    Behavior on opacity { PropertyAnimation {} }

    //color: "black"

    Text {
        id: planetText
        anchors.top: parent.top
        anchors.topMargin: 20
        anchors.horizontalCenter: parent.horizontalCenter

        property string planet: ""

        font.family: "Helvetica"
        font.pixelSize: 30
        font.weight: Font.Light
        color: "white"

        text: "<p>" + planet + "</p>"
    }

    Text {
        id: infoText
        anchors.top: planetText.bottom
        //anchors.horizontalCenter: parent.horizontalCenter

        property string radius: ""
        property string temperature: ""
        property string orbitalPeriod: ""
        property string distance: ""
        property string exampleDetails: ""

        font.family: "Helvetica"
        font.pixelSize: 14
        font.weight: Font.Light
        lineHeight: 1.625 * 14
        lineHeightMode: Text.FixedHeight
        color: "white"
        wrapMode: Text.Wrap;
        text: {
            if (planet == "NBS Chain") {
                "<p>" + exampleDetails + "</p>"
            } else if (planet == "Core") {
                "<h2><font color=\"blue\">NBS Chain Core Network</font></h2></br>"
                + "<p>总容量: " + radius + "</p></br>"
                + "<p>节点数量: " + temperature + "</p>"
            } else {
                "<p>HASH :</p>" + distance + "</p></br>"
                + "<p>容量 :" + radius + "</p></br>"
                + "<p>热度 :" + temperature + "</p></br>"
                + "<p>回收周期: " + orbitalPeriod + "</p></br>"

            }
        }

        onLinkActivated: Qt.openUrlExternally(link)
    }
}

