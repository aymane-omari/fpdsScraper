#' Scrape FPDS Data from URL
#'
#' This function scrapes data from the provided FPDS URL.
#'
#' @param url The URL from which to scrape data.
#' @return A data frame containing the scraped data.
#' @export
scrape_fpds_data <- function(url) {
  webpage <- read_html(url)

  # Initialize data frame to store results
  results <- data.frame(Contracting_Agency = character(0), Action_Obligation = character(0),
                        Legal_Business_Name = character(0), PSC_Code = character(0),
                        NAICS_Code = character(0), Entity_State = character(0),
                        Unique_Entity_ID = character(0), Award_ID = character(0),
                        stringsAsFactors = FALSE)

  # Extract the number of tables
  num_tables <- length(webpage %>% html_nodes(xpath = "//table[4]//td[2]//table//tr[2]//td//table//tr//td//table"))

  # Loop through tables
  for (i in 1:num_tables) {
    # Extract data from each table
    contracting_agency <- webpage %>%
      html_nodes(xpath = paste0("//table[4]//td[2]//table//tr[2]//td//table//tr//td//table[", i, "]//tr[2]//td[4]//span/a")) %>%
      html_text() %>%
      as.character()

    action_obligation <- webpage %>%
      html_nodes(xpath = paste0("//table[4]//td[2]//table//tr[2]//td//table//tr//td//table[", i, "]//tr[3]//td[4]")) %>%
      html_text() %>%
      as.character() %>%
      clean_text()

    legal_business_name <- webpage %>%
      html_nodes(xpath = paste0("//table[4]//td[2]//table//tr[2]//td//table//tr//td//table[", i, "]//tr[8]//td[4]//span/a")) %>%
      html_text() %>%
      as.character()

    psc_code <- webpage %>%
      html_nodes(xpath = paste0("//table[4]//td[2]//table//tr[2]//td//table//tr//td//table[", i, "]//tr[5]//td[4]//span/a")) %>%
      html_text() %>%
      as.character()

    naics_code <- webpage %>%
      html_nodes(xpath = paste0("//table[4]//td[2]//table//tr[2]//td//table//tr//td//table[", i, "]//tr[5]//td[2]//span/a")) %>%
      html_text() %>%
      as.character()

    entity_state <- webpage %>%
      html_nodes(xpath = paste0("//table[4]//td[2]//table//tr[2]//td//table//tr//td//table[", i, "]//tr[7]//td[2]")) %>%
      html_text() %>%
      as.character() %>%
      clean_text()

    unique_entity_id <- webpage %>%
      html_nodes(xpath = paste0("//table[4]//td[2]//table//tr[2]//td//table//tr//td//table[", i, "]//tr[6]//td[4]//span/a")) %>%
      html_text() %>%
      as.character()

    award_id <- webpage %>%
      html_nodes(xpath = paste0("//table[4]//td[2]//table//tr[2]//td//table//tr//td//table[", i, "]//tr[1]//td[2]//span/a[1]")) %>%
      html_text() %>%
      as.character()

    # Create a data frame for the current table
    row_data <- data.frame(Contracting_Agency = contracting_agency, Action_Obligation = action_obligation,
                           Legal_Business_Name = legal_business_name, PSC_Code = psc_code,
                           NAICS_Code = naics_code, Entity_State = entity_state,
                           Unique_Entity_ID = unique_entity_id, Award_ID = award_id,
                           stringsAsFactors = FALSE)

    # Append the row data to the results data frame
    results <- bind_rows(results, row_data)
  }

  return(results)
}

#' Clean Text
#'
#' This function cleans the text.
#'
#' @param text The text to be cleaned.
#' @return Cleaned text.
# Load necessary libraries
library(rvest)
library(dplyr)

clean_text <- function(text) {
  cleaned_text <- gsub("[\t\n$]", "", text)
  return(trimws(cleaned_text))
}

#' Get Total Number of Pages
#'
#' This function calculates the total number of pages.
#'
#' @param url The URL for the page.
#' @return The total number of pages.
get_total_pages <- function(url) {
  webpage <- read_html(url)
  num_elements <- as.numeric(webpage %>% html_nodes(xpath = "//table[4]//td[2]//table//tr[1]//td[2]/span/b[3]") %>% html_text())
  num_pages <- ceiling(num_elements / 30)
  return(num_pages)
}

#' Scrape Data from All Pages
#'
#' This function scrapes data from all pages.
#'
#' @param url The URL for the page.
#' @param search_term The search term.
#' @return A data frame containing the scraped data from all pages.
scrape_data_from_all_pages <- function(url, search_term) {
  num_pages <- get_total_pages(url)
  all_results <- data.frame()
  for (page in 1:num_pages) {
    if (page == 1) {
      current_url <- url
    } else {
      current_url <- paste0(url, "&s=FPDS.GOV&templateName=1.5.3&indexName=awardfull&start=", (page - 1) * 30)
    }
    page_results <- scrape_fpds_data(current_url)
    all_results <- dplyr::bind_rows(all_results, page_results)
  }
  return(all_results)
}
