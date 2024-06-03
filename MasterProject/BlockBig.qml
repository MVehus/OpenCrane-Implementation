import QtQuick 2.15

Item {
    property int buttonWidth: 28
    property string value: "value"

    id: blockBig
    width: buttonWidth; height: 28

    Rectangle {
        id: blockContent
        color: "#FFFFFF"
        radius: 2
        anchors {
            fill: blockBig
        }

        Text {
            text: blockBig.value
            font.pixelSize: 7
            font.bold: true
            anchors.centerIn: blockContent
        }
    }
}
