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

## Getting Started

To embark on your data exploration journey, simply load the required libraries (`rvest` and `dplyr`) and start using these functions. Feel free to customize the functions to suit your specific needs.

Happy scraping! 🌐💻