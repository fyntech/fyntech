import requests
import locale
import urllib.parse

from bs4 import BeautifulSoup
from datetime import datetime

# Use danish month names
locale.setlocale(locale.LC_ALL, 'da_DK.UTF-8')

def getEvent(name, organizer, category):

    page_link = 'https://www.meetup.com/{}/events/'.format(name)
    page_response = requests.get(page_link, timeout=20)
    page_content = BeautifulSoup(page_response.content, 'html.parser')

    for event in page_content.find_all(class_='eventCard'):

        if event is not None:

            # Title
            eventTitle = event.find(class_='eventCardHead--title').text

            # Date
            # Convert timestamp from miliseconds to seconds
            timestamp = int(event.find('time')['datetime']) / 1000
            date_time = datetime.fromtimestamp(timestamp)
            eventStart = ' '.join([date_time.strftime('%Y-%m-%d %H:%M:%S'), 'Europe/Copenhagen'])

            # Location
            eventLocation = event.find('address').text

            eventLink = event.find('a', href=True)
            eventLink = ''.join(['https://www.meetup.com', eventLink['href']])
        
            filenameDate = date_time.strftime('%Y-%m-%d')
            filenameTitle = eventTitle.replace(' ', '-')
            filenameTitle = filenameTitle.replace('.','')
            filename = ''.join([filenameDate, '-', urllib.parse.quote(filenameTitle, safe='').lower(), '.md'])
            filepath = '_events/' + filename

            with open(filepath, 'w') as f:
                f.write('---\n')
                f.write('title: "' + eventTitle + '"\n')
                f.write('dateStart: "' + eventStart + '"\n')
                f.write('location: "' + eventLocation + '"\n')
                f.write('link: "' + eventLink + '"\n')
                f.write('organizer: "UCL tech events"\n')
                f.write('category: "ucltechevents"\n')
                f.write('---\n')
