#!/usr/bin/env python

import json
import requests
from datetime import datetime
from environs import env

data = {}

# Get json 
f = open('/home/jason/.config/waybar/scripts/emotes.json', 'r')
emote_map = json.load(f)
f.close()



env.read_env()
WEATHER_KEY = env("WEATHER_KEY")

# Country and City 
location = requests.get("http://ipwho.is/").json()
city_req = requests.get(f'https://ipinfo.io/{location['ip']}/json').json()

city = city_req['city']
country = location['country_code']

# Lat and long 
lonlat_req = requests.get(f'http://api.openweathermap.org/geo/1.0/direct?q={city},{country}&limit=1&appid={WEATHER_KEY}').json()[0]

lat = lonlat_req['lat']
lon = lonlat_req['lon']

# Weather 
weather_req = requests.get(f'https://api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid={WEATHER_KEY}&units=metric').json()


curr_temp = weather_req['main']['temp']
wt_status = weather_req['weather'][0]['main']
d_or_n = weather_req['weather'][0]['icon'][-1]
emote = emote_map[wt_status][d_or_n]

data['text'] = f' {round(curr_temp)}° {emote}'

# Tooltip
# Current weather 
data['tooltip'] = f' {weather_req['weather'][0]['description'].capitalize()} {round(curr_temp)}° {emote} \n'
data['tooltip'] += f' Feels like: {round(weather_req['main']['feels_like'])}° \n'
data['tooltip'] += f' H: {round(weather_req['main']['temp_max'])}° L: {round(weather_req['main']['temp_min'])}° \n'

# Next 5 days predictions 
pred_req = requests.get(f"http://api.openweathermap.org/data/2.5/forecast?lat={lat}&lon={lon}&appid={WEATHER_KEY}&units=metric").json()


day = '0'
for l in pred_req['list']:
    dt = l['dt_txt']
    arr = dt.split(' ')
    if arr[1] != '12:00:00':
        continue

    days = arr[0].split('-')
    if days[2] != day:
        day = days[2]

        # Date 
        days.reverse()
        date = "-".join(days)
        data['tooltip'] += f' \n<b>{date}</b> \n'


        # 5 days predictions content 
        temp = l['main']['temp']
        pred_status = l['weather'][0]['main']
        pred_d_or_n = l['weather'][0]['icon'][-1]
        pred_emote = emote_map[pred_status][pred_d_or_n]
        high = l['main']['temp_max']
        low = l['main']['temp_min']

        data['tooltip'] += f" {pred_status} {round(temp)}° {pred_emote} H: {round(high)}° L: {round(low)}° \n"

with open('/home/jason/.config/hypr/scripts/weather.json', 'w') as wttr_fp: 
    json.dump(data, wttr_fp)

print(json.dumps(data))
