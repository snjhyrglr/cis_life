$(document).on('change', '#my_model_month', function() {
  var month = $(this).val();
  var year = new Date().getFullYear();
  var daysInMonth = new Date(year, month, 0).getDate();

  if (month == 2) {
    if (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0)) {
      daysInMonth = 29;
    } else {
      daysInMonth = 28;
    }
  }

  var $daySelect = $('#my_model_day');
  var currentDay = parseInt($daySelect.val());
  console.log(daysInMonth)

  $daySelect.empty();

  for (var i = 1; i <= daysInMonth; i++) {
    var option = $('<option>', { value: i, text: i });
    if (i === currentDay) {
      option.attr('selected', true);
    }
    $daySelect.append(option);
  }
});