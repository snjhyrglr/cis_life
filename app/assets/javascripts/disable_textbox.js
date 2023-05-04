// $(function() {
//   $('#myTextBox').hide();
//   console.log($('#myTextBox'))

//   $('input[name="batch_health_dec[ans_q5_b]"]').on('change', function() {
//     if(this.value === 'true') {
//       // Show the text input if "Yes" is selected
//       console.log("true")
//       console.log($('#myTextBox'))
//       $('#myTextBox').show();
//     } else {
//       // Hide the text input if "No" is selected
//       console.log("false")
//       $('#myTextBox').hide();
//     }
//   });
// });

function showHideTextbox(radioBtnId, textboxId) {
  $(function() {
    
    console.log("showHideTextbox function called");
    $('#' + textboxId).hide();
    
    $('input[name="' + radioBtnId + '"]').on('change', function() {
      if(this.value === 'true') {
        $('#' + textboxId).show();
        console.log("show")
      } else {
        $('#' + textboxId).hide();
        console.log("hide")
      }
      });
    });
}

document.addEventListener("turbo:load", function() {
  showHideTextbox('batch_health_dec[ans_q5_b]', 'myTextBox');
  showHideTextbox('batch_health_dec[ans_q5_a]', 'myTextBox1');
  showHideTextbox('batch_health_dec[ans_q4]', 'myTextBox2');
  showHideTextbox('batch_health_dec[ans_q3]', 'myTextBox3');
});