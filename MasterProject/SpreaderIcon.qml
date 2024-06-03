import QtQuick 2.15

Item {
    property int containerWidth: 205
    property int containerHeight: 45
    property int middleSpreaderWidth: 95
    property int middleSpreaderHeight: 40
    property int sideRectWidth: 8
    property int spreaderArmHeight: 5

    property bool includeText: true

    property int spreaderWidth: 40
    property int lineMargin: 3

    property string primaryColor: "#333333"
    property string secondaryColor: "#D9D9D9"

    property double spreaderWidthConverted: spreaderWidth * 2 - 40

    id: spreaderContainer
    width: containerWidth; height: containerHeight



    Rectangle {
        id: middleSpreader
        width: middleSpreaderWidth; height: middleSpreaderHeight
        color: primaryColor
        anchors {
            centerIn: spreaderContainer
        }

        Text {
            id: spreaderText
            visible: includeText
            // Add conversion
            text: spreaderWidth + "ft"
            font.pixelSize: 11
            color: "white"
            anchors.centerIn: middleSpreader
        }
        antialiasing: true
    }

    Rectangle {
        id: leftSide
        width: sideRectWidth; height: spreaderContainer.height
        color: secondaryColor
        anchors {
            right: topLeftLine.left
        }
        antialiasing: true
    }

    Rectangle {
        id: rightSide
        width: sideRectWidth; height: spreaderContainer.height
        color: secondaryColor
        anchors {
            left: topRightLine.right
        }
        antialiasing: true
    }

    Rectangle {
        id: topRightLine
        width: spreaderWidthConverted; height: spreaderArmHeight
        color: secondaryColor

        anchors {
            left: middleSpreader.right
            top: middleSpreader.top
            topMargin: lineMargin
        }
        antialiasing: true
    }

    Rectangle {
        id: bottomRightLine
        width: spreaderWidthConverted; height: spreaderArmHeight
        color: secondaryColor

        anchors {
            left: middleSpreader.right
            bottom: middleSpreader.bottom
            bottomMargin: lineMargin
        }
        antialiasing: true
    }

    Rectangle {
        id: topLeftLine
        width: spreaderWidthConverted; height: spreaderArmHeight
        color: secondaryColor

        anchors {
            right: middleSpreader.left
            top: middleSpreader.top
            topMargin: lineMargin
        }
        antialiasing: true
    }

    Rectangle {
        id: bottomLeftLine
        width: spreaderWidthConverted; height: spreaderArmHeight
        color: secondaryColor

        anchors {
            right: middleSpreader.left
            bottom: middleSpreader.bottom
            bottomMargin: lineMargin
        }
        antialiasing: true
    }
}
