#!/usr/bin/env python
import requests
import json
d = {}

locations = {}

location = requests.get("http://ipwho.is/").json()
city_code = requests.get(f'https://ipinfo.io/{location['ip']}/json').json()

locations['ip'] = location
locations['place'] = city_code

d['text'] = city_code['city'] + " " + location['flag']['emoji']
d['tooltip'] = f' {location['ip']} {location['timezone']['abbr']} @ {location['timezone']['id']} \n {location['connection']['isp']}'

with open('/home/jason/.config/waybar/scripts/locations.json', 'w') as lc_fp: 
    json.dump(locations, lc_fp)
print(json.dumps(d))
