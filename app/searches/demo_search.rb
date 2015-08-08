class DemoSearch
#DemoIndex.import

SORT = {prog_name: {'prog_name.sorted' => :asc}, relevance: :_score} #need to fully implement sorting

  def index
    DemoIndex
  end

  def search(query)
   [ match_all, query_string(query)].compact.reduce(:merge)
  end

# Using query_string advanced query for the main query input
  def query_string(query)
    index.query(query_string: {fields: 
                  [:prog_name, 
                   :ideal_candidate, 
                   :goal_condition, 
                   :candidate_requirements, 
                   :prog_obj,
                   :next_step
                  ],
                               query: query, 
                               default_operator: 'and',
                               fuzziness: 'auto',
                               phrase_slop: '5'
                               })

  end

  def match_all
    index.filter{ match_all }.filter_mode('10%')
  end


 
#def wildcard(query)
#    index.filter(wildcard: query)
#end  

end


