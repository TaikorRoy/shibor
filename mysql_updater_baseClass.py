# -*- coding: utf-8 -*-
__author__ = 'Taikor'

import MySQLdb
import time
import codecs


class MySQLUpdater(object):
    HOST = "localhost"
    USER = "root"
    PASSWD = ""
    DB = "shibor"

    def __init__(self):
        self.db = MySQLdb.Connect(
            host=MySQLUpdater.HOST,
            user=MySQLUpdater.USER,
            passwd=MySQLUpdater.PASSWD,
            db=MySQLUpdater.DB,
        )
        self.db.query('SET NAMES utf8')
        self.cursor = self.db.cursor()


    def query(self, sql):
        sql = sql.encode('utf8')
        try:
            self.cursor.execute(sql)
            self.db.commit()
            print("DB Insertion Succeed !")
        except:
            print("DB Insertion Failed !")
            with codecs.open("debug_sql_log", "a", encoding="utf8") as fl:
                fl.write(unicode(sql, "utf8"))
            self.db.rollback()

    def pull_records(self):
        sql = r"select issuetime from shibor order by issuetime desc limit 100"
        sql = sql.encode('utf8')
        self.cursor.execute(sql)
        self.db.commit()
        issuetime = list()
        list_buffer = self.cursor.fetchall()
        for item in list_buffer:
            print(item)
            issuetime.append(item[0])
        return issuetime

    def clean_up(self):
        self.db.close()