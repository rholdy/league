<% if @summoner.valid? %>
  $('.empty_summoners').remove();
  $('#summoners').prepend('<p>Summoner: <%= @summoner.summoner_level %></p>');
<% else %>
  $('#summoners').prepend('<p>ERROR ERROR ERROR</p>');
<% end %>