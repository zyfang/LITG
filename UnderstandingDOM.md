## Understanding DOM

Background information:
- Example website [Schwarzesbrett](http://schwarzesbrett.bremen.de/verkauf-angebote/rubrik/wohnung-mietangebote-verkauf.html)
- Using Chrome to inspect website
- Google Developer information to learn more about Chrome developer tools: [link](https://developer.chrome.com/devtools) and [DOM specifically](https://developer.chrome.com/devtools/docs/dom-and-styles). _Note: I haven't read through all this information yet_
- Various HTML information: [W3Schools](http://www.w3schools.com)

### Schwarzesbrett
#### Main page
The main page contains a list with listings. The listings are in an unordered HTML list, inside a div container with id called "eintraege".

The path to one such listing looks as follows:
```
<html> 
    <body>
  		<div id="ip_content_wrapper">
  			<div id="container">
  				<div class="main_content">
  					<div class="article rubrik"> 
  						<div id="eintraege">
  							<ul class="content_list_eintraege_list">
  								<li class>
```

Inside the _li_ there is a link to the listing itself with the title and date. The date is in a span class="list_date". I don't really understand but there are two spans after the date, each corresponding to an icon. The only thing in the span is "::before" though; I don't know what that does.

The li can have a class. The different classes I've observed are " first gewerblich", " gewerblich" and " photo". They seem to correspond with the icons displayed after the listing title. E.g. either an euro sign or a photo icon. This seems to indicate whether a listing is commercial and whether there are photo's included.

I don't see the difference between " first gewerblich" and "gewerblich". 

**Question: Can I see the class declaration of that somewhere?**

**What does "::before" in the span class="fa fa-eur" and span class="fa fa-angle-right" do?**

Other relevant information might be the date headers (though I think it's more straightforward to get it from the listitem). The date headers are in 
```
<div class="article_rubrik">
	<div id="eintraege">
    	<span class="date_headline" id="[somedate in text form]">
```

#### Listing page
One listings page contains the information of one apartment/home listing. The information here does not appear to be sorted into fields. With other words, people write here whatever they want to describe the object. Usually there is some text that says "[number] Zimmer" (number of rooms) and "[number]qm^2" or "[number]m^2" (number of square meters). They usually mention "Kaltmiete" (bare rent) and "Nebenkosten" (other costs that are added to the rent). There is usually a lot of description around the street/ area. Other information can include which floor, how much the deposit is, and additional information about the desired renters or that for example the apartment was just renovated. 

All this information is contained in:
```
<html>
  	<div id="ip_page_wrapper">
		<div id="content_wrapper">
	  		<div class="centerframe" id="mainframe">
	  			<div id="container">
	  				<div class="main_content">
	  					<div class="article anzeige" id="main" role="main">
	  						<div id="gewerbliche_anzeige">
```

Then it contains paragraps _p_ with text. It also has the entry date in `<p class="entry_date">`

**Note: I'm surprised that the HTML code appears to be actually documented/commented :)**

###Engel&Völkers
####Main page(s)

This company seems to be active in more than one city. The main page contains a search box for the type of property one is looking for.

**Note: should look into how to simulate user activity**

A general search for apartments/houses in Bremen directs [here](http://www.engelvoelkers.com/search?frmlc=&srch=iframe-criteria&language=de&q=bremen&facets=bsnssr:residential;typ:rent;cntry:germany;rgn:bremen;dstrct:bremen)

This brings us to a page with listings. Eacg listing is contained in:
```
<html>
	<body>
		<div id="wrap">
			<div class="contentBox row">
				<div id="results" class="nine last">
					<div class="item residential-rent first">
						<a class="ev-exposee-teaser-link" href="[...]"
```
The link to the listing actually contains a photo of the property and various information such as price and space. 
- Image: `<div class="imageContainer three">` 
- Other information: `<div class="item_details six last">`
	- Header: `<a class="ev-clickable primary">` with a link to the detailed page and text for the header
	- Details what appear to be search-tags related inside a paragraph tag: e.g. type of property, type of ad (sale or rent), country, city, city district
	- Size, number of rooms (number of bathrooms, number of bedrooms), ID: `<div class= "left three"> *(seems to correspond to there usually being three items in the left column of this section). Inside that container there are divs with classes called "labelValue", which each contain a `label`, a `span` and a `div` container.
	- Total rent, bare rent, Nebenkosten: `<div class= "right three last"> <div class="price">`. Inside that container there are three divs with class "labelValue", which each contain a `label`, `span`, and `div` container. Label "Nebenkosten" is not always defined as there is not always a number available here. For example, the span might instead contain "zzgl. Nebenkosten" (Nebenkosten will be added to the price).

####Listings page
