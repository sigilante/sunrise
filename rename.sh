#!/usr/bin/python3

import os
import sys
import fileinput
import glob

def rename_and_replace(path, old_name, new_name):
    for entry in glob.iglob(os.path.join(path, '**', '*'), recursive=True):
        if os.path.isdir(entry) and old_name in os.path.basename(entry):
            # Rename folder
            new_dir_name = os.path.basename(entry).replace(old_name, new_name)
            os.rename(entry, os.path.join(os.path.dirname(entry), new_dir_name))

        elif os.path.isfile(entry) and old_name in os.path.basename(entry):
            # Rename file and replace content
            with fileinput.FileInput(entry, inplace=True) as file:
                for line in file:
                    print(line.replace(old_name, new_name), end='')

            # Rename file
            new_file_name = os.path.basename(entry).replace(old_name, new_name)
            os.rename(entry, os.path.join(os.path.dirname(entry), new_file_name))
        elif os.path.isfile(entry) and os.path.basename(entry) in ['desk.docket-0', 'README.md']:
            # Rename file and replace content
            with fileinput.FileInput(entry, inplace=True) as file:
                for line in file:
                    print(line.replace(old_name, new_name), end='')

if __name__ == "__main__":
    # Check if the correct number of arguments are provided
    if len(sys.argv) != 2:
        print("Usage: python script.py <new_name>")
        sys.exit(1)

    new_name = sys.argv[1]

    # Set the starting path to the current directory
    starting_path = os.getcwd()

    for old_name in ["sunrise", "Sunrise"]:
        rename_and_replace(starting_path, old_name, new_name)

    print(f"Replacement complete. All instances of 'sunrise' have been replaced with '{new_name}' in files and folders.")

