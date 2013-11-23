$('.empty_summoners').remove();
$('#summoners').prepend('<p>Summoner: <%= j link_to @summoner.summoner_name, @summoner %></p>');