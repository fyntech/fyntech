import meetup

events = [
    ['Azure-Usergroup-Denmark-Odense', '', 'azureusergroupdenmarkodense'],
    ['cloud-club-dk', 'Cloud Club', 'cloudclub'],
    ['CODE-Odense', 'CODE Odense', 'codeodense'],
    ['EAL-tech-events', 'EAL-tech-events', 'ucltechevents'],
    ['FLUG-Fyns-Linux-User-Group', 'FLUG - Fyns Linux User Group', 'flug-fynslinuxusergroup'],
    ['Odense-DevOps', 'Odense DevOps', 'devops-odense'],
    ['Odense-WordPress-Meetup', 'WordPress Odense', 'wordpress-odense'],
    ['Tech-Talk-Board-Games', 'Technology Denmark in Odense', 'technology-denmark'],
    ['umbracodkmeetup', 'Umbraco DK Meetup', 'umbraco'],
]

for event in events:
    meetup.getEvent(event[0], event[1], event[2])
