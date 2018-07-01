## Introduction

This repo contains the course project to Coursera's Getting And Cleaning Data course as part of the Data Science specialization.

## Script Functionality

There is a single script called "run_analysis.R." It follows the following steps:

1. Download UCI HAR zip file to working directory
2. Reads and stores data
3. Merges data
4. Pares data set down into columns with mean and standard deviation
5. Renames data columns
6. Creates factor levelling system
7. Summarizes averages for all subjects and activities

## Run from command line

1. Clone this repo

2. Run the script:

`$ Rscript run_analysis.R`

## Output

This script will create a tidy dataset named "tidy.txt" in the working directory.# GettingAndCleaningDataCourseProject
