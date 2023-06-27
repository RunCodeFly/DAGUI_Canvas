import QtQuick
import QtQuick.Controls 2.15

ApplicationWindow {
    width: 1180
    height: 620
    visible: true
    title: qsTr("Hello World")

//    Qan.GraphView {

//        id: graphView
//        anchors.fill: parent
//        graph: topology
//        navigable: true
//        resizeHandlerColor: Material.accent
//        gridThickColor: Material.theme === Material.Dark ? "#4e4e4e" : "#c1c1c1"

//        Qan.FaceGraph {
//            id: topology
//            objectName: "graph"
//            anchors.fill: parent
//            clip: true
//            connectorEnabled: true
//            selectionColor: Material.accent
//            connectorColor: Material.accent
//            connectorEdgeColor: Material.accent
//            onConnectorEdgeInserted: edge => {
//                if (edge)
//                    edge.label = "My edge"
//            }
//            property Component faceNodeComponent: Qt.createComponent("qrc:/FaceNode.qml")
//            onNodeClicked: node => {
//                portsListView.model = node.item.ports
//            }
//            onNodeRightClicked: (node, pos) => {
//                const globalPos = node.item.mapToItem(topology, pos.x, pos.y)
//                menu.x = globalPos.x
//                menu.y = globalPos.y
//                menu.targetNode = node
//                menu.open()
//            }
//            onGroupRightClicked: (group, pos) => {
//                const globalPos = group.item.mapToItem(topology, pos.x, pos.y)
//                menu.x = globalPos.x
//                menu.y = globalPos.y
//                menu.targetGroup = group
//                menu.open()
//            }
//            onEdgeRightClicked: (edge, pos) => {
//                if (!edge || !edge.item)
//                    return
//                const globalPos = edge.item.mapToItem(topology, pos.x, pos.y)
//                menu.x = globalPos.x
//                menu.y = globalPos.y
//                menu.targetEdge = edge
//                menu.open()
//            }
//            onPortRightClicked: (port, pos) => {
//                var globalPos = port.parent.mapToItem(topology, pos.x, pos.y)
//                menuRmPort.x = globalPos.x
//                menuRmPort.y = globalPos.y
//                menuRmPort.targetPort = port
//                menuRmPort.open()
//            }

//            Component.onCompleted: {
//                defaultEdgeStyle.lineWidth = 3
//                defaultEdgeStyle.lineColor = Qt.binding(function () {
//                    return Material.foreground
//                })
//                defaultNodeStyle.shadowColor = Qt.binding(function () {
//                    return Material.theme === Material.Dark ? Qt.darker(
//                                                                  Material.foreground) : Qt.darker(
//                                                                  Material.foreground)
//                })
//                defaultNodeStyle.backColor = Qt.binding(function () {
//                    return Material.theme === Material.Dark ? Qt.lighter(
//                                                                  Material.background) : Qt.lighter(
//                                                                  Material.background)
//                })
//                defaultGroupStyle.backColor = Qt.binding(function () {
//                    return Material.theme === Material.Dark ? Qt.lighter(
//                                                                  Material.background,
//                                                                  1.3) : Qt.darker(
//                                                                  Material.background,
//                                                                  1.1)
//                })

//                /*
//                var bw1 = topology.insertFaceNode()
//                bw1.image = "qrc:/faces/BW1.jpg"
//                bw1.item.x = 150
//                bw1.item.y = 55
//                var bw1p1 = topology.insertPort(bw1, Qan.NodeItem.Right)
//                bw1p1.label = "P#1"
//                var bw1p2 = topology.insertPort(bw1, Qan.NodeItem.Bottom)
//                bw1p2.label = "P#2"
//                var bw1p3 = topology.insertPort(bw1, Qan.NodeItem.Bottom)
//                bw1p3.label = "P#3"

//                var bw2 = topology.insertFaceNode()
//                bw2.image = "qrc:/faces/BW2.jpg"
//                bw2.item.x = 45
//                bw2.item.y = 250
//                var bw2p1 = topology.insertPort(bw2, Qan.NodeItem.Top)
//                bw2p1.label = "P#1"

//                var bw3 = topology.insertFaceNode()
//                bw3.image = "qrc:/faces/BW3.jpg"
//                bw3.item.x = 250
//                bw3.item.y = 250
//                var bw3p1 = topology.insertPort(bw3, Qan.NodeItem.Top)
//                bw3p1.label = "P#1"

//                var js1 = topology.insertFaceNode()
//                js1.image = "qrc:/faces/JS1.jpg"
//                js1.item.x = 500
//                js1.item.y = 55
//                var js1p1 = topology.insertPort(js1, Qan.NodeItem.Left)
//                js1p1.label = "P#1"
//                var js1p2 = topology.insertPort(js1, Qan.NodeItem.Bottom)
//                js1p2.label = "P#2"
//                var js1p3 = topology.insertPort(js1, Qan.NodeItem.Bottom)
//                js1p3.label = "P#3"
//                var js1p4 = topology.insertPort(js1, Qan.NodeItem.Top)
//                js1p4.label = "P#4"

//                var js2 = topology.insertFaceNode()
//                js2.image = "qrc:/faces/JS2.jpg"
//                js2.item.x = 500
//                js2.item.y = -155
//                var js2p1 = topology.insertPort(js2, Qan.NodeItem.Bottom)
//                js2p1.label = "P#1"

//                var vd1 = topology.insertFaceNode()
//                vd1.image = "qrc:/faces/VD1.jpg"
//                vd1.item.x = 400
//                vd1.item.y = 350
//                var vd1p1 = topology.insertPort(vd1, Qan.NodeItem.Top)
//                vd1p1.label = "P#1"
//                var vd1p2 = topology.insertPort(vd1, Qan.NodeItem.Bottom)
//                vd1p2.label = "P#2"
//                var vd1p3 = topology.insertPort(vd1, Qan.NodeItem.Bottom)
//                vd1p3.label = "P#3"

//                var vd2 = topology.insertFaceNode()
//                vd2.image = "qrc:/faces/VD2.jpg"
//                vd2.item.x = 200
//                vd2.item.y = 600
//                var vd2p1 = topology.insertPort(vd2, Qan.NodeItem.Top)
//                vd2p1.label = "P#1"

//                var vd3 = topology.insertFaceNode()
//                vd3.image = "qrc:/faces/VD3.jpg"
//                vd3.item.x = 400
//                vd3.item.y = 600
//                var vd3p1 = topology.insertPort(vd3, Qan.NodeItem.Top)
//                vd3p1.label = "P#1"

//                var dd1 = topology.insertFaceNode()
//                dd1.image = "qrc:/faces/DD1.jpg"
//                dd1.item.x = 650
//                dd1.item.y = 350
//                var dd1p1 = topology.insertPort(dd1, Qan.NodeItem.Top)
//                dd1p1.label = "P#1"
//                var dd1p2 = topology.insertPort(dd1, Qan.NodeItem.Bottom)
//                dd1p2.label = "P#2"
//                var dd1p3 = topology.insertPort(dd1, Qan.NodeItem.Bottom)
//                dd1p3.label = "P#3"

//                var dd2 = topology.insertFaceNode()
//                dd2.image = "qrc:/faces/DD2.jpg"
//                dd2.item.x = 650
//                dd2.item.y = 600
//                var dd2p1 = topology.insertPort(dd2, Qan.NodeItem.Top)
//                dd2p1.label = "P#1"

//                var dd3 = topology.insertFaceNode()
//                dd3.image = "qrc:/faces/DD3.jpg"
//                dd3.item.x = 800
//                dd3.item.y = 600
//                var dd3p1 = topology.insertPort(dd3, Qan.NodeItem.Top)
//                dd3p1.label = "P#1"
//                */

//                /* e = topology.insertEdge(bw2, bw1)
//                 topology.bindEdgeSource(e, bw2p1)
//                 topology.bindEdgeDestination(e, bw1p2)
//                 e = topology.insertEdge(bw3, bw1)
//                 topology.bindEdgeSource(e, bw3p1)
//                 topology.bindEdgeDestination(e, bw1p3)

//                 e = topology.insertEdge(js1, js2)
//                 topology.bindEdgeSource(e, js1p4)
//                 topology.bindEdgeDestination(e, js2p1)

//                 e = topology.insertEdge(js1, vd1)
//                 topology.bindEdgeSource(e, js1p2)
//                 topology.bindEdgeDestination(e, vd1p1)

//                 e = topology.insertEdge(js1, dd1)
//                 topology.bindEdgeSource(e, js1p3)
//                 topology.bindEdgeDestination(e, dd1p1)

//                 e = topology.insertEdge(dd2, dd1)
//                 topology.bindEdgeSource(e, dd2p1)
//                 topology.bindEdgeDestination(e, dd1p2)

//                 e = topology.insertEdge(dd3, dd1)
//                 topology.bindEdgeSource(e, dd3p1)
//                 topology.bindEdgeDestination(e, dd1p3)

//                 e = topology.insertEdge(vd2, vd1)
//                 topology.bindEdgeSource(e, vd2p1)
//                 topology.bindEdgeDestination(e, vd1p2)

//                 e = topology.insertEdge(vd3, vd1)
//                 topology.bindEdgeSource(e, vd3p1)
//                 topology.bindEdgeDestination(e, vd1p3)*/
//            }
//        } // Qan.Graph: graph
//        onRightClicked: pos => {
//            //let globalPos = graphView.mapToItem(topology, pos.x, pos.y)
//            menu.targetNode = undefined
//            menu.targetEdge = undefined
//            menu.open()
//        }
//    }

}
