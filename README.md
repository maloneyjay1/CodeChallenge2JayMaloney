# CodeChallenge2JayMaloney
JSON Parsing of large / flat source, UITableView UI

This was my second attempt at displaying data from a large source.  I retrieved asynchronously using MVC structure, and used an overall  master/detail design.

I completed it in 2 hours, and overall feel much better about this second attempt.  It made me think about the challenges of dealing with a variety of API's, and
how to deal with that in terms of loading UI elements.  I look forward to improving.

Also this was a great example of "keep it simple."  I initially tried using a complicated custom collection view and ended up not succeeding.
I'm very happy with this alternate approach.

From a user experience, this is a massive amount of data.  It's very difficult to get to a chosen title because there are 2000 items present.  One area to improve this would be to implement UISearchBarDelegate and allow a user to search by title.  This would also be a great opportunity to use an autocomplete, since some of the titles are very specific.  That search could return an indexPath and then scroll to the chosen item in the tableView.
