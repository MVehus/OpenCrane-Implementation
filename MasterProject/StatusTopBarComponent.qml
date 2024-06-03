import QtQuick 2.15

Item {
    property bool automaitc: false
    property bool manual: false
    property bool parked: false

    property bool gantry: false
    property bool trolley: false
    property bool hoist: false

    id: statusTopBarContainer
    width: 760; height: 30

    MouseArea {
        anchors.fill: statusTopBarContainer
        onClicked: statusTopBarContainer.focus = true
    }

    Keys.onPressed: (event)=> {
        if (event.key === Qt.Key_M) {
            statusTopBarContainer.automaitc = false;
            statusTopBarContainer.manual = true;
            statusTopBarContainer.parked = false;
        }
        else if (event.key === Qt.Key_A) {
            statusTopBarContainer.automaitc = true
            statusTopBarContainer.manual = false
            statusTopBarContainer.parked = false
        }
        else if (event.key === Qt.Key_P) {
            statusTopBarContainer.automaitc = false
            statusTopBarContainer.manual = false
            statusTopBarContainer.parked = true
            statusTopBarContainer.gantry = false
            statusTopBarContainer.trolley = false
            statusTopBarContainer.hoist = false
        }
        else if (event.key === Qt.Key_G)  {
            statusTopBarContainer.gantry = true
            statusTopBarContainer.trolley = false
            statusTopBarContainer.hoist = false
        }
        else if (event.key === Qt.Key_T) {
            statusTopBarContainer.gantry = false
            statusTopBarContainer.trolley = true
            statusTopBarContainer.hoist = false
        }
        else if (event.key === Qt.Key_H) {
            statusTopBarContainer.gantry = false
            statusTopBarContainer.trolley = false
            statusTopBarContainer.hoist = true
        }
    }

    StatusComponent {
        id: gantry
        letter: "G"
        inverted: true
        active: statusTopBarContainer.gantry
        anchors {
            left: statusTopBarContainer.left
            top: statusTopBarContainer.top
        }
    }

    StatusComponent {
        id: trolley
        letter: "T"        
        inverted: true
        active: statusTopBarContainer.trolley
        anchors {
            left: gantry.right
            leftMargin: 10
            top: statusTopBarContainer.top
        }
    }

    StatusComponent {
        id: hoist
        letter: "H"
        inverted: true
        active: statusTopBarContainer.hoist
        anchors {
            left: trolley.right
            leftMargin: 10
            top: statusTopBarContainer.top
        }
    }

    StatusComponent {
        id: automatic
        letter: "A"
        active: statusTopBarContainer.automaitc
        anchors {
            left: hoist.right
            leftMargin: 200
            top: statusTopBarContainer.top
        }
    }

    StatusComponent {
        id: manual
        letter: "M"
        active: statusTopBarContainer.manual
        anchors {
            left: automatic.right
            leftMargin: 10
            top: statusTopBarContainer.top
        }
    }

    StatusComponent {
        id: parked
        letter: "P"
        active: statusTopBarContainer.parked
        anchors {
            left: manual.right
            leftMargin: 10
            top: statusTopBarContainer.top
        }
    }
}



