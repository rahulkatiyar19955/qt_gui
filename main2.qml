import QtQuick 2.7
import QtQuick.Window 2.2
import QtMultimedia 5.6
import QtGraphicalEffects 1.0
import QtQuick.LocalStorage 2.0



Window {
    id: window
    visible: true
    width: 1280
    height: 720
    property alias image3Z: image3.z
    property alias image2Z: image2.z
    property alias image1Z: image1.z
    property alias imageZ: image.z

    title: qsTr("Kati OS")

    Item {
        id: element
        anchors.fill: parent

        Rectangle {
            id: rectangle
            gradient: Gradient {
                GradientStop {
                    position: 0
                    color: "#49ccf1"
                }

                GradientStop {
                    position: 1
                    color: "#333f42"
                }
            }
            anchors.fill: parent

            Text {
                id: ep_no
                x: 22
                y: 186
                width: 104
                height: 38
                text: qsTr("2600")
                visible: false
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: 20

                Keys.onDownPressed:ep_no.text-=1
                Keys.onUpPressed: ep_no.text=2710
                Keys.onReturnPressed: {
                    v1.source = "https://streaming.sonyliv.com/show_sab_taarakmehtakaooltahchashmah_ep"+ep_no.text+"_1200k.m3u8"
                    textInput.text = pathView2.currentIndex
                    ani1.start()
                    v1.play()
                    ep_no.visible = false
                    pathView2.forceActiveFocus()
                }
            }
        }
    }


    Item {
        id: element1
        x: 255
        y: 48
        width: 671
        height: 34
        focus: true

        Rectangle {
            id: rectangle1
            color: "#646a84"
            radius: 26
            border.color: "#5b74b6"
            border.width: 4
            anchors.fill: parent

            TextInput {
                id: textInput
                x: 0
                y: 0
                text: qsTr("Search")
                anchors.verticalCenter: parent.verticalCenter
                anchors.top: parent.top
                anchors.right: parent.right
                anchors.left: parent.left
                font.family: "Verdana"
                font.bold: false
                leftPadding: 18
                topPadding: 2
                selectionColor: "#800000"
                horizontalAlignment: Text.AlignLeft
                font.pixelSize: 25
            }
        }

        Keys.onPressed: {
            //            if (event.key === Qt.Key_Down) {

            image.forceActiveFocus()
            //            }
        }
    }

    Item {
        id: time
        x: 1110
        y: 48
        width: 147
        height: 46

        Text {
            id: time_txt
            color: "#ed0d32"
            text: Qt.formatTime(new Date(),"hh:mm")
            anchors.fill: parent
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 32
        }

        Timer {
            id: timer
            interval: 60000
            repeat: true
            running: true

            onTriggered:
            {
                time_txt.text =  Qt.formatTime(new Date(),"hh:mm")
            }
        }

    }

    Row {
        id: row
        x: 177
        y: 563
        width: 944
        height: 124
        spacing: 15

        Image {
            id: image
            width: 200
            height: 120
            scale: 1.0
            z: 1
            source: "movie_e.png"
            fillMode: Image.PreserveAspectFit

            MouseArea {
                id: mouseArea
                anchors.fill: parent
            }
            Keys.onLeftPressed: image3.forceActiveFocus()
            Keys.onRightPressed: image1.forceActiveFocus()
            Keys.onReturnPressed: {
                pathView2.visible = true
                pathView2.forceActiveFocus()
                bottomRowHide.start()
            }
        }

        Image {
            id: image1
            width: 200
            height: 120
            z:1
            source: "sport_e.png"
            fillMode: Image.PreserveAspectFit

            MouseArea {
                id: mouseArea1
                anchors.fill: parent
            }
            Keys.onLeftPressed: image.forceActiveFocus()
            Keys.onRightPressed: image2.forceActiveFocus()
            Keys.onReturnPressed: {
                pathView4.visible = true
                pathView4.forceActiveFocus()
                bottomRowHide.start()
            }
        }

        Image {
            id: image2
            width: 200
            height: 120
            z: 1
            source: "news_e.png"
            fillMode: Image.PreserveAspectFit

            MouseArea {
                id: mouseArea2
                anchors.fill: parent
            }
            Keys.onLeftPressed: image1.forceActiveFocus()
            Keys.onRightPressed: image3.forceActiveFocus()
            Keys.onReturnPressed: {
                pathView.visible = true
                pathView.forceActiveFocus()
                bottomRowHide.start()
            }
        }

        Image {
            id: image3
            width: 200
            height: 120
            z:1
            source: "music_e.png"
            fillMode: Image.PreserveAspectFit

            MouseArea {
                id: mouseArea3
                anchors.fill: parent
            }
            Keys.onLeftPressed: image2.forceActiveFocus()
            Keys.onRightPressed: image.forceActiveFocus()
            Keys.onReturnPressed: {
                pathView3.visible = true
                pathView3.forceActiveFocus()
                bottomRowHide.start()
            }
        }

        Keys.onDigit0Pressed: Qt.quit()
    }

    Connections {
        target: mouseArea
        onClicked: {
            print("movie")
            //rectangle2visible = true
        }


    }

    Connections {
        target: mouseArea1
        onClicked: print("clicked")
    }



    Connections {
        target: mouseArea2
        onClicked: print("clicked")
    }

    VideoOutput{
        id:videoOutput
        x: 309
        y: 103
        width: 588
        height: 286
        source: v1

        Video{
            id: v1
            anchors.fill: parent
            transformOrigin: Item.TopLeft
            //anchors.fill: rectangle2
            Keys.onDownPressed: {
                videoOutput.width = 588
                videoOutput.height = 286
                videoOutput.x = 309
                videoOutput.y = 111
                videoOutput.z = 1
                pathView.visible = true
                pathView.forceActiveFocus()

            }
            Keys.onRightPressed: {

                if(v1.volume<=0.9)
                    v1.volume +=0.1
            }
            Keys.onLeftPressed: {

                if(v1.volume >=0.1)
                {
                    v1.volume -=0.1
                }
            }

        }

    }

    Connections {
        target: mouseArea3
        onClicked: print("clicked")
    }

    Text {
        id: element2
        x: 50
        y: 30
        width: 64
        height: 32
        text: qsTr("EXIT")
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 18

        MouseArea {
            id: mouseArea4
            anchors.fill: parent
        }
    }

    Connections {
        target: mouseArea4
        onClicked: Qt.quit()
    }

    Connections {
        target: mouseArea
        onPressed: {

            ani1.start()
            v1.play()


        }

    }

    NumberAnimation {
        id: ani1
        target: videoOutput
        property: "scale"
        from: 0.01
        to:1.0
        duration: 3000
        easing.type: Easing.InOutCubic
    }

    ParallelAnimation{
        id:bottomRowHide

        NumberAnimation{ target: row; property: "y"; to: 700; duration: 500 ;}
        NumberAnimation{ target: row; property: "scale" ; to: 0.1; duration: 500 ; }

    }
    ParallelAnimation{
        id:bottomRowShow

        NumberAnimation{ target: row; property: "y"; to: 563; duration: 500 ;}
        NumberAnimation{ target: row; property: "scale" ; to: 1.0; duration: 500 ; }

    }


    Text {
        id: element4
        x: 58
        y: 68
        width: 80
        height: 42
        text: v1.status
        font.pixelSize: 20
    }

    Connections {
        target: image
        onFocusChanged: {
            if(image.activeFocus == true)
            {
                image.scale = 1.2; image.z = 3

            }
            else
            {
                image.scale = 1.0; image.z = 1

            }
        }
    }

    Connections {
        target: image1
        onFocusChanged: {
            if(image1.activeFocus == true)
            {
                image1.scale = 1.2; image1.z = 3

            }
            else
            {
                image1.scale = 1.0; image1.z = 1

            }
        }
    }

    Connections {
        target: image2
        onFocusChanged: {
            if(image2.activeFocus == true)
            {
                image2.scale = 1.2; image2.z = 3

            }
            else
            {
                image2.scale = 1.0; image2.z = 1

            }
        }
    }


    Connections {
        target: image3
        onFocusChanged: {
            if(image3.activeFocus == true)
            {
                image3.scale = 1.2; image3.z = 3

            }
            else
            {
                image3.scale = 1.0; image3.z = 1

            }
        }
    }


    PathView {
        id: pathView
        x: 394
        y: 415
        width: 492
        height: 194
        offset: 0
        dragMargin: 0
        focus: false
        visible: false
        pathItemCount: 3

        model: ListModel {
            ListElement {
                name: "Tarak Mehta"
                colorCode: "grey"
            }

            ListElement {
                name: "NDTV"
                colorCode: "red"
            }

            ListElement {
                name: "INDIA TV"
                colorCode: "blue"
            }

            ListElement {
                name: "India TV"
                colorCode: "green"
            }
        }
        path: Path {
            id: myPath
            startX: pathView.width*0.1
            startY: pathView.height/2

            PathAttribute {
                name: "iconScale"
                value: 1
            }

            PathAttribute {
                name: "iconZ"
                value: 0
            }

            PathLine {
                x:pathView.width*0.4
                y: pathView.height/2
            }

            PathAttribute {
                name: "iconScale"
                value: 2
            }

            PathAttribute {
                name: "iconZ"
                value: 1000
            }


            PathLine {
                x:pathView.width*0.8
                y: pathView.height/2
            }

            PathAttribute {
                name: "iconScale"
                value: 1
            }

            PathAttribute {
                name: "iconZ"
                value: 0
            }

        }
        delegate: Item {
            id: element5
            width: 80
            height: 80
            scale: PathView.iconScale
            z: PathView.iconZ


            Rectangle {
                height: 60
                color: colorCode
                anchors.top: parent.top
                anchors.topMargin: 0
                anchors.right: parent.right
                anchors.rightMargin: 0
                anchors.left: parent.left
                anchors.leftMargin: 0
            }

            Text {
                id:delegateText
                y: 60
                height: 20
                text: name
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                anchors.right: parent.right
                anchors.rightMargin: 0
                anchors.left: parent.left
                anchors.leftMargin: 0
                font.bold: true
            }


        }
        Keys.onLeftPressed: decrementCurrentIndex()
        Keys.onRightPressed: incrementCurrentIndex()
        Keys.onDownPressed: {bottomRowShow.start(); element1.forceActiveFocus(); pathView.visible = false ; }
        Keys.onUpPressed: {videoOutput.width = window.width; videoOutput.height = window.height; videoOutput.x=0;videoOutput.y=0;videoOutput.z=10; pathView.visible = false; v1.forceActiveFocus() }
        Keys.onReturnPressed:
        {
            if(currentIndex == 0)
            {
                v1.source = "http://ndtvstream-lh.akamaihd.net/i/ndtv_india_1@300634/index_736_av-b.m3u8"
            }
            else if(currentIndex == 1)
            {
                v1.source = "http://indiatvnews-lh.akamaihd.net/i/ITV_1@199237/index_1_av-p.m3u8"
            }
            else if(currentIndex == 2)
            {
                v1.source = "http://indiatvnews-lh.akamaihd.net/i/ITV_1@199237/master.m3u8"
            }
            else
            {
                v1.source = "https://streaming.sonyliv.com/show_sab_taarakmehtakaooltahchashmah_ep2593_1200k.m3u8"
            }
            textInput.text = currentIndex
            //rectangle2.visible = true
            ani1.start()
            v1.play()

        }
    }

    PathView {
        id: pathView2
        x: 394
        y: 415
        width: 492
        height: 194
        offset: 0
        dragMargin: 0
        focus: false
        visible: false
        pathItemCount: 3

        model: ListModel {
            ListElement {
                name: "E3"
                colorCode: "grey"
            }

            ListElement {
                name: "E0"
                colorCode: "red"
            }

            ListElement {
                name: "E1"
                colorCode: "blue"
            }

            ListElement {
                name: "Tarak Mehta"
                colorCode: "green"
            }
        }
        path: Path {
            id: myPath2
            startX: pathView2.width*0.1
            startY: pathView2.height/2

            PathAttribute {
                name: "iconScale"
                value: 1
            }

            PathAttribute {
                name: "iconZ"
                value: 0
            }

            PathLine {
                x:pathView2.width*0.4
                y: pathView2.height/2
            }

            PathAttribute {
                name: "iconScale"
                value: 2
            }

            PathAttribute {
                name: "iconZ"
                value: 1000
            }


            PathLine {
                x:pathView2.width*0.8
                y: pathView2.height/2
            }

            PathAttribute {
                name: "iconScale"
                value: 1
            }

            PathAttribute {
                name: "iconZ"
                value: 0
            }

        }
        delegate: Item {
            id: element52
            width: 80
            height: 80
            scale: PathView.iconScale
            z: PathView.iconZ


            Rectangle {
                height: 60
                color: colorCode
                anchors.top: parent.top
                anchors.topMargin: 0
                anchors.right: parent.right
                anchors.rightMargin: 0
                anchors.left: parent.left
                anchors.leftMargin: 0
            }

            Text {

                y: 60
                height: 20
                text: name
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                anchors.right: parent.right
                anchors.rightMargin: 0
                anchors.left: parent.left
                anchors.leftMargin: 0
                font.bold: true
            }


        }
        Keys.onLeftPressed: decrementCurrentIndex()
        Keys.onRightPressed: incrementCurrentIndex()
        Keys.onDownPressed: {bottomRowShow.start(); element1.forceActiveFocus(); pathView2.visible = false ; }
        Keys.onUpPressed: {videoOutput.width = window.width; videoOutput.height = window.height; videoOutput.x=0;videoOutput.y=0;videoOutput.z=10; pathView2.visible = false; v1.forceActiveFocus() }
        Keys.onReturnPressed:
        {
            if(currentIndex == 3)
            {
                v1.source = "https://ul.cdn574.net:8443/hls/gkxpidu3g7pif.m3u8?s=d_gy-996Jb5JspqHJ39XEA&e=1553976380"
            }
            else if(currentIndex == 0)
            {
                v1.source = "https://streaming.sonyliv.com/show_sab_aladdin_ep54_1200k.m3u8"
            }
            else if(currentIndex == 1)
            {
                v1.source = "https://streaming.sonyliv.com/show_sab_aladdin_ep59_1200k.m3u8"
            }
            else
            {
                ep_no.visible = true
                ep_no.forceActiveFocus()
                //v1.source = "https://streaming.sonyliv.com/show_sab_taarakmehtakaooltahchashmah_ep"+ep_no.text+"_1200k.m3u8"

            }
//            textInput.text = currentIndex
//            ani1.start()
//            v1.play()

        }
    }

    PathView {
        id: pathView3
        x: 394
        y: 415
        width: 492
        height: 194
        offset: 0
        dragMargin: 0
        focus: false
        visible: false
        pathItemCount: 3

        model: ListModel {
            ListElement {
                name: "M3"
                colorCode: "grey"
            }

            ListElement {
                name: "M0"
                colorCode: "red"
            }

            ListElement {
                name: "M1"
                colorCode: "blue"
            }

            ListElement {
                name: "M2"
                colorCode: "green"
            }
        }
        path: Path {
            id: myPath3
            startX: pathView3.width*0.1
            startY: pathView3.height/2

            PathAttribute {
                name: "iconScale"
                value: 1
            }

            PathAttribute {
                name: "iconZ"
                value: 0
            }

            PathLine {
                x:pathView3.width*0.4
                y: pathView3.height/2
            }

            PathAttribute {
                name: "iconScale"
                value: 2
            }

            PathAttribute {
                name: "iconZ"
                value: 1000
            }


            PathLine {
                x:pathView3.width*0.8
                y: pathView3.height/2
            }

            PathAttribute {
                name: "iconScale"
                value: 1
            }

            PathAttribute {
                name: "iconZ"
                value: 0
            }

        }
        delegate: Item {
            id: element53
            width: 80
            height: 80
            scale: PathView.iconScale
            z: PathView.iconZ


            Rectangle {
                height: 60
                color: colorCode
                anchors.top: parent.top
                anchors.topMargin: 0
                anchors.right: parent.right
                anchors.rightMargin: 0
                anchors.left: parent.left
                anchors.leftMargin: 0
            }

            Text {

                y: 60
                height: 20
                text: name
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                anchors.right: parent.right
                anchors.rightMargin: 0
                anchors.left: parent.left
                anchors.leftMargin: 0
                font.bold: true
            }


        }
        Keys.onLeftPressed: decrementCurrentIndex()
        Keys.onRightPressed: incrementCurrentIndex()
        Keys.onDownPressed: {bottomRowShow.start(); element1.forceActiveFocus(); pathView3.visible = false ; }
        Keys.onUpPressed: {videoOutput.width = window.width; videoOutput.height = window.height; videoOutput.x=0;videoOutput.y=0;videoOutput.z=10; pathView3.visible = false; v1.forceActiveFocus() }
        Keys.onReturnPressed:
        {
            if(currentIndex == 3)
            {
                v1.source = "https://ul.cdn574.net:8443/hls/gkxpidu3g7pif.m3u8?s=d_gy-996Jb5JspqHJ39XEA&e=1553976380"
            }
            else if(currentIndex == 0)
            {
                v1.source = "https://streaming.sonyliv.com/show_sab_aladdin_ep54_1200k.m3u8"
            }
            else if(currentIndex == 1)
            {
                v1.source = "https://streaming.sonyliv.com/show_sab_aladdin_ep59_1200k.m3u8"
            }
            else
            {
                v1.source = "https://streaming.sonyliv.com/show_sab_taarakmehtakaooltahchashmah_ep2593_1200k.m3u8"
            }
            textInput.text = currentIndex
            ani1.start()
            v1.play()

        }
    }

    PathView {
        id: pathView4
        x: 394
        y: 415
        width: 492
        height: 194
        offset: 0
        dragMargin: 0
        focus: false
        visible: false
        pathItemCount: 3

        model: ListModel {
            ListElement {
                name: "Star Sports"
                colorCode: "grey"
            }

            ListElement {
                name: "s0"
                colorCode: "red"
            }

            ListElement {
                name: "s1"
                colorCode: "blue"
            }

            ListElement {
                name: "s2"
                colorCode: "green"
            }
        }
        path: Path {
            id: myPath4
            startX: pathView4.width*0.1
            startY: pathView4.height/2

            PathAttribute {
                name: "iconScale"
                value: 1
            }

            PathAttribute {
                name: "iconZ"
                value: 0
            }

            PathLine {
                x:pathView4.width*0.4
                y: pathView4.height/2
            }

            PathAttribute {
                name: "iconScale"
                value: 2
            }

            PathAttribute {
                name: "iconZ"
                value: 1000
            }


            PathLine {
                x:pathView4.width*0.8
                y: pathView4.height/2
            }

            PathAttribute {
                name: "iconScale"
                value: 1
            }

            PathAttribute {
                name: "iconZ"
                value: 0
            }

        }
        delegate: Item {
            id: element54
            width: 80
            height: 80
            scale: PathView.iconScale
            z: PathView.iconZ


            Rectangle {
                height: 60
                color: colorCode
                anchors.top: parent.top
                anchors.topMargin: 0
                anchors.right: parent.right
                anchors.rightMargin: 0
                anchors.left: parent.left
                anchors.leftMargin: 0
            }

            Text {
                id:delegateText4
                y: 60
                height: 20
                text: name
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                anchors.right: parent.right
                anchors.rightMargin: 0
                anchors.left: parent.left
                anchors.leftMargin: 0
                font.bold: true
            }


        }
        Keys.onLeftPressed: decrementCurrentIndex()
        Keys.onRightPressed: incrementCurrentIndex()
        Keys.onDownPressed: {bottomRowShow.start(); element1.forceActiveFocus(); pathView4.visible = false ; }
        Keys.onUpPressed: {videoOutput.width = window.width; videoOutput.height = window.height; videoOutput.x=0;videoOutput.y=0;videoOutput.z=10; pathView4.visible = false; v1.forceActiveFocus() }
        Keys.onReturnPressed:
        {
            if(currentIndex == 3)
            {
                v1.source = "https://ul.cdn574.net:8443/hls/gkxpidu3g7pif.m3u8?s=d_gy-996Jb5JspqHJ39XEA&e=1553976380"
            }
            else if(currentIndex == 0)
            {
                v1.source = "http://indiatvnews-lh.akamaihd.net/i/ITV_1@199237/index_1_av-p.m3u8"
            }
            else if(currentIndex == 1)
            {
                v1.source = "http://indiatvnews-lh.akamaihd.net/i/ITV_1@199237/master.m3u8"
            }
            else
            {
                v1.source = "https://streaming.sonyliv.com/show_sab_taarakmehtakaooltahchashmah_ep2593_1200k.m3u8"
            }
            textInput.text = currentIndex
            //rectangle2.visible = true
            ani1.start()
            v1.play()

        }
    }





}









































/*##^## Designer {
    D{i:2;anchors_height:200;anchors_width:200;anchors_x:215;anchors_y:145}D{i:1;anchors_height:200;anchors_width:200;anchors_x:337;anchors_y:249}
D{i:9;anchors_width:1073;anchors_x:97}D{i:7;anchors_width:1073;anchors_x:97}D{i:11;anchors_height:31;anchors_width:77;anchors_x:1063;anchors_y:85}
D{i:12;invisible:true}D{i:10;anchors_height:31;anchors_width:1073;anchors_x:97;anchors_y:85}
D{i:15;anchors_height:100;anchors_width:100}D{i:14;anchors_height:100;anchors_width:100}
D{i:17;anchors_height:100;anchors_width:100}D{i:16;anchors_height:100;anchors_width:100}
D{i:19;anchors_height:100;anchors_width:100}D{i:18;anchors_height:100;anchors_width:100}
D{i:21;anchors_height:100;anchors_width:100}D{i:20;anchors_height:100;anchors_width:100}
D{i:26;anchors_height:286;anchors_width:588;anchors_x:0;anchors_y:8}D{i:29;anchors_height:100;anchors_width:100}
D{i:28;anchors_height:100;anchors_width:100}
}
 ##^##*/
