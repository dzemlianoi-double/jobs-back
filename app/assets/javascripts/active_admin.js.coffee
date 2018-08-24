#= require active_admin/base
#= require activeadmin_reorderable
#= require active_admin/select2

$ ->
  $('#service_icon').keyup(() ->
    $('#service-icon-span').removeClass().addClass('fa fa-3x fa-' + this.value);
  )

  $('.specialities-select').select2
    tags: true

