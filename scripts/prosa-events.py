from bs4 import BeautifulSoup
import requests
page_link ='https://www.prosa.dk/nc/arrangementer/?tx_news_pi1[overwriteDemand][locations][2]=Fyn'
page_response = requests.get(page_link, timeout=20)
page_content = BeautifulSoup(page_response.content, "html.parser")

# extract all html elements where price is stored
events = page_content.find_all(class_='article')

for event in page_content.find_all(class_='article'):
  # title 
  eventTitle = event.find("span", itemprop="headline").text
  if eventTitle.startswith("Odense: "):
    title = eventTitle[8:]
  else:
    title = eventTitle
  print(title)

  # dateStart / Y-m-d H:i:s Europe/Copenhagen
  eventDate = event.find(class_='news-list-date')
  eventDateDay = eventDate.find(class_='day')
  eventDateMonth = eventDate.find(class_='month')
  eventDateYear = eventDate.find(class_='year')
  eventDateTime = eventDate.find(class_='eventTime')
  dateStart = ''.join([eventDateYear.text, '-', eventDateMonth.text, '-', eventDateDay.text, ' ', eventDateTime.text, ' Europe/Copenhagen'])
  # TODO: format month and date
  print(dateStart)

  # location
  # arrangement-address

  # link

  # description
  eventDescription = event.find("div", itemprop="description").text
  description = eventDescription
  print(description)
