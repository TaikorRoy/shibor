# -*- coding: utf-8 -*-

from shibor_crawl import shibor_crawl_and_parse
import time
from mysql_updater_baseClass import MySQLUpdater
import json
import requests

time_span = 5
link_url = r"http://www.shibor.org/shibor/web/html/shibor.html"
while True:
    mysql = MySQLUpdater()
    existed = mysql.pull_records()
    print(existed)
    records = shibor_crawl_and_parse()
    new_data = list()
    for record in records:
        item = record.split(" ")
        item[3] = item[3] + " " + item[4]
        if item[3] not in existed:
            new_data.append(item)
    for data in new_data:
        sql = r"INSERT INTO shibor (term, rate, change, linkurl, issuetime) VALUES ('%s', '%s', '%s', '%s', '%s')" % (data[0], data[1], data[2], link_url, data[3])
        mysql.query(sql)
        shibor_data = {"term": data[0], "rate": data[1], "change": data[2], "linkurl": link_url, "issuetime": data[3]}
        api_url = "http://localhost/shibor_data_handler.php"
        headers = {'Content-type': 'application/json', 'Accept': 'text/plain'}
        #r = requests.post(api_url, data=json.dumps(shibor_data), headers=headers)
        #print(r.text)
    mysql.clean_up()
    time.sleep(time_span)