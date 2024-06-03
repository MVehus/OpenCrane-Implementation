import QtQuick 2.15

Item {
    property double value: 0.0
    property string unit: "m"

    id: valueUnitContainer
    width: valueUnitContainer.value < 10 && valueUnitContainer.unit == "m"
           ? 19.5 + unit.implicitWidth
           : value.implicitWidth + unit.implicitWidth;
    height: value.implicitHeight

    Rectangle {
        id: valueUnitContent
        anchors.fill: valueUnitContainer

        Text {
            id: value
            text: (valueUnitContainer.value.toFixed(0)).toString("0.0")
            font.pixelSize: 14
            font.bold: true
            color: "#166CE4"
            anchors {
                left: valueUnitContent.left
            }
        }

        Text {
            id: unit
            text: valueUnitContainer.unit
            font.pixelSize: 7
            anchors {
                right: valueUnitContent.right
                baseline: value.baseline
            }
        }
    }
}
