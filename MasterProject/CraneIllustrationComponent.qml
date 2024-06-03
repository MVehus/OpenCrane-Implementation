import QtQuick 2.15
import QtQuick.Shapes 1.15

Item {
    property int horizontalSpreaderPosition: 88
    property int verticalSpreaderPosition: 26

    id: craneIllustrationContainer
    width: 245; height: 230;

    Rectangle {
        id: craneIllustration
        anchors.fill: craneIllustrationContainer

        Rectangle {
            id: craneOutline
            width: 225; height: 208
            anchors {
                right: craneIllustration.right
                bottom: craneBase.top
            }

            Rectangle {
                id: rightBaseFoot
                width: 26; height: 10
                color: "#333333"
                anchors {
                    right: craneOutline.right
                    bottom: craneOutline.bottom
                }
            }

            Rectangle {
                id: leftBaseFoot
                width: 26; height: 10
                color: "#333333"
                anchors {
                    left: craneOutline.left
                    bottom: craneOutline.bottom
                }
            }

            Rectangle {
                id: rightCraneBeam
                width: 10; height: 198
                color: "#333333"
                anchors {
                    bottom: rightBaseFoot.top
                    horizontalCenter: rightBaseFoot.horizontalCenter
                }
            }

            Rectangle {
                id: leftCraneBeam
                width: 10; height: 198
                color: "#333333"
                anchors {
                    bottom: leftBaseFoot.top
                    horizontalCenter: leftBaseFoot.horizontalCenter
                }
            }

            Rectangle {
                id: topCraneBeam
                width: 198; height: 10
                z: 2
                color: "#333333"
                anchors {
                    left: leftCraneBeam.right
                    right: rightCraneBeam.left
                }
            }

            Rectangle {
                id: craneSpreader
                width: 48; height: 50;
                x: craneIllustrationContainer.horizontalSpreaderPosition
                anchors {
                    top: topCraneBeam.bottom
                    topMargin: -20
                    //horizontalCenter: topCraneBeam.horizontalCenter // control x position here
                }

                Rectangle {
                    id: topSpreaderLatch
                    width: 48; height: 15
                    color: "#333333"
                    anchors {
                        left: craneSpreader.left
                        top: craneSpreader.top
                    }
                }

                Rectangle {
                    id: topSpreaderMainBody
                    width: 20; height: 15
                    color: "#333333"
                    anchors {
                        top: topSpreaderLatch.bottom
                        horizontalCenter: topSpreaderLatch.horizontalCenter
                    }
                }

                Rectangle {
                    id: leftSpreaderExtender
                    width: 1; height: craneIllustrationContainer.verticalSpreaderPosition; // adjust height to show spreader moving vertically
                    color: "#333333"
                    anchors {
                        right: topSpreaderMainBody.left
                        top: topSpreaderLatch.bottom
                    }
                }

                Rectangle {
                    id: rightSpreaderExtender
                    width: 1; height: craneIllustrationContainer.verticalSpreaderPosition; // adjust height to show spreader moving vertically
                    color: "#333333"
                    anchors {
                        left: topSpreaderMainBody.right
                        top: topSpreaderLatch.bottom
                    }
                }

                Rectangle {
                    id: spreaderBody
                    width: 22; height: 5
                    color: "#333333"
                    anchors {
                        left: leftSpreaderExtender.left
                        top: leftSpreaderExtender.bottom
                    }
                }

                Rectangle {
                    id: leftSpreaderArm
                    width: 3; height: 5
                    color: "#333333"
                    anchors {
                        left: spreaderBody.left
                        top: spreaderBody.bottom
                    }
                }

                Rectangle {
                    id: rightSpreaderArm
                    width: 3; height: 5
                    color: "#333333"
                    anchors {
                        right: spreaderBody.right
                        top: spreaderBody.bottom
                    }
                }
            }
        }

        Rectangle {
            id: truckContainer
            width: 20; height: 35
            x: 64
            anchors {
                bottom: craneBase.top
            }

            Rectangle {
                id: truckBody
                width: 20; height: 30
                color: "#D9D9D9"
                anchors.top: truckContainer.top
            }

            Rectangle {
                id: leftTruckWheel
                width: 5; height: 5
                color: "#7D7D7D"
                anchors {
                    left: truckBody.left
                    top: truckBody.bottom
                }
            }

            Rectangle {
                id: rightTruckWheel
                width: 5; height: 5
                color: "#7D7D7D"
                anchors {
                    right: truckBody.right
                    top: truckBody.bottom
                }
            }
        }

        Rectangle {
            property int containerWidth: 20
            property int containerHeigh: 30

            id: craneContainers
            width: 120; height: 120
            color: "red"
            x: 94
            anchors {
                bottom: craneBase.top
                bottomMargin: 1
            }

            Shape {
                id: containerLines
                width: craneContainers.width; height: craneContainers.height
                anchors.centerIn: craneContainers

                ShapePath {
                    strokeWidth: 1
                    strokeColor: "#000000"
                    startX: 0; startY: 0
                    PathLine { x: containerLines.width; y: 0 }
                    PathLine { x: containerLines.width; y: containerLines.height }
                    PathLine { x: 0; y: containerLines.height }
                    PathLine { x: 0; y: 0 }
                }

                ShapePath {
                    strokeWidth: 1
                    strokeColor: "#000000"
                    startX: 0; startY: containerLines.height / 4
                    PathLine { x: containerLines.width; y: containerLines.height / 4 }
                }

                ShapePath {
                    strokeWidth: 1
                    strokeColor: "#000000"
                    startX: 0; startY: 2 * containerLines.height / 4
                    PathLine { x: containerLines.width; y: 2 * containerLines.height / 4 }
                }

                ShapePath {
                    strokeWidth: 1
                    strokeColor: "#000000"
                    startX: 0; startY: 3 * containerLines.height / 4
                    PathLine { x: containerLines.width; y: 3 * containerLines.height / 4 }
                }

                ShapePath {
                    strokeWidth: 1
                    strokeColor: "#000000"
                    startX: containerLines.width / 6; startY: 0
                    PathLine { x: containerLines.width / 6; y: containerLines.height}
                }

                ShapePath {
                    strokeWidth: 1
                    strokeColor: "#000000"
                    startX: 2 * containerLines.width / 6; startY: 0
                    PathLine { x: 2 * containerLines.width / 6; y: containerLines.height}
                }

                ShapePath {
                    strokeWidth: 1
                    strokeColor: "#000000"
                    startX: 3 * containerLines.width / 6; startY: 0
                    PathLine { x: 3 * containerLines.width / 6; y: containerLines.height}
                }

                ShapePath {
                    strokeWidth: 1
                    strokeColor: "#000000"
                    startX: 4 * containerLines.width / 6; startY: 0
                    PathLine { x: 4 * containerLines.width / 6; y: containerLines.height}
                }

                ShapePath {
                    strokeWidth: 1
                    strokeColor: "#000000"
                    startX: 5 * containerLines.width / 6; startY: 0
                    PathLine { x: 5 * containerLines.width / 6; y: containerLines.height}
                }
            }
        }

        Rectangle {
            id: craneBase
            width: 225; height: 12
            color: "#D9D9D9"
            anchors {
                right: craneIllustration.right
                bottom: bottomCraneNumeration.top
                bottomMargin: 3
            }
        }

        Rectangle {
            property int numberMargin: 12
            property int textMargin: 18

            id: bottomCraneNumeration
            width: 170; height: 16
            anchors {
                left: craneIllustration.left
                leftMargin: 50
                bottom: craneIllustration.bottom
            }

            Text {
                id: truckLane
                text: "TL"
                anchors {
                    left: bottomCraneNumeration.left
                    leftMargin: bottomCraneNumeration.textMargin
                }
            }

            Text {
                id: firstColumn
                text: "1"
                anchors {
                    left: truckLane.right
                    leftMargin: bottomCraneNumeration.textMargin
                }
            }

            Text {
                id: secondColumn
                text: "2"
                anchors {
                    left: firstColumn.right
                    leftMargin: bottomCraneNumeration.numberMargin
                }
            }

            Text {
                id: thirdColumn
                text: "3"
                anchors {
                    left: secondColumn.right
                    leftMargin: bottomCraneNumeration.numberMargin
                }

            }

            Text {
                id: fourthColumn
                text: "4"
                anchors {
                    left: thirdColumn.right
                    leftMargin: bottomCraneNumeration.numberMargin
                }
            }

            Text {
                id: fithColumn
                text: "5"
                anchors {
                    left: fourthColumn.right
                    leftMargin: bottomCraneNumeration.numberMargin
                }
            }

            Text {
                id: sixtColumn
                text: "6"
                anchors {
                    left: fithColumn.right
                    leftMargin: bottomCraneNumeration.numberMargin
                }
            }
        }

        Rectangle {
            property int numberMargin: 15

            id: rightCraneNumeration
            width: 10; height: 100
            anchors {
                left: craneIllustration.left
                bottom: craneIllustration.bottom
            }

            Text {
                id: firstRow
                text: "1"
                anchors {
                    bottom: rightCraneNumeration.bottom
                    bottomMargin: 3 * rightCraneNumeration.numberMargin
                }
            }

            Text {
                id: secondtRow
                text: "2"
                anchors {
                    bottom: firstRow.top
                    bottomMargin: rightCraneNumeration.numberMargin
                }
            }

            Text {
                id: thirdRow
                text: "3"
                anchors {
                    bottom: secondtRow.top
                    bottomMargin: rightCraneNumeration.numberMargin
                }
            }

            Text {
                id: fourthRow
                text: "4"
                anchors {
                    bottom: thirdRow.top
                    bottomMargin: rightCraneNumeration.numberMargin
                }
            }
        }
    }
}
