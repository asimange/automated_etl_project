from bs4 import BeautifulSoup
import requests
import pandas as pd
import numpy as np
import os
from time import sleep
from datetime import datetime
from tqdm import tqdm
from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.common.by import By
from webdriver_manager.chrome import ChromeDriverManager
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC


# --- Selenium setup with custom User-Agent ---
chrome_options = Options()
chrome_options.add_argument("--headless=new")
chrome_options.add_argument("--no-sandbox")
chrome_options.add_argument("--disable-dev-shm-usage")
chrome_options.add_argument("--disable-gpu")
chrome_options.add_argument("--disable-software-rasterizer")
chrome_options.binary_location = "/usr/bin/chromium"

# Set a proper User-Agent
user_agent = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 " \
             "(KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36"
chrome_options.add_argument(f"user-agent={user_agent}")

driver = webdriver.Chrome(
    service=Service(ChromeDriverManager(driver_version="144.0.7559.59").install()),
    options=chrome_options
)


# --- Open IMDb Top 250 page ---
url = "https://www.imdb.com/chart/top/"
driver.get(url)
WebDriverWait(driver, 10).until(EC.presence_of_all_elements_located((By.CSS_SELECTOR, "li.ipc-metadata-list-summary-item")))

# --- Parse page with BeautifulSoup ---
soup = BeautifulSoup(driver.page_source, 'html.parser')
print(type(soup))


# --- Find all movies ---
movies = soup.find_all('li', {'class': 'ipc-metadata-list-summary-item'})
len(movies)

# View a sample movie
movies[1]


# --- Function to extract movie data ---
def get_movie_data(movie):
    movie_data_dict = {}
    # Ranking of the top 250 movies: ('div', {class: 'ipc-signpost__text'})
    movie_data_dict['Ranking'] = movie.find('div', {'class': 'ipc-signpost__text'}).text.strip().replace('#', '')
    # Movie's Title: ('h3', {class: 'ipc-title__text'})
    movie_data_dict['Movie_Title'] = movie.find('h3', {'class': 'ipc-title__text'}).text.strip()
    
    # Use it to check if the movie is Rated. If not returns 'None'
    metadata = movie.find_all('span', {'class': 'sc-b4f120f6-7 hoOxkw cli-title-metadata-item'})

    # Realese Year: ('span', {class: 'sc-b4f120f6-7 hoOxkw cli-title-metadata-item'})
    movie_data_dict['Realese_Year'] = metadata[0].text.strip()
    # Duration: ('span', {class: 'sc-b4f120f6-7 hoOxkw cli-title-metadata-item'})
    movie_data_dict['Duration'] = metadata[1].text.strip()
    # MPA Rating: ('span', {class: 'sc-afe43def-1 fdtZlK cli-metadata-list-item-value'})
    if len(metadata) > 2:
        movie_data_dict['MPA_Rating'] = metadata[2].text.strip()
    else:
        movie_data_dict['MPA_Rating'] = None
    # IMDb User Rating up to 10: ('span', {class: ipc-rating-star--rating'})
    movie_data_dict['IMDb_UserRating_(/10)'] = movie.find('span', {'class': 'ipc-rating-star--rating'}).text.strip()
    # IMDb Number of User Votes: ('span', {class: 'ipc-rating-star--voteCount'})
    movie_data_dict['IMDb_NumVotes'] = movie.find('span', {'class': 'ipc-rating-star--voteCount'}).text.strip().replace('(', '').replace(')','')

    # Movie Details URL
    details_url = "https://www.imdb.com" + movie.find('a', {'class': 'ipc-lockup-overlay ipc-focusable ipc-focusable--constrained'})['href']
    response = requests.get(details_url, headers={'User-Agent': user_agent})
    details_soup = BeautifulSoup(response.content, 'html.parser')
    
    # Director/s
    movie_director = details_soup.find('ul', {'class': 'ipc-inline-list ipc-inline-list--show-dividers ipc-inline-list--inline ipc-metadata-list-item__list-content baseAlt'})
    directors = movie_director.find_all('a',{'class': 'ipc-metadata-list-item__list-content-item ipc-metadata-list-item__list-content-item--link'})
    movie_data_dict['Director'] = ', '.join(director.text.strip() for director in directors)
    # Actor/s
    movie_actors = details_soup.find('li', {'class': 'ipc-metadata-list__item ipc-metadata-list__item--align-end ipc-metadata-list-item--link'})
    actors = movie_actors.find_all('a',{'class': 'ipc-metadata-list-item__list-content-item ipc-metadata-list-item__list-content-item--link'})
    movie_data_dict['Star_Actors'] = ', '.join(actor.text.strip() for actor in actors)
    # Characteristics
    movie_characteristics = details_soup.find('div', {'class': 'ipc-chip-list__scroller'})
    characteristics = movie_characteristics.find_all('a',{'class': 'ipc-chip ipc-chip--on-baseAlt'})
    movie_data_dict['Characteristics'] = ', '.join(characteristic.text.strip() for characteristic in characteristics)
    # Wins
    movie_wins = details_soup.find('ul', {'class': 'ipc-inline-list ipc-inline-list--show-dividers ipc-inline-list--inline ipc-metadata-list-item__list-content base'})
    movie_data_dict['Wins'] = movie_wins.find('span',{'class': 'ipc-metadata-list-item__list-content-item ipc-btn--not-interactable'}).text.strip()
    return movie_data_dict


# Test the function with one movie
get_movie_data(movies[25])


# Extract data for all movies
all_movies_lst = []
for movie in movies[:]:
    all_movies_lst.append(get_movie_data(movie))
all_movies_lst


# Create DataFrame
df_movies = pd.DataFrame(all_movies_lst)
df_movies


# Export dataframe df_movies to CSV
#df_movies.to_csv(r"C:\Users\asimi\Documents\Data_Engineering_Bootcamp\imdb-top250-etl\imdb_top250_movies.csv", index=False)

if not os.path.isfile('/app/csv/imdb_top250_movies.csv'):
   df_movies.to_csv('/app/csv/imdb_top250_movies.csv', index= False)
else: 
   df_movies.to_csv('/app/csv/imdb_top250_movies.csv', mode='a', index=False, header=False)
