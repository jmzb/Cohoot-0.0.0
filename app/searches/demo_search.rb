class DemoSearch

SORT = {prog_name: {'prog_name.sorted' => :asc}, relevance: :_score} #need to fully implement sorting

  def index
    DemoIndex
  end

  def search(query)
   [query_string2].compact.reduce(:merge)
  end

  def query_string
  	index.query(match_all: {} ) #broken now
  end

  def query_string2
    index.query(match: {prog_name: 'test'}) #works, hard-code search for 'test'
  end

  def query_string_org
    index.query(match: {name: ''}) 
  end


  def query_string3
    index.query(query_string: {fields: [:prog_names]}) #broken
  end

  def query_string4
    index.query(query_string: {}) #broken
  end

# Using query_string advanced query for the main query input
  def query_string5
    index.query(query_string: {fields: [:title, :author, :description],
                               query: query, default_operator: 'and'}) 
  end

end


