import QtQuick 2.15
import QtQuick.Shapes 1.15

Item {

    property int spreaderWidth: 48
    property int spreaderSkew: 0
    property int spreaderTrim: 0
    property int spreaderList: 0

    id: tiltChartContainer
    width: 240; height: 77
    anchors {
        centerIn: root
    }

    Rectangle {
        property int circleDiameter: 78

        id: tiltDiagrams
        anchors {
          fill: tiltChartContainer
        }
        color: "#F5F5F5"

        Rectangle {
            id: leftCircle
            width: parent.circleDiameter; height: parent.circleDiameter; radius: 180
            anchors {
                left: tiltDiagrams.left
            }

            SpreaderIcon {
                spreaderWidth: tiltChartContainer.spreaderWidth == 20 ? tiltChartContainer.spreaderWidth : tiltChartContainer.spreaderWidth - 12

                anchors.centerIn: leftCircle
                containerWidth: 65
                containerHeight: 17

                middleSpreaderWidth: 31
                middleSpreaderHeight: 17
                sideRectWidth: 3
                spreaderArmHeight: 2
                lineMargin: 3

                includeText: false

                primaryColor: "#7D7D7D"
                secondaryColor: "#333333"

                rotation: -tiltChartContainer.spreaderSkew
            }

            Shape {
                width: leftCircle.width; height: leftCircle.height; z: 1
                anchors.centerIn: leftCircle

                ShapePath {
                    strokeWidth: 1
                    strokeColor: "#FF0000"
                    strokeStyle: ShapePath.DashLine
                    dashPattern: [1,2]
                    startX: leftCircle.width / 2; startY: 0
                    PathLine {x: leftCircle.width / 2; y: leftCircle.height }
                }

                ShapePath {
                    strokeWidth: 1
                    strokeColor: "#1E85FF"
                    strokeStyle: ShapePath.DashLine
                    dashPattern: [1,2]
                    startX: 0; startY: leftCircle.height / 2
                    PathLine {x: leftCircle.width; y: leftCircle.height / 2}
                }
            }

        }

        Rectangle {
            id: middleCircle
            width: parent.circleDiameter; height: parent.circleDiameter; radius: 180
            anchors {
                left: leftCircle.right
                leftMargin: 5
            }

            Rectangle {
                width: 16; height: 6
                anchors.centerIn: middleCircle
                color: "#333333"
                antialiasing: true
                rotation: -tiltChartContainer.spreaderList
            }

            Shape {
                width: middleCircle.width; height: middleCircle.height; z: 1
                anchors.centerIn: middleCircle

                ShapePath {
                    strokeWidth: 1
                    strokeColor: "#1F9F33"
                    strokeStyle: ShapePath.DashLine
                    dashPattern: [1,2]
                    startX: middleCircle.width / 2; startY: 0
                    PathLine {x: middleCircle.width / 2; y: middleCircle.height }
                }

                ShapePath {
                    strokeWidth: 1
                    strokeColor: "#FF0000"
                    strokeStyle: ShapePath.DashLine
                    dashPattern: [1,2]
                    startX: 0; startY: middleCircle.height / 2
                    PathLine {x: middleCircle.width; y: middleCircle.height / 2}
                }
            }

        }

        Rectangle {
            id: rightCircle
            width: parent.circleDiameter; height: parent.circleDiameter; radius: 180
            anchors {
                left: middleCircle.right
                leftMargin: 5
            }

            Rectangle {
                width: 65; height: 6
                anchors.centerIn: rightCircle

                rotation: -tiltChartContainer.spreaderTrim
                antialiasing: true

                Rectangle {
                    id: middle
                    width: 30; height: 6
                    color: "#7D7D7D"
                    anchors.centerIn: parent
                    antialiasing: true
                }

                Rectangle {
                    id: rightArm
                    width: tiltChartContainer.spreaderWidth / 3.5; height: 2
                    color: "#333333"
                    anchors {
                        left: middle.right
                        top: middle.top
                        topMargin: 2
                    }
                    antialiasing: true
                }

                Rectangle {
                    width: 3; height: 4
                    color: "#333333"
                    anchors {
                        left: rightArm.right
                        top: rightArm.top
                    }
                    antialiasing: true
                }

                Rectangle {
                    id: leftArm
                    width: tiltChartContainer.spreaderWidth / 3.5; height: 2
                    color: "#333333"
                    anchors {
                        right: middle.left
                        top: middle.top
                        topMargin: 2
                    }
                    antialiasing: true
                }

                Rectangle {
                    width: 3; height: 4
                    color: "#333333"
                    anchors {
                        right: leftArm.left
                        top: rightArm.top
                    }
                    antialiasing: true
                }
            }

            Shape {
                width: rightCircle.width; height: rightCircle.height; z: 1
                anchors.centerIn: rightCircle

                ShapePath {
                    strokeWidth: 1
                    strokeColor: "#1F9F33"
                    strokeStyle: ShapePath.DashLine
                    dashPattern: [1,2]
                    startX: rightCircle.width / 2; startY: 0
                    PathLine {x: rightCircle.width / 2; y: rightCircle.height }
                }

                ShapePath {
                    strokeWidth: 1
                    strokeColor: "#1E85FF"
                    strokeStyle: ShapePath.DashLine
                    dashPattern: [1,2]
                    startX: 0; startY: rightCircle.height / 2
                    PathLine {x: rightCircle.width; y: rightCircle.height / 2}
                }
            }
        }

    }
}
