# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'D:\Virusya\Prohramu\Python\Kursova\form.ui'
#
# Created: Sun Nov 27 17:23:04 2011
#      by: PyQt4 UI code generator 4.8.6
#
# WARNING! All changes made in this file will be lost!

from PyQt4 import QtCore, QtGui

try:
    _fromUtf8 = QtCore.QString.fromUtf8
except AttributeError:
    _fromUtf8 = lambda s: s

class Ui_MainWindow(object):
    def setupUi(self, MainWindow):
        MainWindow.setObjectName(_fromUtf8("MainWindow"))
        MainWindow.resize(473, 401)
        MainWindow.setWindowTitle(QtGui.QApplication.translate("MainWindow", "MainWindow", None, QtGui.QApplication.UnicodeUTF8))
        self.centralwidget = QtGui.QWidget(MainWindow)
        self.centralwidget.setObjectName(_fromUtf8("centralwidget"))
        self.firstnameLineEdit = QtGui.QLineEdit(self.centralwidget)
        self.firstnameLineEdit.setGeometry(QtCore.QRect(20, 70, 113, 20))
        self.firstnameLineEdit.setObjectName(_fromUtf8("firstnameLineEdit"))
        self.label = QtGui.QLabel(self.centralwidget)
        self.label.setGeometry(QtCore.QRect(120, 10, 161, 16))
        font = QtGui.QFont()
        font.setFamily(_fromUtf8("Times New Roman"))
        font.setPointSize(14)
        font.setBold(True)
        font.setWeight(75)
        self.label.setFont(font)
        self.label.setLocale(QtCore.QLocale(QtCore.QLocale.Ukrainian, QtCore.QLocale.Ukraine))
        self.label.setLineWidth(5)
        self.label.setText(QtGui.QApplication.translate("MainWindow", "Введіть ваші дані ", None, QtGui.QApplication.UnicodeUTF8))
        self.label.setObjectName(_fromUtf8("label"))
        self.label_2 = QtGui.QLabel(self.centralwidget)
        self.label_2.setGeometry(QtCore.QRect(20, 40, 111, 16))
        self.label_2.setText(QtGui.QApplication.translate("MainWindow", "Прізвище ", None, QtGui.QApplication.UnicodeUTF8))
        self.label_2.setObjectName(_fromUtf8("label_2"))
        self.label_3 = QtGui.QLabel(self.centralwidget)
        self.label_3.setGeometry(QtCore.QRect(170, 40, 91, 21))
        self.label_3.setText(QtGui.QApplication.translate("MainWindow", "Ім\'я ", None, QtGui.QApplication.UnicodeUTF8))
        self.label_3.setObjectName(_fromUtf8("label_3"))
        self.label_4 = QtGui.QLabel(self.centralwidget)
        self.label_4.setGeometry(QtCore.QRect(320, 40, 81, 16))
        self.label_4.setText(QtGui.QApplication.translate("MainWindow", "По - батькові ", None, QtGui.QApplication.UnicodeUTF8))
        self.label_4.setObjectName(_fromUtf8("label_4"))
        self.label_5 = QtGui.QLabel(self.centralwidget)
        self.label_5.setGeometry(QtCore.QRect(20, 190, 81, 31))
        self.label_5.setText(QtGui.QApplication.translate("MainWindow", "Стать ", None, QtGui.QApplication.UnicodeUTF8))
        self.label_5.setObjectName(_fromUtf8("label_5"))
        self.label_6 = QtGui.QLabel(self.centralwidget)
        self.label_6.setGeometry(QtCore.QRect(170, 190, 101, 31))
        self.label_6.setText(QtGui.QApplication.translate("MainWindow", "Сімейний стан ", None, QtGui.QApplication.UnicodeUTF8))
        self.label_6.setObjectName(_fromUtf8("label_6"))
        self.label_7 = QtGui.QLabel(self.centralwidget)
        self.label_7.setGeometry(QtCore.QRect(320, 190, 111, 31))
        self.label_7.setText(QtGui.QApplication.translate("MainWindow", "Релігійна", None, QtGui.QApplication.UnicodeUTF8))
        self.label_7.setObjectName(_fromUtf8("label_7"))
        self.CBday = QtGui.QComboBox(self.centralwidget)
        self.CBday.setGeometry(QtCore.QRect(20, 160, 111, 21))
        self.CBday.setFrame(True)
        self.CBday.setModelColumn(0)
        self.CBday.setObjectName(_fromUtf8("CBday"))
        self.CBday.addItem(_fromUtf8(""))
        self.CBday.setItemText(0, QtGui.QApplication.translate("MainWindow", "1", None, QtGui.QApplication.UnicodeUTF8))
        self.CBday.addItem(_fromUtf8(""))
        self.CBday.setItemText(1, QtGui.QApplication.translate("MainWindow", "2", None, QtGui.QApplication.UnicodeUTF8))
        self.CBday.addItem(_fromUtf8(""))
        self.CBday.setItemText(2, QtGui.QApplication.translate("MainWindow", "3", None, QtGui.QApplication.UnicodeUTF8))
        self.CBday.addItem(_fromUtf8(""))
        self.CBday.setItemText(3, QtGui.QApplication.translate("MainWindow", "4", None, QtGui.QApplication.UnicodeUTF8))
        self.CBday.addItem(_fromUtf8(""))
        self.CBday.setItemText(4, QtGui.QApplication.translate("MainWindow", "5", None, QtGui.QApplication.UnicodeUTF8))
        self.CBday.addItem(_fromUtf8(""))
        self.CBday.setItemText(5, QtGui.QApplication.translate("MainWindow", "6", None, QtGui.QApplication.UnicodeUTF8))
        self.CBday.addItem(_fromUtf8(""))
        self.CBday.setItemText(6, QtGui.QApplication.translate("MainWindow", "7", None, QtGui.QApplication.UnicodeUTF8))
        self.CBday.addItem(_fromUtf8(""))
        self.CBday.setItemText(7, QtGui.QApplication.translate("MainWindow", "8", None, QtGui.QApplication.UnicodeUTF8))
        self.CBday.addItem(_fromUtf8(""))
        self.CBday.setItemText(8, QtGui.QApplication.translate("MainWindow", "9", None, QtGui.QApplication.UnicodeUTF8))
        self.CBday.addItem(_fromUtf8(""))
        self.CBday.setItemText(9, QtGui.QApplication.translate("MainWindow", "10", None, QtGui.QApplication.UnicodeUTF8))
        self.CBday.addItem(_fromUtf8(""))
        self.CBday.setItemText(10, QtGui.QApplication.translate("MainWindow", "11", None, QtGui.QApplication.UnicodeUTF8))
        self.CBday.addItem(_fromUtf8(""))
        self.CBday.setItemText(11, QtGui.QApplication.translate("MainWindow", "12", None, QtGui.QApplication.UnicodeUTF8))
        self.CBday.addItem(_fromUtf8(""))
        self.CBday.setItemText(12, QtGui.QApplication.translate("MainWindow", "13", None, QtGui.QApplication.UnicodeUTF8))
        self.CBday.addItem(_fromUtf8(""))
        self.CBday.setItemText(13, QtGui.QApplication.translate("MainWindow", "14", None, QtGui.QApplication.UnicodeUTF8))
        self.CBday.addItem(_fromUtf8(""))
        self.CBday.setItemText(14, QtGui.QApplication.translate("MainWindow", "15", None, QtGui.QApplication.UnicodeUTF8))
        self.CBday.addItem(_fromUtf8(""))
        self.CBday.setItemText(15, QtGui.QApplication.translate("MainWindow", "16", None, QtGui.QApplication.UnicodeUTF8))
        self.CBday.addItem(_fromUtf8(""))
        self.CBday.setItemText(16, QtGui.QApplication.translate("MainWindow", "17", None, QtGui.QApplication.UnicodeUTF8))
        self.CBday.addItem(_fromUtf8(""))
        self.CBday.setItemText(17, QtGui.QApplication.translate("MainWindow", "18", None, QtGui.QApplication.UnicodeUTF8))
        self.CBday.addItem(_fromUtf8(""))
        self.CBday.setItemText(18, QtGui.QApplication.translate("MainWindow", "19", None, QtGui.QApplication.UnicodeUTF8))
        self.CBday.addItem(_fromUtf8(""))
        self.CBday.setItemText(19, QtGui.QApplication.translate("MainWindow", "20", None, QtGui.QApplication.UnicodeUTF8))
        self.CBday.addItem(_fromUtf8(""))
        self.CBday.setItemText(20, QtGui.QApplication.translate("MainWindow", "21", None, QtGui.QApplication.UnicodeUTF8))
        self.CBday.addItem(_fromUtf8(""))
        self.CBday.setItemText(21, QtGui.QApplication.translate("MainWindow", "22", None, QtGui.QApplication.UnicodeUTF8))
        self.CBday.addItem(_fromUtf8(""))
        self.CBday.setItemText(22, QtGui.QApplication.translate("MainWindow", "23", None, QtGui.QApplication.UnicodeUTF8))
        self.CBday.addItem(_fromUtf8(""))
        self.CBday.setItemText(23, QtGui.QApplication.translate("MainWindow", "24", None, QtGui.QApplication.UnicodeUTF8))
        self.CBday.addItem(_fromUtf8(""))
        self.CBday.setItemText(24, QtGui.QApplication.translate("MainWindow", "25", None, QtGui.QApplication.UnicodeUTF8))
        self.CBday.addItem(_fromUtf8(""))
        self.CBday.setItemText(25, QtGui.QApplication.translate("MainWindow", "26", None, QtGui.QApplication.UnicodeUTF8))
        self.CBday.addItem(_fromUtf8(""))
        self.CBday.setItemText(26, QtGui.QApplication.translate("MainWindow", "27", None, QtGui.QApplication.UnicodeUTF8))
        self.CBday.addItem(_fromUtf8(""))
        self.CBday.setItemText(27, QtGui.QApplication.translate("MainWindow", "28", None, QtGui.QApplication.UnicodeUTF8))
        self.CBday.addItem(_fromUtf8(""))
        self.CBday.setItemText(28, QtGui.QApplication.translate("MainWindow", "29", None, QtGui.QApplication.UnicodeUTF8))
        self.CBday.addItem(_fromUtf8(""))
        self.CBday.setItemText(29, QtGui.QApplication.translate("MainWindow", "30", None, QtGui.QApplication.UnicodeUTF8))
        self.CBday.addItem(_fromUtf8(""))
        self.CBday.setItemText(30, QtGui.QApplication.translate("MainWindow", "31", None, QtGui.QApplication.UnicodeUTF8))
        self.CBmerr = QtGui.QComboBox(self.centralwidget)
        self.CBmerr.setGeometry(QtCore.QRect(170, 240, 111, 21))
        self.CBmerr.setObjectName(_fromUtf8("CBmerr"))
        self.CBmerr.addItem(_fromUtf8(""))
        self.CBmerr.setItemText(0, QtGui.QApplication.translate("MainWindow", "merried ", None, QtGui.QApplication.UnicodeUTF8))
        self.CBmerr.addItem(_fromUtf8(""))
        self.CBmerr.setItemText(1, QtGui.QApplication.translate("MainWindow", "unmarried", None, QtGui.QApplication.UnicodeUTF8))
        self.CBmerr.addItem(_fromUtf8(""))
        self.CBmerr.setItemText(2, QtGui.QApplication.translate("MainWindow", "uninterested", None, QtGui.QApplication.UnicodeUTF8))
        self.CBChist = QtGui.QComboBox(self.centralwidget)
        self.CBChist.setGeometry(QtCore.QRect(320, 240, 111, 21))
        self.CBChist.setObjectName(_fromUtf8("CBChist"))
        self.CBChist.addItem(_fromUtf8(""))
        self.CBChist.setItemText(0, QtGui.QApplication.translate("MainWindow", "Christianity", None, QtGui.QApplication.UnicodeUTF8))
        self.CBChist.addItem(_fromUtf8(""))
        self.CBChist.setItemText(1, QtGui.QApplication.translate("MainWindow", "Islam", None, QtGui.QApplication.UnicodeUTF8))
        self.CBChist.addItem(_fromUtf8(""))
        self.CBChist.setItemText(2, QtGui.QApplication.translate("MainWindow", "Protestantism", None, QtGui.QApplication.UnicodeUTF8))
        self.CBChist.addItem(_fromUtf8(""))
        self.CBChist.setItemText(3, QtGui.QApplication.translate("MainWindow", "Judaism", None, QtGui.QApplication.UnicodeUTF8))
        self.CBChist.addItem(_fromUtf8(""))
        self.CBChist.setItemText(4, QtGui.QApplication.translate("MainWindow", "Buddhism", None, QtGui.QApplication.UnicodeUTF8))
        self.CBChist.addItem(_fromUtf8(""))
        self.CBChist.setItemText(5, QtGui.QApplication.translate("MainWindow", "Confucianism", None, QtGui.QApplication.UnicodeUTF8))
        self.CBChist.addItem(_fromUtf8(""))
        self.CBChist.setItemText(6, QtGui.QApplication.translate("MainWindow", "other", None, QtGui.QApplication.UnicodeUTF8))
        self.label_8 = QtGui.QLabel(self.centralwidget)
        self.label_8.setGeometry(QtCore.QRect(320, 210, 111, 31))
        self.label_8.setText(QtGui.QApplication.translate("MainWindow", "приналежність", None, QtGui.QApplication.UnicodeUTF8))
        self.label_8.setObjectName(_fromUtf8("label_8"))
        self.label_9 = QtGui.QLabel(self.centralwidget)
        self.label_9.setGeometry(QtCore.QRect(20, 130, 46, 13))
        self.label_9.setText(QtGui.QApplication.translate("MainWindow", "День ", None, QtGui.QApplication.UnicodeUTF8))
        self.label_9.setObjectName(_fromUtf8("label_9"))
        self.label_10 = QtGui.QLabel(self.centralwidget)
        self.label_10.setGeometry(QtCore.QRect(180, 130, 46, 13))
        self.label_10.setText(QtGui.QApplication.translate("MainWindow", "Мсяць ", None, QtGui.QApplication.UnicodeUTF8))
        self.label_10.setObjectName(_fromUtf8("label_10"))
        self.label_11 = QtGui.QLabel(self.centralwidget)
        self.label_11.setGeometry(QtCore.QRect(320, 130, 71, 16))
        self.label_11.setText(QtGui.QApplication.translate("MainWindow", "Вікова група", None, QtGui.QApplication.UnicodeUTF8))
        self.label_11.setObjectName(_fromUtf8("label_11"))
        self.label_12 = QtGui.QLabel(self.centralwidget)
        self.label_12.setGeometry(QtCore.QRect(20, 100, 131, 31))
        self.label_12.setText(QtGui.QApplication.translate("MainWindow", "Дата народження ", None, QtGui.QApplication.UnicodeUTF8))
        self.label_12.setObjectName(_fromUtf8("label_12"))
        self.CBmale = QtGui.QComboBox(self.centralwidget)
        self.CBmale.setGeometry(QtCore.QRect(20, 240, 111, 21))
        self.CBmale.setObjectName(_fromUtf8("CBmale"))
        self.CBmale.addItem(_fromUtf8(""))
        self.CBmale.setItemText(0, QtGui.QApplication.translate("MainWindow", "male", None, QtGui.QApplication.UnicodeUTF8))
        self.CBmale.addItem(_fromUtf8(""))
        self.CBmale.setItemText(1, QtGui.QApplication.translate("MainWindow", "female", None, QtGui.QApplication.UnicodeUTF8))
        self.CBmounce = QtGui.QComboBox(self.centralwidget)
        self.CBmounce.setGeometry(QtCore.QRect(170, 160, 111, 21))
        self.CBmounce.setObjectName(_fromUtf8("CBmounce"))
        self.CBmounce.addItem(_fromUtf8(""))
        self.CBmounce.setItemText(0, QtGui.QApplication.translate("MainWindow", "January", None, QtGui.QApplication.UnicodeUTF8))
        self.CBmounce.addItem(_fromUtf8(""))
        self.CBmounce.setItemText(1, QtGui.QApplication.translate("MainWindow", "Fabruary", None, QtGui.QApplication.UnicodeUTF8))
        self.CBmounce.addItem(_fromUtf8(""))
        self.CBmounce.setItemText(2, QtGui.QApplication.translate("MainWindow", "March", None, QtGui.QApplication.UnicodeUTF8))
        self.CBmounce.addItem(_fromUtf8(""))
        self.CBmounce.setItemText(3, QtGui.QApplication.translate("MainWindow", "April", None, QtGui.QApplication.UnicodeUTF8))
        self.CBmounce.addItem(_fromUtf8(""))
        self.CBmounce.setItemText(4, QtGui.QApplication.translate("MainWindow", "May", None, QtGui.QApplication.UnicodeUTF8))
        self.CBmounce.addItem(_fromUtf8(""))
        self.CBmounce.setItemText(5, QtGui.QApplication.translate("MainWindow", "June", None, QtGui.QApplication.UnicodeUTF8))
        self.CBmounce.addItem(_fromUtf8(""))
        self.CBmounce.setItemText(6, QtGui.QApplication.translate("MainWindow", "July", None, QtGui.QApplication.UnicodeUTF8))
        self.CBmounce.addItem(_fromUtf8(""))
        self.CBmounce.setItemText(7, QtGui.QApplication.translate("MainWindow", "August", None, QtGui.QApplication.UnicodeUTF8))
        self.CBmounce.addItem(_fromUtf8(""))
        self.CBmounce.setItemText(8, QtGui.QApplication.translate("MainWindow", "September", None, QtGui.QApplication.UnicodeUTF8))
        self.CBmounce.addItem(_fromUtf8(""))
        self.CBmounce.setItemText(9, QtGui.QApplication.translate("MainWindow", "October", None, QtGui.QApplication.UnicodeUTF8))
        self.CBmounce.addItem(_fromUtf8(""))
        self.CBmounce.setItemText(10, QtGui.QApplication.translate("MainWindow", "November", None, QtGui.QApplication.UnicodeUTF8))
        self.CBmounce.addItem(_fromUtf8(""))
        self.CBmounce.setItemText(11, QtGui.QApplication.translate("MainWindow", "December", None, QtGui.QApplication.UnicodeUTF8))
        self.CByear = QtGui.QComboBox(self.centralwidget)
        self.CByear.setGeometry(QtCore.QRect(320, 160, 111, 21))
        self.CByear.setObjectName(_fromUtf8("CByear"))
        self.CByear.addItem(_fromUtf8(""))
        self.CByear.setItemText(0, QtGui.QApplication.translate("MainWindow", "less then 10", None, QtGui.QApplication.UnicodeUTF8))
        self.CByear.addItem(_fromUtf8(""))
        self.CByear.setItemText(1, QtGui.QApplication.translate("MainWindow", "10 - 15", None, QtGui.QApplication.UnicodeUTF8))
        self.CByear.addItem(_fromUtf8(""))
        self.CByear.setItemText(2, QtGui.QApplication.translate("MainWindow", "15 - 20", None, QtGui.QApplication.UnicodeUTF8))
        self.CByear.addItem(_fromUtf8(""))
        self.CByear.setItemText(3, QtGui.QApplication.translate("MainWindow", "20 - 30", None, QtGui.QApplication.UnicodeUTF8))
        self.CByear.addItem(_fromUtf8(""))
        self.CByear.setItemText(4, QtGui.QApplication.translate("MainWindow", "30 - 40", None, QtGui.QApplication.UnicodeUTF8))
        self.CByear.addItem(_fromUtf8(""))
        self.CByear.setItemText(5, QtGui.QApplication.translate("MainWindow", "40 - 50", None, QtGui.QApplication.UnicodeUTF8))
        self.CByear.addItem(_fromUtf8(""))
        self.CByear.setItemText(6, QtGui.QApplication.translate("MainWindow", "50 - 55", None, QtGui.QApplication.UnicodeUTF8))
        self.CByear.addItem(_fromUtf8(""))
        self.CByear.setItemText(7, QtGui.QApplication.translate("MainWindow", "55 - 65", None, QtGui.QApplication.UnicodeUTF8))
        self.CByear.addItem(_fromUtf8(""))
        self.CByear.setItemText(8, QtGui.QApplication.translate("MainWindow", "65 - 75", None, QtGui.QApplication.UnicodeUTF8))
        self.CByear.addItem(_fromUtf8(""))
        self.CByear.setItemText(9, QtGui.QApplication.translate("MainWindow", "75 - 80", None, QtGui.QApplication.UnicodeUTF8))
        self.CByear.addItem(_fromUtf8(""))
        self.CByear.setItemText(10, QtGui.QApplication.translate("MainWindow", "more then 80", None, QtGui.QApplication.UnicodeUTF8))
        self.secondnameLineEdit = QtGui.QLineEdit(self.centralwidget)
        self.secondnameLineEdit.setGeometry(QtCore.QRect(170, 70, 113, 20))
        self.secondnameLineEdit.setObjectName(_fromUtf8("secondnameLineEdit"))
        self.lastnameLineEdit = QtGui.QLineEdit(self.centralwidget)
        self.lastnameLineEdit.setGeometry(QtCore.QRect(320, 70, 113, 20))
        self.lastnameLineEdit.setObjectName(_fromUtf8("lastnameLineEdit"))
        self.sendButton = QtGui.QPushButton(self.centralwidget)
        self.sendButton.setGeometry(QtCore.QRect(360, 300, 75, 23))
        self.sendButton.setText(QtGui.QApplication.translate("MainWindow", "Відправити", None, QtGui.QApplication.UnicodeUTF8))
        self.sendButton.setObjectName(_fromUtf8("sendButton"))
        MainWindow.setCentralWidget(self.centralwidget)
        self.menubar = QtGui.QMenuBar(MainWindow)
        self.menubar.setGeometry(QtCore.QRect(0, 0, 473, 20))
        self.menubar.setObjectName(_fromUtf8("menubar"))
        MainWindow.setMenuBar(self.menubar)
        self.statusbar = QtGui.QStatusBar(MainWindow)
        self.statusbar.setObjectName(_fromUtf8("statusbar"))
        MainWindow.setStatusBar(self.statusbar)

        self.retranslateUi(MainWindow)
        QtCore.QMetaObject.connectSlotsByName(MainWindow)

    def retranslateUi(self, MainWindow):
        pass
