import QtQuick 2.15

Item {
    property bool active: false
    property bool inverted: false
    property string letter: ""

    id: statusLetterContainer
    width: 18; height: 18

    Rectangle {
        id: statusLetterContent
        anchors.fill: statusLetterContainer
        radius: 2
        border.width: statusLetterContainer.active ? 1 : 0
        border.color: statusLetterContainer.inverted ? "#1A1A1A" : "#191919"
        color: statusLetterContainer.inverted && statusLetterContainer.active ? "#1A1A1A" : "#FFFFFF"

        Text {
            text: statusLetterContainer.letter
            anchors.centerIn: statusLetterContent
            font.pixelSize: 14
            font.bold: statusLetterContainer.active
            color: statusLetterContainer.active ? statusLetterContainer.inverted ? "#FFFFFF" : "#191919" : "#BCBCBC"
        }
    }
}
