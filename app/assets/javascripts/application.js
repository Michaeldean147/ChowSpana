// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require semantic-ui
//= require_tree .
//
$(document).ready(function() {

  // $('#searchGlass').on('click', function(){
  //   var searchTerm = $('.searchBox').val()
  //   $.ajax({
  //     url: '/search',
  //     method: 'GET',
  //     dataType: "json",
  //     data: {'keyTerm': searchTerm}
  //   })
  // })
  
  $('.ui.sticky').sticky({
    context: '.pageFooter'
  });

  $('.dropdown')
  .dropdown({
    // you can use any ui transition
    transition: 'drop'
  })
  ;

  $('.staticMapLink').on('click',function(){
    $(this.nextElementSibling).toggleClass("hidden")
  })

  $('.faveFilterOldestButton').on('click', function() {
    event.preventDefault()
    sortType = "/old-sort"
    ajaxSort(sortType)
  });

  $('.faveFilterNewestButton').on('click', function() {
    event.preventDefault()
    sortType = "/new-sort"
    ajaxSort(sortType)
  });

    function ajaxSort(type){
      $.ajax({
      url: type,
      method: 'GET',
      dataType: "json"
      }).done(
      function(data){
        $(".postIndexMainGrid").remove()
        for (var i = 0; i < data.length; i++) {
          console.log(data)
          $(".favorites").append(
            '<div class="ui grid postIndexMainGrid"> \
              <div id="postIndexGrids" class="right floated left aligned ten wide column"> \
                <div id="indexPost"> \
                  <div id="postIndexPic" class="right floated center aligned two wide column"> \
                    <img src="'+ data[i].image_url +'" height="180" width="260"> \
                  </div> \
                  <div id="indexProName"> \
                    <h1><a href="posts/' + data[i].id +'"class="css_class">' + data[i].productname + '</a></h1> \
                  </div> \
                  <div id="indexProLoc"> \
                   <h5> Spotted In: ' + data[i].city + ', ' + data[i].state + '</h5> \
                  </div> \
                  <div id="indexProPrice"> \
                   <h5> Price: ' + data[i].price + '</h5> \
                  </div> \
                  <div id="indexProUser"> \
                   <h5> \
                   <a href="users/' + data[i].user_id +'" style="color:#000000;" class="css_class">Posted By: ' + data[i].username + '</a> \
                   </h5> \
                  </div> \
                </div> \
              </div> \
            </div>')
          }
          $('favorites').append(
          '<div class="ui grid pageFooter"> \
            <div id="postIndexGrids" class="right floated left aligned ten wide column"> \
            </div> \
          </div>'
          )
        }
      )
    }
});
