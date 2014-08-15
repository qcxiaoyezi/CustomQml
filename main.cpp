#include <QApplication>
#include <QQmlApplicationEngine>
#include <QCursor>
#include <QQmlContext>
#include <QVariant>
#include <QPushButton>
#include "cursor.h"


int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:///qml/main.qml")));
    engine.rootContext()->setContextProperty("G_Cursor",new Cursor);


    return app.exec();
}
