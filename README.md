# Animal-Analysis-R

This repository contains the code and results for analyzing the **Animal Dataset.csv** file using R (RStudio).

## Overview

This project walks through a complete data‑science pipeline in **R**. Starting with the raw **Animal Dataset.csv**, we apply rigorous data‑cleaning and feature‑engineering steps—handling missing values, parsing inconsistent units, and creating tidy features—to generate **Animal Dataset Cleaned.csv**.

On the clean data we:

1. **Detect & visualise outliers** using robust statistical techniques.
2. **Explore feature distributions** and summarise key relationships.
3. **Document actionable insights** drawn from the exploratory analysis.
4. **Train & evaluate** a baseline **Decision Tree** model, illustrating how the prepared data can power a simple machine‑learning workflow.

Data‑cleaning is implemented in `animal_dataset_cleaning.R`, while the exploratory analysis and modeling workflow live in `animal_analysis.R`. Every plot is saved under the `Visualization/` directory and embedded in the accompanying slide deck.

## Dataset

| Aspect             | Raw (`Animal Dataset.csv`)                                        | Clean (`Animal Dataset Cleaned.csv`)              |
| ------------------ | ----------------------------------------------------------------- | ------------------------------------------------- |
| **Numeric fields** | Stored as characters, ranges or phrases (`"Up to …"`, `12–15 cm`) | Fully numeric—ranges averaged, text stripped      |
| **Missing values** | Placeholders like `Unknown`, `?`, empty strings                   | Converted to `NA` for consistency                 |
| **Units**          | Feet, inches, mph appear sporadically                             | Normalised values to centimetres, kilograms, km/h |
| **Intended use**   | Reference only                                                    | Main table for EDA & ML                           |

## Requirements

- **R** ≥ 4.1 (tested on 4.3)  •  RStudio recommended for IDE features.

- **R packages**:

  ```r
  install.packages(c(
    "tidyverse",    # dplyr, ggplot2, readr …
    "janitor",      # clean_names(), tabyl()
    "lubridate",    # date‑time parsing
    "stringr",      # regex helpers
    "rpart",        # decision trees
    "rpart.plot"    # tree visualisation
  ))
  ```

- Optional extras used in the presentation but not required for the core script: `skimr`, `here`, `knitr`.

---

## Results & Findings

| Theme             | Highlight                                                                                                          |
| ----------------- | ------------------------------------------------------------------------------------------------------------------ |
| **Data Quality**  | 100% of numeric anomalies resolved.                                                                                |
| **Outliers**      | Blue Whale (weight, length) and Peregrine Falcon (top speed) confirmed as biological extremes.                     |
| **Correlations**  | Weight–Height (ρ ≈ 0.78) and Weight–Gestation (ρ ≈ 0.56) are the strongest positive relationships.                 |
| **Decision Tree** | Explains \~42% of variance in `Top_Speed_kmh`; key split at `weight_kg ≈ 35` separates most fast vs. slow species. |
|                   |                                                                                                                    |

> ### Full visuals are available in the `` folder and in *Animal\_Dataset\_Final\_Presentation.pdf.*

