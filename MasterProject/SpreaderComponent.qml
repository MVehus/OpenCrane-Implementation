import QtQuick 2.15

Item {
    property int spreaderWidth: 40
    property int spreaderSkew: 0
    property int spreaderTrim: 0
    property int spreaderList: 0

    property bool spreaderLocked: false
    property string lockIcon: spreaderLocked ? "../Assets/LockClosed.png" : "../Assets/LockOpen.png"

    id: spreaderContainer
    width: 287; height: 277

    MouseArea {
        anchors.fill: spreaderContainer
        onClicked: spreaderContainer.focus = true
    }

    Keys.onLeftPressed: spreaderWidth = 20
    Keys.onRightPressed: spreaderWidth = 40
    Keys.onUpPressed: spreaderSkew = (spreaderSkew + 1) % 360
    Keys.onDownPressed: spreaderSkew = (spreaderSkew - 1) % 360
    Keys.onDigit3Pressed: spreaderTrim = (spreaderTrim + 1) % 360
    Keys.onDigit4Pressed: spreaderTrim = (spreaderTrim - 1) % 360
    Keys.onDigit1Pressed: spreaderList = (spreaderList + 1) % 360
    Keys.onDigit2Pressed: spreaderList = (spreaderList - 1) % 360

    Rectangle {
        id: spreaderContent
        anchors.fill: spreaderContainer
        color: "#F5F5F5"

        Rectangle {
            id: spreaderContentInner
            width: spreaderContent.width * 0.9; height: spreaderContainer.height * 0.9
            anchors.centerIn: spreaderContent
            color: "#F5F5F5"

            Text {
                id: spreaderTitle
                text: "SPREADER"
                font.pixelSize: 9
                font.bold: true

                anchors {
                    left: spreaderContentInner.left
                    top: spreaderContentInner.top
                }
            }

            Rectangle {
                id: lockSwitchContainer
                width: lockSwitchLabel.width; height: lockSwitchLabel.height + lockSwitch.height
                color: "#F5F5F5"
                anchors {
                    left: spreaderTitle.right
                    leftMargin: 20
                    verticalCenter: spreaderTitle.verticalCenter
                }

                Image {
                    id: lockSwitch
                    source: spreaderContainer.lockIcon
                    anchors {
                        top: lockSwitchContainer.top
                        horizontalCenter: lockSwitchContainer.horizontalCenter
                    }
                }
                Text {
                    id: lockSwitchLabel
                    text: spreaderContainer.spreaderLocked ? "Locked" : "Unlocked"
                    font.pixelSize: 6
                    font.bold: true
                    anchors {
                        top: lockSwitch.bottom
                        horizontalCenter: lockSwitch.horizontalCenter
                    }
                }
                MouseArea {
                    anchors.fill: lockSwitchContainer
                    onClicked: spreaderContainer.spreaderLocked = !spreaderContainer.spreaderLocked
                }
            }



            SpreaderIcon {
                id: spreaderIcon
                spreaderWidth: spreaderContainer.spreaderWidth
                anchors {
                    top: spreaderTitle.bottom
                    horizontalCenter: spreaderContentInner.horizontalCenter
                    topMargin: 35
                }
            }

            Image {
                id: topRightLock
                source: spreaderContainer.lockIcon
                anchors {
                    top: spreaderIcon.top
                    right: spreaderIcon.left
                }
            }

            Image {
                id: bottomRightLock
                source: spreaderContainer.lockIcon
                anchors {
                    bottom: spreaderIcon.bottom
                    right: spreaderIcon.left
                }
            }

            Image {
                id: topLefttLock
                source: spreaderContainer.lockIcon
                anchors {
                    top: spreaderIcon.top
                    left: spreaderIcon.right
                }
            }

            Image {
                id: bottomLeftLock
                source: spreaderContainer.lockIcon
                anchors {
                    bottom: spreaderIcon.bottom
                    left: spreaderIcon.right
                }
            }

            Text {
                id: tiltTitle
                text: "TILT"
                font.pixelSize: 9
                font.bold: true

                anchors {
                    top: spreaderIcon.bottom
                    left: spreaderContentInner.left
                    topMargin: 35
                }
            }

            SpreaderTiltCharts {
                id: spreaderCharts
                spreaderWidth: spreaderContainer.spreaderWidth
                spreaderSkew: spreaderContainer.spreaderSkew
                spreaderList: spreaderContainer.spreaderList
                spreaderTrim: spreaderContainer.spreaderTrim
                anchors {
                    top: tiltTitle.bottom
                    horizontalCenter: spreaderContentInner.horizontalCenter
                    topMargin: 8
                }
            }

            Rectangle {
                property int labelLeftMargin: 20


                id: tiltLables
                width: spreaderContentInner.width
                anchors {
                    top: spreaderCharts.bottom
                    topMargin: 10
                }

                TiltLabel {
                    id: skewLabel
                    label: "Skew"
                    value: spreaderContainer.spreaderSkew
                    anchors {
                        left: tiltLables.left
                        leftMargin: tiltLables.labelLeftMargin
                    }
                }

                TiltLabel {
                    id: listLabel
                    label: "List"
                    value: spreaderContainer.spreaderList
                    anchors {
                        left: skewLabel.right
                        leftMargin: tiltLables.labelLeftMargin
                    }
                }

                TiltLabel {
                    id: trimLabel
                    label: "Trim"
                    value: spreaderContainer.spreaderTrim
                    anchors {
                        left: listLabel.right
                        leftMargin: tiltLables.labelLeftMargin
                    }
                }
            }

        }
    }
}
