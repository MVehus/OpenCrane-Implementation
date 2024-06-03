import QtQuick 2.15

Item {
    property string title: "Container"

    id: cardContainer
    width: 213; height: 71
    Rectangle {
        id: cardContent
        width: cardContainer.width; height: cardContainer.height
        anchors.centerIn: cardContainer
        color: "#F5F5F5"

        Rectangle {
            id: cardContainerInner
            width: cardContainer.width * 0.95; height: cardContainer.height * 0.87
            anchors.centerIn: cardContent
            color: "#F5F5F5"

            Text {
                id: cardTitle
                text: cardContainer.title
                font.pixelSize: 7
                font.bold: true

                anchors {
                    left: cardContainerInner.left
                    top: cardContainerInner.top
                }
            }

            Rectangle {
                property int leftButtonMargin: 15

                id: cardInformationContent
                width: 200; height: 30
                color: "#F5F5F5"
                anchors {
                    horizontalCenter: cardContainerInner.horizontalCenter
                    bottom: cardContainerInner.bottom
                    bottomMargin: 5
                }

                BlockBig {
                    id: containerSize
                    value: "40ft"
                    anchors {
                        left: cardContainerInner.left
                    }
                }

                BlockBig {
                    id: containerId
                    buttonWidth: 105
                    value: "BICU 123456 5"
                    anchors {
                        left: containerSize.right
                        leftMargin: cardInformationContent.leftButtonMargin
                    }
                }

                BlockBig {
                    id: weight
                    value: "4 t"
                    anchors {
                        left: containerId.right
                        leftMargin: cardInformationContent.leftButtonMargin
                    }
                }
            }
        }
    }
}
