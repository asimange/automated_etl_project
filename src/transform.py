import pandas as pd
import regex as re


# Load the dataset
print("First five rows of the dataset:")
df_movies = pd.read_csv('imdb_top250_movies.csv')
df_movies.head()


# Display dataset information
print("\nDataset Information:")
df_movies.info()


# Check for missing values
print("\nMissing Values per Column:")
df_movies.isnull().sum()


# Identify rows with missing 'MPA_Rating'
print("\nMovies with Missing MPA_Rating:")
MPA_Rating_isNULL = df_movies[df_movies['MPA_Rating'].isnull()]
MPA_Rating_isNULL


# Extract the first element of 'Characteristics' column
df_movies['language'] = df_movies['Characteristics'].str.split(',').str[0]
df_movies['language'].unique()


# Create a new 'language' column based on the first element in the 'Characteristics' column
df_movies['language'] = None
languages = ['English', 'Spanish', 'Japanese', 'Portuguese', 'Italian', 'Korean', 'French', 
             'German', 'Hindi', 'Arabic', 'Russian', 'Mandarin', 'Danish', 'Persian', 'Turkish', 
             'Farce', 'Swedish', 'Tamil', 'Cantonese', 'Hebrew', 'Norwegian', 'Dutch', 'Finnish', 
             'Greek', 'Vietnamese', 'Indonesian', 'Urdu', 'Malay', 'Czech', 'Polish', 'Hungarian', 
             'Romanian', 'Slovak', 'Catalan', 'Croatian', 'Bulgarian', 'Lithuanian', 'Slovenian', 
             'Icelandic', 'Luxembourgish', 'Afrikaans', 'Swahili', 'Yiddish', 'Welsh', 'Galician']


for language in languages:
    # Create a boolean mask where the first characteristic matches the language
    language_true = df_movies['Characteristics'].str.split(',').str[0] == language
    # Assign the language to the new column
    df_movies.loc[language_true, 'language'] = language
    # Remove the language from the 'Characteristics' column
    df_movies.loc[language_true, 'Characteristics'] = df_movies.loc[language_true, 'Characteristics'].str.split(',').apply(lambda x: ', '.join([item.strip() for item in x[1:]]))


# Display the first few rows to verify the new column
japanese = df_movies[df_movies['language'] == "Korean"]
japanese.head()


# Duration conversion
def duration_to_minutes(duration):
    hours = int(re.search(r'(\d+)h', duration).group(1)) if 'h' in duration else 0
    minutes = int(re.search(r'(\d+)m', duration).group(1)) if 'm' in duration else 0
    return hours * 60 + minutes

# Apply the function to create a new column
df_movies["duration_minutes"] = df_movies["Duration"].apply(duration_to_minutes)

# Display the first few rows to verify the new column
df_movies.head()


# Convert IMDb rating to float
df_movies["imdb_rating"] = df_movies["IMDb_UserRating_(/10)"].astype(float)


# Convert IMDb votes from '3.1M', '969K' to numbers
def parse_votes(vote_str):
    if "M" in vote_str:
        return float(vote_str.replace("M","")) * 1_000_000
    elif "K" in vote_str:
        return float(vote_str.replace("K","")) * 1_000
    else:
        return float(vote_str)

df_movies["imdb_num_of_votes"] = df_movies["IMDb_NumVotes"].apply(parse_votes).astype(int)


# Extract wins (first number in '21 wins & 42 nominations total')
df_movies["wins_count"] = df_movies["Wins"].apply(lambda x: int(re.search(r'\d+', x).group()))


# Extract nominations (second number in '21 wins & 42 nominations total')
def extract_nominations(text):
    numbers = re.findall(r'\d+', text)
    return int(numbers[1]) if len(numbers) > 1 else 0

# Apply the function to create a new column
df_movies["nominations"] = df_movies["Wins"].apply(extract_nominations)

# Display the first two rows to verify transformations
df_movies.head(2)


# Drop the original columns that have been transformed
df_movies.drop(columns=['Duration'], inplace=True)
df_movies.drop(columns=['IMDb_NumVotes'], inplace=True)
df_movies.drop(columns=['Wins'], inplace=True)
df_movies.drop(columns=['IMDb_UserRating_(/10)'], inplace=True)


# Check for any remaining missing values
df_movies.isnull().sum()


# Display a random sample of 10 rows to verify transformations
df_movies.sample(10)

# Save the transformed DataFrame to a new CSV file
df_movies.to_csv(r"C:\Users\asimi\Documents\Data_Engineering_Bootcamp\imdb-top250-etl\transformed_imdb_top250_movies.csv", index=False)