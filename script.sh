# Function to check the status of the incident
is_incident_open() {
    inc_number=$1
	file_name="ticket_status.txt"

	grep -e "^$inc_number" $file_name | awk '{print $2}'
}
# Function to get the event of the incident
get_event_from_ticket() {
    inc_number=$1
    file_name="events_tickets.txt"

	grep -e "^$inc_number" $file_name | awk '{print $2}'
}
# Function to close the event
close_incident() {
    inc_number=$1
    file_name="events_status.txt"
    event_id=$(get_event_from_ticket $inc_number)

    echo "$event_id closed" >> $file_name
}



read -p "Enter incident number: " inc_number

event_id=$(get_event_from_ticket $inc_number)

if [ -z $event_id ]
then
    echo "Ticket does not have an associated event"
    exit 1
fi

is_open=$(is_incident_open $inc_number)
if [ $is_open == "opened" ]
then
    echo "Event ($event_id) is still open"
elif [ $is_open == "closed" ]
then
    close_incident $inc_number
    echo "Event ($event_id) is closed, added to closed events file (events_status.txt)"
else
    echo "Invalid ticket state for ($inc_number)"
fi
