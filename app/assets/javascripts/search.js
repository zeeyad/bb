document.addEventListener("turbolinks:load",function(){
  $input = $("[data-behavior='autocomplete']")

  var options = {
  	getValue: "title", 
  	url: function(phrase) {
  		return "/search.json?q=" + phrase;
  	},
  	categories: [
  	  {
  	  	listLocation: "cs_module_posts",
  	  	header: "<strong>Cs Modules Post</strong>"
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