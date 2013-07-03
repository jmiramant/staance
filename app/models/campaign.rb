class Campaign < ActiveRecord::Base
attr_accessible 

has_many	:users, as: :userable
belongs_to	:topic

:topic

end
