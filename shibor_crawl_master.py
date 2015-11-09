# -*- coding: utf-8 -*-

from shibor_crawl import shibor_crawl_and_parse
import time
from mysql_updater_baseClass import MySQLUpdater
from check_remote_mysql import check_remote
import json
import requests
from lib import get_formated_time

time_span = 5
link_url = r"http://www.shibor.org/shibor/web/html/shibor.html"
while True:
    mysql = MySQLUpdater()
    # existed = mysql.pull_records()
    existed = check_remote(100)
    records = shibor_crawl_and_parse()
    new_data = list()
    for record in records:
        item = record.split(" ")
        item[3] = item[3] + " " + item[4]
        if item[3] not in existed:
            new_data.append(item)
    for data in new_data:
        sql = r"INSERT INTO shibor (term, rate, change, linkurl, issuetime) VALUES ('%s', '%s', '%s', '%s', '%s')" % (data[0], data[1], data[2], link_url, data[3])
        # mysql.query(sql)
        # shibor_data = {"term": data[0], "rate": data[1], "change": data[2], "linkurl": link_url, "issuetime": data[3]}
        api_url = "http://taomandev.piaojiaowang.com/PJWServices/shibor/createShibor"
        current_formated_time = get_formated_time()
        shibor_data = {"sign":"6cd7a0cec3ba9bbab2f95a4570aa54a5",
        "args":
          {"shibor":
              {"linkUrl": link_url,
                "rate": float(data[1]),
                "updateTime": current_formated_time,
                "term": data[0],
                "logTime": current_formated_time,
                "issueTime": data[3]+":00",
                "shifting": float(data[2]),
                "clientIp": "127.0.0.1"
              }

          },
         "head":{"comeFrom":"1"}
                                 }

        headers = {'Content-type': 'application/json', 'Accept': 'application/json'}
        json_str = json.dumps(shibor_data)
        r = requests.post(api_url, data=json_str, headers=headers)
        print(r.text)

    mysql.clean_up()
    time.sleep(time_span)
