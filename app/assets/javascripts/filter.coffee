$(document).ready ->
 params = [
  ''
  ''
  ''
  ''
  ''
]
 class Filter
  constructor: (array) ->
   $('ul.dropdown-menu').on 'click', 'li', @asign1
   $('.filter-type1').on 'click', 'div', @filter_type
   $('.filter-type2').on 'click', 'div', @filter_category


  asign1: ->
   aux = []
   id = $(this).attr('id')
   params[2] = '&year=' + id.split('-')[0]
   params[3] = '&month=' + id.split('-')[1]
   params[4] = '&date=' + id
   $('#date-selector').text(id).append ' <span class="caret"></span>'
   query.send_query params
   query.put_url params


  filter_type: ->
   if $(this).hasClass('active')
    $(this).toggleClass 'active'
    query.asign
     filter_by: 'type'
     id: ''
   else
    $('.filter-type1 div').removeClass 'active'
    $(this).addClass 'active'
    query.asign
     filter_by: 'type'
     id: $(this).attr('id') 


  filter_category: ->
   if $(this).hasClass('active')
    $(this).toggleClass 'active'
    query.asign
     filter_by: 'category'
     id: ''
   else
    $('.filter-type2 div').removeClass 'active'
    $(this).addClass 'active'
    query.asign
     filter_by: 'category'
     id: $(this).attr('id')


 class QueryString
  asign: (id) ->
   if id.filter_by == 'type'
    if id.id == ''
     params[0] = ''
    else
     params[0] = 'type=' + id.id
   else
    if id.id == ''
     params[1] = ''
    else
     params[1] = '&category=' + id.id
   query.send_query params
   query.put_url params  



  send_query: (params) ->
   $.ajax
    url: '/expenses?' + params[0] + params[1] + params[4]
    dataType: 'script'
    type: 'GET'


  put_url: (params) ->
   if history.pushState
    newurl = window.location.protocol + '//' + window.location.host + window.location.pathname + '?' + params[0] + params[1] + params[2] + params[3]
    window.history.pushState { path: newurl }, '', newurl



 filter = new Filter
 query = new QueryString
