import QtQuick 2.15

Item {
    property int buttonWidth: 28
    property string title: "title"
    property string value: "value"

    id: blockSmall
    width: buttonWidth; height: 28
    Rectangle {
        id: blockContent
        color: "#F5F5F5"
        anchors {
            fill: blockSmall
        }

        Text {
            text: blockSmall.title
            font.pixelSize: 5
            anchors {
                top: blockContent.top
                horizontalCenter: blockContent.horizontalCenter
            }
        }

        Rectangle {
            id: blockButton
            width: buttonWidth; height: 18;
            radius: 2
            color: "#FFFFFF"
            anchors {
                bottom: blockContent.bottom
            }

            Text {
                text: blockSmall.value
                font.pixelSize: 7
                font.bold: true
                anchors.centerIn: blockButton
            }
        }
    }
}
