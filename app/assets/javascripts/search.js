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
  	  	header: "<strong>CS MODULES POSTS</strong>"
  	  },
      {
        listLocation: "activity_posts",
        header: "<strong>CS ACTIVITIES POSTS</strong>"
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