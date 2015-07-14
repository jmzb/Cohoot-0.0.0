class DemoSearch

SORT = {prog_name: {'prog_name.sorted' => :asc}, relevance: :_score} #need to fully implement sorting

  def index
    DemoIndex
  end

  def search(query)
   [query_string(query)].compact.reduce(:merge)
  end

# Using query_string advanced query for the main query input
  def query_string(query)
    index.query(query_string: {fields: 
                  [:prog_name, 
                   :ideal_candidate, 
                   :goal_condition, 
                   :candidate_requirements, 
                   :prog_obj, 
                   :name,
                   :content],
                               query: query, 
                               default_operator: 'and'}) 
  end

end


