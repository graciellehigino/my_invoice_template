
# Load packages ------------------------------------------------------------

library(tidyverse)
library(googlesheets4)

# Load data from Google Sheets ---------------------------------------------

# Run line below if it's your first time using googlesheets4
# gs4_deauth()

# Read in service tracker data
raw_service_data <- read_sheet("1zIfZsJvpVibwKttXnWS2ubo2Vx6kWFiRnrECmws1wMY",  # document ID
                           sheet = "service_tracker")                       # sheet name

# Read in customer data
customer_data <- read_sheet("1zIfZsJvpVibwKttXnWS2ubo2Vx6kWFiRnrECmws1wMY", # document ID
                            sheet = "clients")                              # sheet name

# Create copy of service data to play with

service_data <- raw_service_data

# Data wrangling -----------------------------------------------------------

source("summarize_services.R")
service_data <- summarize_invoice(service_data, 1)

customer_data <- customer_data |> 
  filter(invoice_id == 1)
