# -*- coding: utf-8 -*-
"""
Created on Fri Aug 28 09:56:44 2015

@author: Administrator
"""

import requests
import re 


def shibor_crawl_and_parse():
    url = r"http://www.shibor.org/shibor/web/html/shibor.html"
    r = requests.get(url)
    html = r.text
    term = re.findall(r'<font color=blue>(.+?)</font></a></td>',html)
    shibor = re.findall(r'<td width="30%" align="center">(.+?)</td>',html)
    bp_symbol = re.findall(r'src="/shibor/web/html/images/newimages/(.+?)icon.gif"', html)
    bp = re.findall(r'<td width="30%" align="left">&nbsp;&nbsp;(.+?)</td>',html)
    time = re.findall(r'<td align="right" valign="top" class="infoTitleW">(.+?)&nbsp;&nbsp;</td>',html)
    
    size = len(term)
    master = list()
    for i in range(size):
        if bp_symbol[i]== u'down':
            bp[i] = u'-' + bp[i]
        x = term[i] + " " + shibor[i] + " " + bp[i] + " " + time[0]
        master.append(x)
    return master

if __name__ == "__main__":
    result = shibor_crawl_and_parse()
    print(result)
