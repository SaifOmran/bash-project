# Close Symptom Events

Final project for the Bash Scripting Course at ITI - Intake 46 - Cloud Architecture, Ismailia Branch.

## Project Description

This project simulates a real-world monitoring scenario where events from various sources (like servers) open corresponding incident tickets. Sometimes, an incident is resolved and its ticket is closed, but the event remains open in the monitoring tool.

This script automates the process of closing these orphaned events. It checks the status of an incident number provided by the user. If the incident is marked as "closed", the script finds the associated event ID and records it as "closed" in a status file.

## How it Works

The script reads from two source files:

*   `ticket_status.txt`: Contains a list of incident numbers and their current status (`opened` or `closed`).
*   `events_tickets.txt`: Maps incident numbers to their corresponding event IDs.

### Usage

1.  Run the script from your terminal:
    ```bash
    ./script.sh
    ```
2.  When prompted, enter the incident number you wish to check.
    ```
    Enter incident number: INC0000401340
    ```
3.  The script will then perform the following actions:
    *   **If the incident is "closed"**: It will find the associated event ID and append it to the `events_status.txt` file with a "closed" status. It will then print a confirmation message to the console.
        ```
        Event (6192fd9a-9b03-71ec-01b9-0a4e23454213) is closed, added to closed events file (events_status.txt)
        ```
    *   **If the incident is "opened"**: It will do nothing besides notifying you that the event is still open.
        ```
        Event (6192fd9a-9b03-71ec-01b9-0a4e23470000) is still open
        ```
    *   **If the incident number is not found**: It will display an error message.
        ```
        Ticket does not have an associated event
        ```

## Files

*   `script.sh`: The main executable bash script.
*   `ticket_status.txt`: Input file containing incident statuses.
*   `events_tickets.txt`: Input file mapping incidents to events.
*   `events_status.txt`: Output file where closed events are logged.
