# README

This repo contains the file necessary to search through the parsed QueToo file. 

*In order to run the program, users should navigate to /app/models/json_handler_model.rb

*User will be prompted for the selector they would like to use to search the parsed JSON. User can search by class, className, or identifier. User must ensure that search criteria match correct syntax of the original JSON (i.e. upcase, downcase, camelcase, etc).

*Program will return search results in an ordered list.

*User will be prompted to either search again, or exit the program.

While I do believe that recursive functions would've been a more effective method for meeting the criteria set by the challenge, I do not have sufficient knowledge of such functions to write them. I do believe the system I've set up (which includes use of the Hashie gem and its "deepfind" functionality) achieves the same outcome as one could expect from use of recursive functions.

I do plan to continue researching recursive functions, and may update this repo to reflect that research.

Thank you for taking the time to view this!
