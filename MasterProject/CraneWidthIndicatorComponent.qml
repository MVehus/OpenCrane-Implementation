import QtQuick 2.15
import QtQuick.Shapes 1.15

Item {
    property int horizontalSpreaderPosition: 88

    id: topBarContainer
    width: 197; height: 36

    Rectangle {
        id: topBarText
        width: topBarContainer.width; height: topBarContainer.height - topBar.height
        anchors {
            left: topBarContainer.left
            top: topBarContainer.top
        }

        Text {
            text: "0\n|"
            x: 0
            font.pixelSize: 7
        }

        Text {
            text: "5\n|"
            x: topBarContainer.width / 4 - font.pixelSize
            font.pixelSize: 7
        }

        Text {
            text: "10\n |"
            x: topBarContainer.width / 2 - font.pixelSize
            font.pixelSize: 7
        }

        Text {
            text: "15\n |"
            x: topBarContainer.width * 3/4 - font.pixelSize
            font.pixelSize: 7
        }

        Text {
            text: "20\n |"
            x: topBarContainer.width - font.pixelSize
            font.pixelSize: 7
        }
    }


    Rectangle {
        id: topBar
        width: topBarContainer.width; height: 16
        anchors {
            left: topBarContainer.left
            top: topBarText.bottom
        }
        border.width: 1; border.color: "#D6D6D6"

        Rectangle {
            id: triangleContainer
            width: 14; height: 14
            x: topBarContainer.horizontalSpreaderPosition
            anchors.verticalCenter: topBar.verticalCenter

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

                    startX: 0; startY: triangle.height

                    PathLine {
                        x: triangle.width / 2; y: 0
                    }

                    PathLine {
                        x: triangle.width; y: triangle.height
                    }

                    PathLine {
                        x: 0; y: triangle.height
                    }
                }
            }
        }
    }

}
