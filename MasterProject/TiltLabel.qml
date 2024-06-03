import QtQuick 2.15

Item {
    property string label: "value"
    property int value: 0

    id: tiltLabelContainer
    width: 60; height: 25
    anchors.centerIn: root

    Rectangle {
        id: labelContent
        anchors.fill: tiltLabelContainer
        color: "#F5F5F5"

        Text {
            id: tiltText
            anchors {
                left: labelContent.left
                verticalCenter: labelContent.verticalCenter
            }

            text: tiltLabelContainer.label
            font.pixelSize: 8
            color: "#1A1A1A"
        }

        Text {
            id: tiltValue
            anchors {
                right: labelContent.right
                verticalCenter: labelContent.verticalCenter
            }

            text: tiltLabelContainer.value.toString() + " °"
            font.pixelSize: 14
            color: "#166CE4"
        }
    }
}
