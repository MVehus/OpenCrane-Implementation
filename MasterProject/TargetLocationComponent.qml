import QtQuick 2.15

Item {
    property string title: "Target Location"
    property bool truckTarget: true

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

                visible: truckTarget

                id: cardInformationTarget
                width: 200; height: 30
                color: "#F5F5F5"
                anchors {
                    horizontalCenter: cardContainerInner.horizontalCenter
                    bottom: cardContainerInner.bottom
                    bottomMargin: 5
                }

                Rectangle {
                    id: logoIcon
                    width: 28; height: 28
                    radius: 2
                    color: "#FFFFFF"
                    anchors {
                        left: cardInformationTarget.left
                    }

                    Image {
                        id: targetLocationIcon
                        source: "../Assets/TruckTargetLocationIcon.png"
                        anchors.centerIn: logoIcon
                    }
                }

                BlockSmall {
                    id: plate
                    buttonWidth: 105
                    title: "Plate"
                    value: "BD 51 SMR"
                    anchors {
                        left: logoIcon.right
                        leftMargin: cardInformationTarget.leftButtonMargin
                    }
                }

                BlockSmall {
                    id: chasis
                    title: "Chasis"
                    value: "1"
                    anchors {
                        left: plate.right
                        leftMargin: cardInformationTarget.leftButtonMargin
                    }
                }
            }

            Rectangle {
                property int leftButtonMargin: 15

                visible: !truckTarget

                id: cardInformationCurrent
                width: 200; height: 30
                color: "#F5F5F5"
                anchors {
                    horizontalCenter: cardContainerInner.horizontalCenter
                    bottom: cardContainerInner.bottom
                    bottomMargin: 5
                }

                Rectangle {
                    id: altLogoIcon
                    width: 28; height: 28
                    radius: 2
                    color: "#FFFFFF"
                    anchors {
                        left: cardInformationCurrent.left
                    }

                    Image {
                        id: currentLocationIcon
                        source: "../Assets/OnLandLocationIcon.png"
                        anchors.centerIn: altLogoIcon
                    }
                }

                BlockSmall {
                    id: block
                    title: "Block"
                    value: "A"
                    anchors {
                        left: altLogoIcon.right
                        leftMargin: cardInformationCurrent.leftButtonMargin
                    }
                }

                BlockSmall {
                    id: bay
                    title: "Bay"
                    value: "17"
                    anchors {
                        left: block.right
                        leftMargin: cardInformationCurrent.leftButtonMargin
                    }
                }

                BlockSmall {
                    id: row
                    title: "Row"
                    value: "4"
                    anchors {
                        left: bay.right
                        leftMargin: cardInformationCurrent.leftButtonMargin
                    }
                }

                BlockSmall {
                    id: tier
                    title: "Tier"
                    value: "3"
                    anchors {
                        left: row.right
                        leftMargin: cardInformationCurrent.leftButtonMargin
                    }
                }
            }
        }
    }
}

