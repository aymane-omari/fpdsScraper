# 🚀 FPDS Data Scraper 🕵️‍♂️

Welcome to the FPDS Data Scraper, your go-to tool for effortlessly extracting contract information from the Federal Procurement Data System (FPDS) website! 🌐

## Overview

This R package provides a set of functions designed to streamline the process of retrieving, organizing, and cleaning FPDS data from a given URL. Whether you're an analyst, researcher, or data enthusiast, this package is tailored to simplify your data extraction needs.

## Functions

### `scrape_fpds_data(url)`

This function is the heart of the operation! It meticulously scrapes data from the specified FPDS URL and returns a tidy data frame with essential contract details. 📊

#### Parameters
- `url`: The URL from which to scrape data.

#### Returns
- A data frame containing Contracting Agency, Action Obligation, Legal Business Name, PSC Code, NAICS Code, Entity State, Unique Entity ID, and Award ID.

### `url_exists(url)`

Before diving into scraping, it's crucial to ensure the URL is valid. This function checks if the provided URL exists, safeguarding your data extraction journey. 🛡️

#### Parameters
- `url`: The URL to check.

#### Returns
- TRUE if the URL exists, FALSE otherwise.

### `clean_text(text)`

Cleanliness is next to godliness! This function tidies up text, eliminating unnecessary characters and whitespaces, ensuring your data is pristine and ready for analysis. 🧹

#### Parameters
- `text`: The text to be cleaned.

#### Returns
- Cleaned text.

### `get_total_pages(url)`

Curious about the total number of pages? This function calculates it for you, offering insights into the scope of your data extraction mission. 📚

#### Parameters
- `url`: The URL for the page.

#### Returns
- The total number of pages.

### `scrape_data_from_all_pages(url)`

Ready to conquer all pages? This function seamlessly scrapes data from every page of the FPDS website, providing a comprehensive data frame that covers the entire spectrum of contracts. 🚚

#### Parameters
- `url`: The URL for the page.

#### Returns
- A data frame containing the scraped data from all pages.

### Scraping Data from a Single Page

The `scrape_fpds_data` function is your gateway to extracting data from a single FPDS page. Provide the URL of the FPDS page you want to scrape, and let's dive in:

```r
library(fpds_data_scraper)

# Replace 'your_url_here' with the actual FPDS URL
fpds_data <- scrape_fpds_data("your_url_here")

# View the first few rows of the scraped data
head(fpds_data)
```

### Checking if a URL Exists

Before scraping, it's crucial to ensure your URL is valid. The `url_exists` function helps you with that:

```r
# Replace 'your_url_here' with the URL to check
url_status <- url_exists("your_url_here")

# Check the status
if (url_status) {
  print("The URL exists. Ready to scrape!")
} else {
  stop("The provided URL does not exist.")
}
```

### Scraping Data from All Pages

For more extensive data extraction, use the `scrape_data_from_all_pages` function. It automatically retrieves data from all pages of the FPDS website:

```r
# Replace 'your_url_here' with the URL to scrape all pages
all_fpds_data <- scrape_data_from_all_pages("your_url_here")

# View the first few rows of the complete dataset
head(all_fpds_data)
```


## Getting Started

To embark on your data exploration journey, simply load the required libraries (`rvest` and `dplyr`) and start using these functions. Feel free to customize the functions to suit your specific needs.

Happy scraping! 🌐💻