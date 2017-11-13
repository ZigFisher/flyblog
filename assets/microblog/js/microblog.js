$(document).ready(function(){

  function loadTextile(path) {
    if (!path || path === "" || path === "/") {
      path = "index"
    }
    console.log('path:', path)

    var url = "/content/" + path + ".textile";
    console.log('url:', url)
    $.ajax({
      url: url,
    }).done( function(data) {
      var html = textile(data)
      $("#content").append(html)
    }).fail( function(data) {
      console.log(data)
      $.ajax({url: '/content/error.textile'})
        .done(function(data){
          $("#content").html(textile(data))
        })
    })
  }

  loadTextile(window.location.pathname)

  //Pop State
  $(window).on('popstate', function(e){
      var state = e.originalEvent.state;
      if(e.originalEvent && state){
        var path = state.path;
        loadTextile(path, {push: false});
      }
  });
})
