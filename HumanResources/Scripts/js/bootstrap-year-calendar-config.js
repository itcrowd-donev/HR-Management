var data = [];

$(document).ready()
{
    datepicker();
}

//Datepicker Date Format
function datepicker() {
    $('.datepicker').datepicker({
        format: 'dd/mm/yyyy'
    });
}


// (Extra) TODO: Get events for selected employees - url: /Vacations/Get; parameters {id}
function getEventById() {

}

//Get All Events
function getEvents() {

    $.ajax({
        type: "GET",
        url: "/Vacations/List",
        dataType: "json",
        async: false,
        success: function (response) {
            for (var i = 0; i < response.length; i++) {
                var aa = response[i].startDate;
                var startDateSplit = response[i].startDate.split("/");
                var endDateSplit = response[i].endDate.split("/");

                var syear = startDateSplit[2];
                var sday = startDateSplit[0];
                var smonth = startDateSplit[1];

                var eyear = endDateSplit[2];
                var eday = endDateSplit[0];
                var emonth = endDateSplit[1];

                response[i].startDate = new Date(syear, smonth, sday);

                response[i].endDate = new Date(eyear, emonth, eday);

                data.push(response[i]);
            }
        },
        error: function (response) {
            //alert("Error:" + response);
        }
    });
}

//Create & Edit
function editEvent(event) {
    $('#event-modal-update input[name="event-index"]').val(event ? event.id : '');
    $('#event-modal-update input[name="event-name"]').val(event ? event.name : '');
    $('#event-modal-update input[name="event-description"]').val(event ? event.description : '');
    $('#event-modal-update input[name="event-start-date"]').datepicker('update', event ? event.startDate : '');
    $('#event-modal-update input[name="event-end-date"]').datepicker('update', event ? event.endDate : '');

    $('#event-modal-update').modal('show', { backdrop: 'static', keyboard: false });

}

// TODO: Add post call to server - url: /Vacations/Delete; parameters {id}
//Delete Event
function deleteEvent(event) {
    var dataSource = $('#calendar').data('calendar').getDataSource();

    for (var i in dataSource) {
        if (dataSource[i].id == event.id) {
            dataSource.splice(i, 1);
            break;
        }
    }

    $('#calendar').data('calendar').setDataSource(dataSource);
}

// TODO: Add post call to server - url: /Vacations/Save; parameters {id,name,description,startDate,endDate}
//Save created or edited event
function saveEvent() {
    var event = {
        id: $('#event-modal-update input[name="event-index"]').val(),
        name: $('#event-modal-update input[name="event-name"]').val(),
        description: $('#event-modal-update input[name="event-description"]').val(),
        startDate: $('#event-modal-update input[name="event-start-date"]').datepicker('getDate'),
        endDate: $('#event-modal-update input[name="event-end-date"]').datepicker('getDate')
    }

    var dataSource = $('#calendar').data('calendar').getDataSource();

    if (event.id) {
        for (var i in dataSource) {
            if (dataSource[i].id == event.id) {
                dataSource[i].name = event.name;
                dataSource[i].description = event.description;
                dataSource[i].startDate = event.startDate;
                dataSource[i].endDate = event.endDate;
            }
        }
    }
    else {
        var newId = 0;
        for (var i in dataSource) {
            if (dataSource[i].id > newId) {
                newId = dataSource[i].id;
            }
        }

        newId++;
        event.id = newId;

        dataSource.push(event);
    }

    $('#calendar').data('calendar').setDataSource(dataSource);
    $('#event-modal').modal('hide');
}

//Initialize Calendar
$(function () {

    var currentYear = new Date().getFullYear();

    $('#calendar').calendar({
        enableContextMenu: true,
        enableRangeSelection: true,
        contextMenuItems: [
            {
                text: 'Update',
                click: editEvent
            },
            {
                text: 'Delete',
                click: deleteEvent
            }
        ],
        selectRange: function (e) {
            editEvent({ startDate: e.startDate, endDate: e.endDate });
        },
        mouseOnDay: function (e) {
            if (e.events.length > 0) {
                var content = '';

                for (var i in e.events) {
                    content += '<div class="event-tooltip-content">'
                        + '<div class="event-name" style="color:' + e.events[i].color + '">' + e.events[i].name + '</div>'
                        + '<div class="event-description">' + e.events[i].description + '</div>'
                        + '</div>';
                }

                $(e.element).popover({
                    trigger: 'manual',
                    container: 'body',
                    html: true,
                    content: content
                });

                $(e.element).popover('show');
            }
        },
        mouseOutDay: function (e) {
            if (e.events.length > 0) {
                $(e.element).popover('hide');
            }
        },
        dayContextMenu: function (e) {
            $(e.element).popover('hide');
        },
        dataSource: []
    });

    $('#save-event').click(function () {
        saveEvent();
    });
    getEvents();
    if (data != null && data.length != 0) {
        $('#calendar').data('calendar').setDataSource(data);
    }

});