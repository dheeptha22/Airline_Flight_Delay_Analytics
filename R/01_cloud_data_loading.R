library(dplyr)
library(googledrive)
library(readr)

# Connect to Google Drive
drive_auth(
  scopes = "https://www.googleapis.com/auth/drive"
)

# Find the cloud project folder
cloud_files <- drive_ls(
  "Airline_Flight_Delay_Cloud_Data"
)

# Download airlines.csv from cloud storage
airlines_file <- cloud_files %>%
  dplyr::filter(name == "airlines.csv")

drive_download(
  airlines_file,
  path = "data/cleaned/airlines_from_cloud.csv",
  overwrite = TRUE
)

# Read cloud data into R
airlines_cloud <- read_csv(
  "data/cleaned/airlines_from_cloud.csv",
  show_col_types = FALSE
)

# Display the cloud data
print(airlines_cloud)



# Download airports.csv from cloud storage
airports_file <- cloud_files %>%
  filter(name == "airports.csv")

drive_download(
  airports_file,
  path = "data/cleaned/airports_from_cloud.csv",
  overwrite = TRUE
)

# Read cloud airports data into R
airports_cloud <- read_csv(
  "data/cleaned/airports_from_cloud.csv",
  show_col_types = FALSE
)

# Display the cloud airports data
print(airports_cloud)



