$(document).ready()
{

}

var data = [];
function getEvents() {

    $.ajax({
        type: "GET",
        url: "/Vacations/GetVacations",
        dataType: "json",
        async: false,
        success: function (response) {
            for (var i = 0; i < response.length; i++) {
                var syear = response[i].startDate.getFullYear();
                var sday = response[i].startDate.getDate();
                var smonth = response[i].startDate.getMonth();

                var eyear = response[i].endDate.getFullYear();
                var eday = response[i].endDate.getDate();
                var emonth = response[i].endDate.getMonth();

                dataSource[i].startDate = new Date(syear, smonth, sday);

                dataSource[i].endDate = new Date(eyear, emonth, eday);

                data.push(response[i]);
            }
            //var events = JSON.stringify(response);
            //data = events;
        },
        error: function (response) {
            alert("Error:" + response);
        }
    });
}


function editEvent(event) {
    $('#event-modal input[name="event-index"]').val(event ? event.id : '');
    $('#event-modal input[name="event-name"]').val(event ? event.name : '');
    $('#event-modal input[name="event-description"]').val(event ? event.description : '');
    $('#event-modal input[name="event-start-date"]').datepicker('update', event ? event.startDate : '');
    $('#event-modal input[name="event-end-date"]').datepicker('update', event ? event.endDate : '');
    $('#event-modal').modal();
}

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

function saveEvent() {
    var event = {
        id: $('#event-modal input[name="event-index"]').val(),
        name: $('#event-modal input[name="event-name"]').val(),
        description: $('#event-modal input[name="event-description"]').val(),
        startDate: $('#event-modal input[name="event-start-date"]').datepicker('getDate'),
        endDate: $('#event-modal input[name="event-end-date"]').datepicker('getDate')
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
    //$('#calendar').data('calendar').setDataSource(data);

    var dat1a = [
        {
            id: 9,
            name: 'LA Tech Summit',
            description: 'Los Angeles, CA',
            startDate: new Date(2018, 10, 17),
            endDate: new Date(2018, 10, 17)
        },
        {
            id: 10,
            name: 'LA Tech Summit',
            description: 'Los Angeles, CA',
            startDate: new Date(2018, 10, 17),
            endDate: new Date(2018, 10, 20)
        },
    ];
    var aaa = data;
    getEvents();
    $('#calendar').data('calendar').setDataSource(aaa);
    var dataSource = $('#calendar').data('calendar').getDataSource();
    //getEvents();
});