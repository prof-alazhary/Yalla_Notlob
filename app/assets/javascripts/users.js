var ready;
ready = function() {
    var engine = new Bloodhound({
        datumTokenizer: function(d) {
            console.log(d);
            return Bloodhound.tokenizers.whitespace(d.title);
        },
        queryTokenizer: Bloodhound.tokenizers.whitespace,
        remote: {
            url: '/users/?query=%QUERY',
            wildcard: '%QUERY'
        }
    });

    var promise = engine.initialize();

    promise
        .done(function() { console.log('success!'); })
        .fail(function() { console.log('err!'); });

    $('.typeahead').typeahead({
          minLength: 1,
          highlight: true,
          hint: true
        }, {
        name: 'engine',
        display: function(item){ return item.email},
        displayKey: 'email',
        templates: {
            suggestion: function(data) {
                console.log(data);
                var details = "<div id='sug' class='rounded' style='background-color:white;border:solid 1px grey;padding: 5px 5px;'> " + data.name +', ' + data.email + "</div>";
                return details
            }
        },
        minLength: 1,
        source: engine.ttAdapter()
    });
    //console.log("hii there")
}

$(document).ready(ready);
$(document).on('page:load', ready);
