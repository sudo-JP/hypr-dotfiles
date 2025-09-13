import json 

with open('/home/jason/.config/hypr/scripts/weather.json') as wttr_fp: 
    a = json.load(wttr_fp)

print(a['text'])

