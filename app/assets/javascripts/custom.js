$(function(){
  $(document).on("click", ".checkbox_answer", function(){
    checkbox = this;
    if (checkbox.checked){
      $("input.checkbox_answer").each(function(){
        if (checkbox != this) {
          $(this).prop("checked", false);
        }
      });
    }
  });

  $(document).on("click", "#btn_word", function(){
    var flag = false;
    $("input[type=checkbox]").each(function(){
      if(this.checked) {
        flag = true;
        if($(this).parent().find(".word_content").val().trim() == ""){
          flag = false;
        }
      }
    });
    if (!flag) {
      alert($("span.alert_true_answer").text());
    }
    return flag;
  });

  $(document).on("click", ".remove_fields", function(){
    $(this).prev().val(1);
    $(this).parent().parent().hide(100);
  });

  $(document).on("click", ".add_child", function() {
    var association = $(this).attr("data-association");
    var regexp = new RegExp("new_" + association, "g");
    var new_id = new Date().getTime();
    $($(this).attr("target")).append(window[association+"_form"]
      .replace(regexp, new_id));
    return false;
  });
});
