This is a simple wrapper around Foreman API.

You can search a host by id:

    host = ForemanDB::Host.find_by_id(4) #=> #<ForemanDB::Host:0x007f99a39e0ab8 @id=4...>


Or you cand do a search for hosts with a query:


    search = ForemanDB::Search.search("params.custom_parameter_2 = test")
    search.results #=> [#<ForemanDB::Host:0x007fe9139c5898>....]
