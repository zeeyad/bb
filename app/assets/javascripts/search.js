document.addEventListener("turbolinks:load",function(){
  $input = $("[data-behavior='autocomplete']")

  var options = {
  	getValue: "title", 
  	url: function(phrase) {
  		return "/search.json?q=" + phrase;
  	},
  	categories: [
  	  {
  	  	listLocation: "module_posts",
  	  	header: "<strong>MODULES POSTS</strong>"
  	  },
      {
        listLocation: "activity_posts",
        header: "<strong>ACTIVITIES POSTS</strong>"
      },
      {
        listLocation: "event_posts",
        header: "<strong>EVENT POSTS</strong>"
      }
    ],
  	list: {
  		onChooseEvent: function() {
  		  var url = $input.getSelectedItemData().url
  		  $input.val("")
  		  Turbolinks.visit(url)
  		}
  	}
  }
  $input.easyAutocomplete(options)
})