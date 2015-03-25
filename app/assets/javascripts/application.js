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
//= require_tree .
//
$(document).ready(function() {
  $('.faveFilterOldestButton').on('click', function() {
    event.preventDefault()
      $.ajax({
      url: "/sort",
      method: 'GET',
      dataType: "json"
    }).done(
      function(data){
        $(".favorites").remove()
        $("body").append("<div class='favorites'></div>")
        for (var i = 0; i < data.length; i++) {
          console.log(data)
          $(".favorites").append(
            '<div id="postIndexMainGrid" class="ui grid"> \
              <div id="postIndexGrids" class="right floated left aligned ten wide column"> \
                <div id="indexPost"> \
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
      }
    )
  });
});

// <div class="favorites">
// <% @favorites.reverse.each do |favorite| %>
//
// <div id="postIndexMainGrid" class="ui grid">
// <div id="postIndexGrids" class="right floated left aligned ten wide column">
// <div id="indexPost">
// <div id="postIndexPic" class="right floated center aligned two wide column">
// <%= image_tag favorite.image.url, :size => "260x180" %>
// </div>
// <div id="indexProName">
// <h3><%= link_to "#{favorite.productname}", favorite, {:style=>'color:#000000;', :class => "css_class"} %></h3>
// </div>
//
// <div id="indexProLoc">
// <h5><%= "Spotted In: #{favorite.city}, #{favorite.state}"%></h5>
// </div>
//
// <div id="indexProPrice">
// <h5><%= "Price: #{favorite.price}"%></h5>
// </div>
//
// <div id="indexProUser">
// <h5>
// <%= "Posted By User:" %>
// <%=link_to "#{favorite.user.username}", favorite.user, {:style=>'color:#000000;', :class => "css_class"} %>
// </h5>
// </div>
//
// </div>
// </div>
// </div>
//
// <% end %>
//
// </div>
