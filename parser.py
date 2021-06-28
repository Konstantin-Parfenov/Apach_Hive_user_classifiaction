#!/opt/anaconda/envs/bd9/bin/python

from urllib.parse import urlparse, unquote
import re

import sys



def url2domain(url):
   try:
       a = urlparse(unquote(url.strip()))
       if (a.scheme in ['http','https']):
           b = re.search("(?:www\.)?(.*)",a.netloc).group(1)
           if b is not None:
               return str(b).strip()
           else:
               return ''
       else:
           return ''
   except:
       return


for line in sys.stdin:
    row = line.strip().split('\t')
    if len(row) == 3 and row[0] != '-' and row[2].startswith('http'):
        try:
            uid = int(row[0])
            timestamp = int(float(row[1]) * 1000)
            url = url2domain(row[2])
            print("{}\t{}\t{}".format(uid, url, timestamp))
        except Exception:
            pass