# FPDS Data Scraper
## Overview

This R package provides a set of functions designed to streamline the process of retrieving, organizing, and cleaning FPDS data from a given URL. Whether you're an analyst, researcher, or data enthusiast, this package is tailored to simplify your data extraction needs.

## Getting Started

You will have to get your FPDS scraper URL first, depending on your searches. You can follow the steps given in the PDF document 'How to get your FDPS URL'.

## Functions

Below is an overview of the functions you can use after downloading this package.

### `scrape_data_fpds(url)`

This function scrapes data from every page of the specified FPDS URL.

#### Parameters
- `url`: The URL from which to scrape data.

#### Returns
- A data frame containing the scraped data from all pages, including Contracting Agency, Action Obligation, Legal Business Name, PSC Code, NAICS Code, Entity State, Unique Entity ID, and Award ID.

### Example

```r
library(fpdsScraper)

# Replace 'your_url_here' with the actual FPDS URL
all_fpds_data <- scrape_data_fpds("your_url_here")

# View the first few rows of the complete dataset
head(all_fpds_data)
```

### `scrape_fpds_data(url)`

This function scrapes data from a single page of the specified FPDS URL.

#### Parameters
- `url`: The URL from which to scrape data.

#### Returns
- A data frame containing Contracting Agency, Action Obligation, Legal Business Name, PSC Code, NAICS Code, Entity State, Unique Entity ID, and Award ID.

### Example

```r
library(fpdsScraper)

# Replace 'your_url_here' with the actual FPDS URL
fpds_data <- scrape_fpds_data("your_url_here")

# View the first few rows of the scraped data
head(fpds_data)
```

### `get_total_pages(url)`

This function calculates the total number of pages in the URL.

### Example

```r
library(fpdsScraper)

# Replace 'your_url_here' with the actual FPDS URL
total_pages <- get_total_pages("your_url_here")

# Print the total number of pages
print(total_pages)
```

### `url_exists(url)`

Check if the given URL exists before attempting to scrape data.

#### Parameters
- `url`: The URL to check.

#### Returns
- `TRUE` if the URL exists, `FALSE` otherwise.

### Example

```r
library(fpdsScraper)

# Replace 'your_url_here' with the actual FPDS URL
url_valid <- url_exists("your_url_here")

# Print if the URL is valid
print(url_valid)
```

### `verify_fpds_url(url)`

Verify if the given URL is a standard FPDS URL.

#### Parameters
- `url`: The URL to verify.

#### Returns
- `TRUE` if the URL is standard according to FPDS, `FALSE` otherwise.

### Example

```r
library(fpdsScraper)

# Replace 'your_url_here' with the actual FPDS URL
is_valid_fpds_url <- verify_fpds_url("your_url_here")

# Print if the URL is a valid FPDS URL
print(is_valid_fpds_url)
```

### `clean_text(text)`

Clean the text by removing unwanted characters and trimming whitespace.

#### Parameters
- `text`: The text to be cleaned.

#### Returns
- Cleaned text.

### Example

```r
library(fpdsScraper)

# Replace 'your_text_here' with the text you want to clean
cleaned_text <- clean_text("your_text_here")

# Print the cleaned text
print(cleaned_text)
```
