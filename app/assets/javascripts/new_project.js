$(document).ready(function(){
  $(".new_project").hide();

  $(".add_project").click(function(){
    console.log("fetching list of repos..."); 
    $.getJSON("/github_api/repo_list", {}, function(data){
      console.log(data);
      for(var i in data)
      {
        var repo = data[i];
        $(".user_repos").append("<option value='"+repo['name']+"'>"+repo["name"]+"</option>"); 
      }
      $(".new_project").show();
      $(".add_project").hide();
      $("#project_name").val($(".user_repos").val());
    });
  
  });

  $(".user_repos").change(function(){
    $("#project_name").val($(this).val());
  });

  // add on select for user_repos and set the value of the form

});
