//cannot use doc data
var repo_dump = {};

$(document).ready(function(){
  $(".new_project").hide();

  $(".add_project").click(function(){
    console.log("fetching list of repos..."); 
    $.getJSON("/github_api/repo_list.json", {}, function(data){
      console.log(data);
      
      repo_dump = data;
      for(var i in data)
      {
        var repo = data[i];
        $(".user_repos").append("<option value='"+i+"'>"+repo["name"]+"</option>"); 
      }

      $(".new_project").show();
      $(".add_project").hide();
    
      var i = $(".user_repos").val(),
          repo = repo_dump[i];
    
      $("#project_name").val(repo['name']);
      $("#project_description").val(repo['description']);
      $("#project_project_url").val(repo['homepage']);
    });
  
  });

  $(".user_repos").change(function(){
      var i = $(this).val(),
          repo = repo_dump[i];
      
      $("#project_name").val(repo['name']);
      $("#project_description").val(repo['description']);
      $("#project_project_url").val(repo['homepage']);
  });
  
  $(".voting_form").bind('ajax:success', function(e, data, status, xhr){

        var currentVotes = parseInt($(this).prev().find('.votes').html().trim());

        console.log($(this).prev().html());
        $(this).prev().html(currentVotes+1);
        $(this).find('.vote_button').attr('src', '/assets/likeClick.png');
  });
  $(".voting_form").bind('ajax:error', function(e, xhr, status, error){
        // just leave the button alone
        console.log(xhr,error);
  });

});
