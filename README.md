#### Disclaimer
This app is woefully experimental, and is the result of an inexperienced rails
developer just banging on random things until they work.

# Pine

Welcome to Pine! Pine is a writing app for long-form content and making it
available to the federated web.

Pine uses OStatus to create a feed of articles that users on Mastodon or GNU
Social can subscribe to and comment on.

#### Goals

* 'Federation' - Pine intends to act as an OStatus provider. People on
OStatus-based networks can subscribe to either individual author feeds or
publications. Feeds contain articles, which contain a short preview of the
full content.

* 'Subscriptions'- Pine also acts as a feed reader for your favorite articles
on the web. As an added bonus, you can subscribe to other Pine authors, and
interact directly with their articles.

* 'Cross-Posting' - Connect your GNU Social or Mastodon account so that you
can automatically cross-share to your network of choice from inside the app.

* 'Microformats' - Add contextual information for better search integration

* 'OpenGraph'- ensure that every article specifies a title, a tagline, and
an image. Article previews could look good no matter where it's being shared
from.

* 'Publications' - Authors can roll their own writing groups with an emphasis
on a specific collection of articles, and OStatus users can subscribe to this.
In a Publication's feed, author attribution still reflects the original authors.
It just happens to show up 

* 'Tags' - All articles can be tagged, and those tags can be searched.

* 'Graceful Degradation' - Content should fit the network that is reading it.
GNU Social and Mastodon might need to render post in a fashion differently
than Diaspora.
