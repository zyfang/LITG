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
_<html> > <body> > <div id="ip_content_wrapper"> > <div id="container"> > <div class="main_content"> > <div class="article rubrik"> > <div id="eintraege"> > <ul class="content_list_eintraege_list"> > <li class>_

Inside the _li_ there is a link to the listing itself with the title and date. The date is in a span class="list_date". I don't really understand but there are two spans after the date, each corresponding to an icon. The only thing in the span is "::before" though; I don't know what that does.

The li can have a class. The different classes I've observed are " first gewerblich", " gewerblich" and " photo". They seem to correspond with the icons displayed after the listing title. E.g. either an euro sign or a photo icon. This seems to indicate whether a listing is commercial and whether there are photo's included.

I don't see the difference between " first gewerblich" and "gewerblich". 
**Question: Can I see the class declaration of that somewhere?**
**What does "::before" in the span class="fa fa-eur" and span class="fa fa-angle-right" do?**

Other relevant information might be the date headers (though I think it's more straightforward to get it from the listitem). The date headers are in <div class="article_rubrik"> > <div id="eintraege"> > <span class="date_headline" id="[somedate in text form]">.

#### Listing page
One listings page contains the information of one apartment/home listing. The information here does not appear to be sorted into fields. With other words, people write here whatever they want to describe the object. Usually there is some text that says "[number] Zimmer" (number of rooms) and "[number]qm^2" or "[number]m^2" (number of square meters). They usually mention "Kaltmiete" (bare rent) and "Nebenkosten" (other costs that are added to the rent). There is usually a lot of description around the street/ area. Other information can include which floor, how much the deposit is, and additional information about the desired renters or that for example the apartment was just renovated. 

All this information is contained in:
_<html> > <div id="ip_page_wrapper"> > <div id="content_wrapper"> > <div class="centerframe" id="mainframe"> > <div id="container"> > <div class="main_content"> > <div class="article anzeige" id="main" role="main"> > <div id="gewerbliche_anzeige">_
Then it contains paragraps _p_ with text. It also has the entry date in <p class="entry_date">