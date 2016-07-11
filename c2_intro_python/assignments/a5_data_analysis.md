# Data analysis project

## Introduction

According to Wikipedia, "Analysis of data is a process of inspecting, cleaning, transforming, and modeling data with the goal of discovering useful information, suggesting conclusions, and supporting decision-making". The key takeaway from this definition: data analysis is a big task that requires an agile mind and sharp tools. The purpose of this final project is for you to practice, and develop confidence in the tools and programming techniques you've learned thus far, and will continue to learn. Therefore, the final project of Course 2 involves analysis of a fun, large, dynamic dataset: the "New York City Restaurant Inspection Results".

## NYC Restaurant Inspection Dataset

[Click here](https://data.cityofnewyork.us/Health/DOHMH-New-York-City-Restaurant-Inspection-Results/43nn-pn8j) to view the data online.

We will read through BOTH attachments from the ABOUT section in the above link.

1. Description of the dataset (.docx)
1. Data dictionary (.xlsx).

This dataset has been selected for the following reasons:

1. Its contents are relevant to people in New York (eg, all of us)
1. It has an ideal size
  * Small enough to analyze on your laptop
  * Too large to use traditional spreadsheet software
  * Few enough columns to easily learn about each one
  * Enough columns to be able to answer many cool questions
1. It can be accessed in multiple ways
  * Downloaded as one CSV
  * API
1. It is well-documented

## Minimum requirements

* Create a new git repository with the following structure:

```txt
npd_c02_a5/
  instance/
    .gitignore
    DOHMH_New_York_City_Restaurant_Inspection_Results.csv
  src/
    python/
      config.py
      main.py
```

* Download a csv version of the restaurant dataset, placing it in your instance/ directory
* Place a .gitignore file in your instance directory with the following two lines
  * This file ignores all files in the directory from version control, other than the gitignore itself

```txt
*
!.gitignore
```

### In config.py

* Create a variable called *path_inspection_results* containing the full path to DOHMH_New_York_City_Restaurant_Inspection_Results.csv
  * Hint: *os.path.dirname(os.path.abspath(__file__))* gives the full path to the current file

### In main.py

* Import path_inspection_results from config.py
* Import the inspection results csv into pandas
  * HINT - pandas.read_csv
* calculate the following metrics using Pandas and print them to screen
  * The unique count of restaurants
    * HINT - read about *CAMIS* in the data dictionary
  * The unique count of restaurants, grouped by restaurant type
    * eg, unique number of japananese restaurants, mexican, etc

## Challenge requirements

### Additional questions to answer about the data

* The number of restaurants that received an A grade, but nothing lower
* The number of non-A grades in the zip code of someone you know (maybe even you)
* Answer any other questions that strike your fancy. This dataset can be a lot of fun to work with

### Additional challenges (to do from home if you have time)

* Output your results from the questions into a csv (look into pandas.to_csv)
* Download the dataset using the API
  * Look into *requests*, a third-party module
