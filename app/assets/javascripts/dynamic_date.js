$(document).on('change', '#policy_month', function() {
  var month = $(this).val();
  var daysInMonth = new Date(month, 0).getDate();
  var $daySelect = $('#policy_day');
  var currentDay = parseInt($daySelect.val());
  
  $daySelect.empty();
  
  for (var i = 1; i <= daysInMonth; i++) {
    var option = $('<option>', { value: i, text: i });
    if (i === currentDay) {
      option.attr('selected', true);
    }
    $daySelect.append(option);
  }
});
