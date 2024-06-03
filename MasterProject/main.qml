import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Shapes 1.15
import "Components"

Window {
    width: 800; height: 480
    visible: true

    Rectangle {
        property bool currentTargetLocation: true

        id: root
        width: parent.width * 0.95; height: parent.height * 0.95
        anchors {
            centerIn: parent
        }
        color: "white"


        StatusTopBarComponent {
            id: topbar
            anchors {
                top: root.top
                horizontalCenter: root.horizontalCenter
            }           
        }

        CraneComponent {
            id: crane
            anchors {
                left: root.left
                top: topbar.bottom
            }
        }

        SpreaderComponent {
            id: spreader
            anchors  {
                right: root.right
                top: topbar.bottom
            }
        }       

        MouseArea {
            id: targetCurrentSwitch
            width: 50; height: 50
            anchors {
                left: root.left
                bottom: root.bottom
            }

            onClicked: {
                currentLocation.containerTarget = !currentLocation.containerTarget
                targetLocation.truckTarget = !targetLocation.truckTarget

            }
        }

        CurrentLocationComponent {
            id: currentLocation
            anchors {
                left: root.left
                bottom: root.bottom
            }
        }

        TargetLocationComponent {
            id: targetLocation
            anchors {
                horizontalCenter: root.horizontalCenter
                bottom: root.bottom
            }
        }

        ContainerComponent {
            id: container
            anchors {
                right: root.right
                bottom: root.bottom
            }
        }                
    }

}


