/****************************************************************************
** Meta object code from reading C++ file 'gtrans.h'
**
** Created: Thu Mar 18 18:56:47 2010
**      by: The Qt Meta Object Compiler version 61 (Qt 4.5.3)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "gtrans.h"
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'gtrans.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 61
#error "This file was generated using the moc from 4.5.3. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
static const uint qt_meta_data_GTrans[] = {

 // content:
       2,       // revision
       0,       // classname
       0,    0, // classinfo
       2,   12, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors

 // slots: signature, parameters, type, tag, flags
       8,    7,    7,    7, 0x0a,
      24,   18,    7,    7, 0x0a,

       0        // eod
};

static const char qt_meta_stringdata_GTrans[] = {
    "GTrans\0\0doTrans()\0reply\0"
    "finishedSlot(QNetworkReply*)\0"
};

const QMetaObject GTrans::staticMetaObject = {
    { &QWidget::staticMetaObject, qt_meta_stringdata_GTrans,
      qt_meta_data_GTrans, 0 }
};

const QMetaObject *GTrans::metaObject() const
{
    return &staticMetaObject;
}

void *GTrans::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_GTrans))
        return static_cast<void*>(const_cast< GTrans*>(this));
    return QWidget::qt_metacast(_clname);
}

int GTrans::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QWidget::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        switch (_id) {
        case 0: doTrans(); break;
        case 1: finishedSlot((*reinterpret_cast< QNetworkReply*(*)>(_a[1]))); break;
        default: ;
        }
        _id -= 2;
    }
    return _id;
}
QT_END_MOC_NAMESPACE
