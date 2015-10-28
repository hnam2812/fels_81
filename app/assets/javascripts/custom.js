$(function(){
  $(".checkbox_answer").click(function(){
    checkbox = this;
    if (checkbox.checked){
      $("input.checkbox_answer").each(function(){
        if (checkbox != this) {
          $(this).prop("checked",false);
        }
      });
    }
  });

  $("#btn_word").click(function(){
    var flag = false;
    $("input[type=checkbox]").each(function(){
      if(this.checked) {
        flag = true;
        if($(this).parent().find(".word_content").val().trim() == ""){
          flag = false;
        }
      }
    });
    return flag;
  });

  $("#answers").on("click", ".remove_fields", function(){
    $(this).prev().val(1);
    $(this).parent().parent().hide(100);
  });

  $(".add_child").click(function() {
    var association = $(this).attr("data-association");
    var regexp = new RegExp("new_" + association, "g");
    var new_id = new Date().getTime();
    $($(this).attr("target")).append(window[association+"_form"]
      .replace(regexp, new_id));
    return false;
  });
});


