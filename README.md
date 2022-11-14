# XML_Search_of_Clinical_Trials_on_clinicaltrials.gov

As part of a study (in progress) we wanted to investigate whether errors in preclinical cancer literature had been found to affect any terminated clinical trials in the cancer field. 

To do this we:
- Went on clinicaltrails.gov
- Searched for the term "cancer"
- Filtered to only include terminated trials
- Downloaded all records of terminated clinical trials with the keyword "cancer" 
- Using the above code, searched the files to identify the reasons (if provided) the trial was terminated
- Outputted the results to a csv file.
- This csv file was manually searched to identify any termination reasons that could suggest it was due to basing the trial on irreproducible data
- All trials that were flagged for this reason then had any associated publications screened, and references of those publications screened to see if there were any signs of "Paper-mills"

- In the end, we did not find any instances of trials suggested to have been terminated due to the presence of "Paper-mills". Although we note there was a large proportion of trials that were terminated without any provided reason. 
