<% if @summoner.valid? %>
  $('.empty_summoners').remove()
  $('#loading').hide()
  $('#summoners').prepend('<p>Summoner: <%= @summoner.summoner_level %></p>')
<% else %>
  $('#loading').hide()
  $('#summoners').prepend('<p>ERROR ERROR ERROR</p>')
<% end %>