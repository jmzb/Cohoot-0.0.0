class DemoIndex < Chewy::Index

settings analysis: {
    analyzer: {
      basic: {
        tokenizer: 'standard',
        filter: ['lowercase', 'asciifolding']
      },
      sorted: {
        tokenizer: 'keyword',
        filter: ['lowercase', 'asciifolding']
      },
      description: {
      	tokenizer: 'classic',
      	filter: ['lowercase', 'asciifolding']
      }
    }
  }

define_type Program do

    field :prog_name, type: 'multi_field' do
    	field :prog_name, index: 'analyzed', analyzer: 'basic'
    	field :sorted, index: 'analyzed', analyzer: 'sorted'
    end

   field :ideal_candidate, type: 'multi_field' do
   		field :ideal_candidate, index: 'analyzed', analyzer: 'basic'
   		field :description, index: 'analyzed', analyzer: 'description'
   end	

   field :goal_condition, type: 'multi_field' do
   		field :goal_condition, index: 'analyzed', analyzer: 'basic'
   		field :description, index: 'analyzed', analyzer: 'description'
   end		

   field :candidate_requirements, type: 'multi_field' do
   		field :candidate_requirements, index: 'analyzed', analyzer: 'basic'
   		field :sorted, index: 'analyzed', analyzer: 'sorted'
   end		

   field :prog_obj, index: 'analyzed', analyzer: 'basic'
   field :next_step, index: 'analyzed', analyzer: 'basic'
   field :prog_cost, index: 'analyzed', analyzer: 'basic'
   field :prog_hours_per_units, index: 'analyzed', analyzer: 'basic'
   field :length_of_prog, index: 'analyzed', analyzer: 'basic'

   field :prog_hours, type: 'decimal'

   field :hrs_mon_s, type: 'time'
   field :hrs_mon_e, type: 'time'
   field :hrs_tues_s, type: 'time'
   field :hrs_tues_e, type: 'time'
   field :hrs_wed_s, type: 'time'
   field :hrs_wed_e, type: 'time'
   field :hrs_thurs_s, type: 'time'
   field :hrs_thurs_e, type: 'time'
   field :hrs_fri_s, type: 'time'
   field :hrs_fri_e, type: 'time'
   field :hrs_sat_s, type: 'time'
   field :hrs_sat_e, type: 'time'
   field :hrs_sun_s, type: 'time'
   field :hrs_sun_e, type: 'time'

   field :created_at, type: 'datetime'
   field :updated_at, type: 'datetime'
   field :organization_id, type: 'integer'
   field :org_id, type: 'integer'
  end


define_type Organization do
  field :name, type: 'multi_field' do
      field :name, index: 'analyzed', analyzer: 'basic'
      field :sorted, index: 'analyzed', analyzer: 'sorted'
    end

  field :content, index: 'analyzed', analyzer: 'basic'
  field :website, index: 'analyzed', analyzer: 'basic'
  field :history, index: 'analyzed', analyzer: 'basic'

  field :tagline, type: 'multi_field' do
    field :name, index: 'analyzed', analyzer: 'basic'
    field :sorted, index: 'analyzed', analyzer: 'sorted'
  end  

end

define_type Campaign do
  field :content, index: 'analyzed', analyzer: 'basic'
  field :tstmp, type: 'datetime'
  field :created_at, type: 'datetime'
  field :updated_at, type: 'datetime'
  field :user_id, type: 'integer'
end   


end