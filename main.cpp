#include <QGuiApplication>
#include <QQmlApplicationEngine>
//#include <QQuickStyle>
#include <QtQuickControls2/QQuickStyle>
#include <QIcon>
//#include "qanGraphView.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    app.setQuitOnLastWindowClosed(true);
    QQuickStyle::setStyle("Material");

    QStringList themePaths; themePaths << "qrc:/icons"
                                       << "qrc:/icons/Qan";
    QIcon::setFallbackSearchPaths(QIcon::fallbackSearchPaths() << themePaths);
    QIcon::setThemeSearchPaths(QIcon::themeSearchPaths() << themePaths);
    QIcon::setThemeName(QStringLiteral("Qan"));

    QQmlApplicationEngine engine;

    const QUrl url(u"qrc:/DAG_Canvas/main.qml"_qs);
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);


    //qmlRegisterType<qan::FaceNode>("TopologySample", 1, 0, "AbstractFaceNode");
    //qmlRegisterType<qan::FaceGraph>("TopologySample", 1, 0, "FaceGraph");
    //qmlRegisterType<qan::GraphView>("QuickQanava", 2, 0, "AbstractGraphView");

    engine.load(url);

    return app.exec();
}
