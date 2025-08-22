#!/usr/bin/env python
import requests
import json
d = {}
location = requests.get("http://ipwho.is/").json()
city_code = requests.get(f'https://ipinfo.io/{location['ip']}/json').json()

d['text'] = city_code['city'] + " " + location['flag']['emoji']
d['tooltip'] = f'{location['ip']} {location['timezone']['abbr']} @ {location['timezone']['id']} \n {location['connection']['isp']}'
print(json.dumps(d))
