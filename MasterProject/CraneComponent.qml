import QtQuick 2.15


Item {
    property int componentMargin: 25

    id: craneContainer
    width: 373; height: 298

    MouseArea {
        anchors.fill: craneContainer
        onClicked: craneContainer.focus = true
    }

    Keys.onLeftPressed: {
        craneIllustration.horizontalSpreaderPosition -= 2
        craneWidth.horizontalSpreaderPosition -= 2
        topWidth.value -= 0.208333333
    }
    Keys.onRightPressed: {
        craneIllustration.horizontalSpreaderPosition += 2
        craneWidth.horizontalSpreaderPosition += 2
        topWidth.value += 0.208333333
    }
    Keys.onDownPressed: {
        craneIllustration.verticalSpreaderPosition += 2
        craneHeight.verticalSpreaderPosition += 2
        rightHeight.value -= 0.25
    }
    Keys.onUpPressed: {
        craneIllustration.verticalSpreaderPosition = craneIllustration.verticalSpreaderPosition > 26 ? craneIllustration.verticalSpreaderPosition -= 2 : craneIllustration.verticalSpreaderPosition
        craneHeight.verticalSpreaderPosition = craneHeight.verticalSpreaderPosition > 1 ? craneHeight.verticalSpreaderPosition -= 2 : craneHeight.verticalSpreaderPosition
        rightHeight.value += 0.25
    }

    Rectangle {        
        id: craneContent
        anchors.fill: craneContainer
        //color: "#f5f5f5"

        ValueUnitComponent {
            id: topWidth
            value: 10
            unit: "m"
            anchors {
                left: craneContent.left
                top: craneContent.top
            }
        }

        ValueUnitComponent {
            id: topSpeed
            value: 0
            unit: "m/s"
            anchors {
                left: topWidth.right
                leftMargin: craneContainer.componentMargin
            }
        }

        CraneWidthIndicatorComponent {
            id: craneWidth
            anchors {                
                left: topSpeed.right
                leftMargin: /*topWidth.value < 9.375 ? craneContainer.componentMargin + 10 : */craneContainer.componentMargin
            }
        }

        CraneIllustrationComponent {
            id: craneIllustration
            anchors {
                top: craneWidth.bottom
                topMargin: 50
                right: craneHeight.left
                rightMargin: 35
            }
        }

        CraneHeightIndicatorComponent {
            id: craneHeight
            anchors {
                right: craneContent.right
                bottom: craneContent.bottom
                bottomMargin: 10
            }
        }

        ValueUnitComponent {
            id: rightHeight
            value: 20
            unit: "m"
            anchors {
                right: craneContent.right
                bottom: craneHeight.top
                bottomMargin: craneContainer.componentMargin
            }
        }

        ValueUnitComponent {
            id: rightSpeed
            value: 0
            unit: "m/s"
            anchors {
                right: craneContent.right
                bottom: rightHeight.top
                bottomMargin: craneContainer.componentMargin
            }
        }
    }
}
