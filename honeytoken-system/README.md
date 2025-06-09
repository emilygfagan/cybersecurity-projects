# Honeytoken System - Project Overview

This project is built as an extension of the Fagan Systems Active Directory lab: a fictional company environment designed to simulate enterprise IT infrastructure. The honeytoken system enhances that environment by introducing deception-based security controls, such as fake files and monitoring traps to detect unauthorized activity within the domain. In this project, honeyfiles are generated, placed in sensitive-looking folders (like `HRConfidential`), monitored for access, and logged for analysis.     

📂 [View the Active Directory project documentation](https://github.com/emilygfagan/active-directory/blob/main/README.md)      



## Project Goals

This honeytoken system is designed for use in a Windows Server Active Directory domain (fagan.local). It focuses on automating the deployment and monitoring of honeyfiles, with a clear progression from setup to data analysis.     


### [Part 1: Honeyfile Generation (PowerShell)](./honeyfile-generator/README.md)
- Run within the `Fagan Systems` domain controller or member server
- Let the user input folder path to save the documents in
- Prompt for:
  - Number of honeyfiles to generate
  - File type: `.txt` or `.csv`
- Use randomized content (names, roles, salaries)
- Randomized file system timestamps (`Created`, `Modified`, and `Accessed` dates) added for every file

 
### [Part 2: File Access Logging](./file-access-logging/README.md)     
- Configure Windows Security Auditing to track reads and opens on the honeyfiles
- Log access events using:
  - Windows Event Viewer (Event ID 4663)
  - Sysmon or Task Scheduler for automation
- Store logs for analysis


### Part 3: Log Parsing & Analysis (Python)
- Extract logs from `.csv` export
- Filer events related to honeyfiles
- Structure data for visualization


### Part 4: Visualization & Insights
- Use Python with Matplotlib to:
  - Chart access frequency over time
  - Identify which files were accessed most
  - Detect abnormal activity
- Build alerts and daily summaries
 


## Technologies Used
- PowerShell (automation & generation)
- Active Directory (fagan.local domain context)
- Windows File System Auditing
- Python (log analysis)
- Matplotlib (visualization)
- Optional: Sysmon, pandas, seaborn, or email alerting
