#!/bin/bash

# Check if exactly one argument is provided
if [ $# -ne 1 ]; then
  echo "Error: Please provide exactly one argument."
  exit 1
fi

path="$1"

# Check if the path exists
if [ ! -e "$path" ]; then
  echo "Error: The specified path does not exist."
  exit 1
fi

# If argument is a file
if [ -f "$path" ]; then
  echo "The given path is a file."
  echo "Lines, Words, Characters:"
  wc "$path"

# If argument is a directory
elif [ -d "$path" ]; then
  echo "The given path is a directory."
  echo "Total number of files:"
  find "$path" -type f | wc -l

  echo "Number of .txt files:"
  find "$path" -type f -name "*.txt" | wc -l
fi
