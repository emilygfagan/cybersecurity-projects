# Honeytoke System - Project Overview

This project is built as an extension of the [`**Fagan Systems** Active Directory lab`](https://github.com/emilygfagan/active-directory/blob/main/README.md) — a fictional company environment designed to simulate enterprise IT infrastructure. The honeytoken system enhances that environment by introducing deception-based security controls, such as fake files and monitoring traps, to detect unauthorized activity within the domain.

Honeytokens are decoy files or assets planted intentionally to alert defenders when accessed. In this project, honeyfiles are generated, placed in sensitive-looking folders (like `HRConfidential`), monitored for access, and logged for analysis — mimicking real-world intrusion detection techniques.
## Project Goals

The purpose of this project is to build a simple, modular honeytoken system for Windows environments using PowerShell and Python. The project follows this structured progression:     

### Part 1: Honeyfile Generation (PowerShell)
- Allow the user to select a target foler
