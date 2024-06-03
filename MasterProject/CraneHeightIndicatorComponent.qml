import QtQuick 2.15
import QtQuick.Shapes 1.15

Item {
    property int verticalSpreaderPosition: 1

    id: rightBarContainer
    width: 36; height: 197

    Rectangle {
        id: rightBar
        width: 16; height: rightBarContainer.height
        anchors {
            left: rightBarContainer.left
        }
        border.width: 1; border.color: "#D6D6D6"

        Rectangle {
            id: triangleContainer
            width: 14; height: 14
            y: rightBarContainer.verticalSpreaderPosition
            anchors.horizontalCenter: rightBar.horizontalCenter

            Shape {
                id: triangle
                width: triangleContainer.width - 3; height: triangleContainer.height - 3
                antialiasing: true
                anchors.centerIn: triangleContainer
                ShapePath {
                    strokeWidth: 1
                    strokeColor: "#166CE4"
                    fillColor: "#166CE4"
                    fillRule: ShapePath.WindingFill

                    startX: 0; startY: 0

                    PathLine {
                        x: triangle.width; y:triangle.height / 2
                    }

                    PathLine {
                        x: 0; y: triangle.height
                    }

                    PathLine {
                        x: 0; y: 0
                    }
                }
            }
        }
    }

    Rectangle {
        id: rightBarText
        width: rightBarContainer.width - rightBar.width; height: rightBarContainer.height
        anchors {
            right: rightBarContainer.right
        }

        Text {
            text: " - 20"
            y: 0
            font.pixelSize: 7
        }

        Text {
            text: " - 15"
            y: rightBarContainer.height / 4 - font.pixelSize
            font.pixelSize: 7
        }

        Text {
            text: " - 10"
            y: rightBarContainer.height / 2 - font.pixelSize
            font.pixelSize: 7
        }

        Text {
            text: " - 5"
            y: rightBarContainer.height * 3/4 - font.pixelSize
            font.pixelSize: 7
        }

        Text {
            text: " - 0"
            y: rightBarContainer.height - font.pixelSize
            font.pixelSize: 7
        }
    }
}

