$(document).on 'ready page:load', ->
  $('#article-tags').tagit
    fieldName:   'article[tag_list]'
    singleField: true
