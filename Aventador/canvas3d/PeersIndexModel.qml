import QtQml.Models 2.3

/**
 * nbs-qml
 * @file
 * @version 1.0
 * @brief
 * @date    2018-09-29
 * @author  lanbery
 * @section LICENSE Copyright (c) 2018 - 2025 lanbery,NBS Chain Co.
 */
ListModel {
    ListElement {
        name: "Sun"
        planetImageSource: "images/sun.png"
        planetNumber: 0
        hash:"QmcZ7vMAKR6PpZKSDmYnTstue1Ep1PAxVD7ZE24EyZ6dDv";
        storage:"200 GB";
        gcPeriod:"";
        connectedPeers:91201
        remark:""
    }
    ListElement {
        name: "Mercury"
        planetImageSource: "images/mercury.png"
        planetNumber: 1
        hash:"QmTbnijn8FbypfwQFMh8q95bdmbGfhB2mqmj5yMGH8gJwP";
        storage:"10 GB";
        gcPeriod:"1 h";
        connectedPeers:397
        remark:""
    }
    ListElement {
        name: "Venus"
        planetImageSource: "images/venus.png"
        planetNumber: 2
        hash:"QmeXAY4x7Jk7MLwy9se8tqfccj2q183njXbQFmzYnRyyeV";
        storage:"5 GB";
        gcPeriod:"1 h";
        connectedPeers:229
        remark:""

    }
    ListElement {
        name: "Earth"
        planetImageSource: "images/earth.png"
        planetNumber: 3
        hash:"QmbTnWZJPCEuxsjt95SdUK7r7Jvy6kbWPDmim8g6gPJSiw";
        storage:"10 GB";
        gcPeriod:"12 h";
        connectedPeers:128
        remark:""
    }
    ListElement {
        name: "Mars"
        planetImageSource: "images/mars.png"
        planetNumber: 4
        hash:"QmcZ4ouKCjVV83dz6VD1yTWDM7t5NZBQarEvVM21CMvoH3";
        storage:"10 GB";
        gcPeriod:"10 h";
        connectedPeers:323
        remark:""
    }
    ListElement {
        name: "Jupiter"
        planetImageSource: "images/jupiter.png"
        planetNumber: 5
        hash:"QmeqHVtXNNxFQriELW9maLjawKeA9ZerPFh5kgnpRvEbdY";
        storage:"50 GB";
        gcPeriod:"1 h";
        connectedPeers:672
        remark:""

    }
    ListElement {
        name: "Saturn"
        planetImageSource: "images/saturn.png"
        planetNumber: 6
        hash:"QmTbnijn8FbypfwQFMh8q95bdmbGfhB2mqmj5yMGH8gJwP";
        storage:"10 GB";
        gcPeriod:"1 h";
        connectedPeers:245
        remark:""

    }
    ListElement {
        name: "Uranus"
        planetImageSource: "images/uranus.png"
        planetNumber: 7
        hash:"QmTvKBRenNcLAqHk5cGgRjKrg2mi2hUEPg65GMWZWybDuF";
        storage:"10 GB";
        gcPeriod:"1 h";
        connectedPeers:78
        remark:""

    }
    ListElement {
        name: "Neptune"
        planetImageSource: "images/neptune.png"
        planetNumber: 8
        hash:"QmdHM3HUr887KV8R2kBRkTEwJbWBQ5wjNMvH2ZAd5BGicz";
        storage:"10 GB";
        gcPeriod:"1 h";
        connectedPeers:129
        remark:""

    }
    ListElement {
        name: "NBS Chain"
        planetImageSource: "images/nbsstar160.png"
        planetNumber: 100 // Defaults to solar system
        storage:"192.45 TB";
        connectedPeers:19702
        remark:""
    }
}
