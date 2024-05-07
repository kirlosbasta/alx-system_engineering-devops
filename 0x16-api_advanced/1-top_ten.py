#!/usr/bin/python3
'''Module for task 1'''
import requests


def top_ten(subreddit):
    '''Return the top 10 hot post for a given subreddit'''
    url = 'https://www.reddit.com/r/{}/hot.json'.format(subreddit)
    headers = {'User-Agent': 'Myscript/2.0 (by /u/kirlos)'}
    data = {'limit': 9}
    response = requests.get(url, headers=headers, params=data)
    if response.status_code == 200:
        for post in response.json().get('data').get('children'):
            print(post.get('data').get('title'))
    else:
        print(None)
