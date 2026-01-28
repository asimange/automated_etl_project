# set the base image with specific tag/version
FROM python:3.12.4

# install system dependencies (cron, editors, AND chrome)
RUN apt-get update && apt-get install -y \
    cron \
    vim \
    nano \
    wget \
    unzip \
    gnupg \
    ca-certificates \
    fonts-liberation \
    libnss3 \
    libxss1 \
    libasound2 \
    libatk-bridge2.0-0 \
    libgtk-3-0 \
    libgbm1 \
    libxshmfence1 \
    libx11-xcb1 \
    chromium \
    chromium-driver \
    && rm -rf /var/lib/apt/lists/*

# set up working directory inside the container
WORKDIR /app

# copy and install Python dependencies
COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt
RUN pip3 install --upgrade webdriver-manager

# copy all files into the container
COPY . .

# create csv folder if it doesn't exist
RUN mkdir -p csv

# create cron log file and set permissions
RUN touch /var/log/cron.log && chmod 666 /var/log/cron.log

# register cron job: extract → transform (in order)
# --- Set weekly cron job (every Monday at 3am) ---
RUN echo "* * * * * root /usr/local/bin/python /app/extract.py && /usr/local/bin/python /app/transform.py >> /var/log/cron.log 2>&1" > /etc/cron.d/etl-cron
RUN chmod 0644 /etc/cron.d/etl-cron
RUN crontab /etc/cron.d/etl-cron

# start cron in foreground
CMD ["cron", "-f"]
