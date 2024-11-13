# Sales and Quantity Dashboard

## Overview

This Shiny app allows users to visualize sales and quantity data within a selected date range. The app features:
- A **Date Range Selector** for filtering data by date.
- **Sales Plot**: A line plot showing total sales per date.
- **Quantity Plot**: A bar plot displaying total quantity per date.
- Responsive design with plots arranged side-by-side on a single row.

## Features

- **Date Range Selector**: Users can filter the data displayed in the plots to any date range within the dataset.
- **Sales Plot**: A line plot that shows total sales over the selected date range.
- **Quantity Plot**: A bar plot that displays total quantity per date over the selected date range.

## Project Structure

```plaintext
New App/
├── app.R         # Single file app (or alternatively ui.R and server.R if separate)
├── global.R      # (Optional) If loading data globally for the app
├── books.csv     # Data file for book sales
├── sales.csv     # Data file for sales
├── README.md     # Documentation file
└── other_files   # Any additional files (e.g., images, resources)
