import meetup

events = [
    'Azure-Usergroup-Denmark-Odense',
    'cloud-club-dk',
    'CODE-Odense',
    'EAL-tech-events',
    'FLUG-Fyns-Linux-User-Group',
    'Odense-DevOps',
    'Odense-WordPress-Meetup',
    'Tech-Talk-Board-Games',
    'umbracodkmeetup',

]

for event in events:
    meetup.getEvent(event)
