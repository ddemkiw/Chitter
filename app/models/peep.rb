require_relative 'user'

class Peep

  include DataMapper::Resource

  property :id,    Serial
  property :text,  Text
  property :created_at, DateTime
  
  # DataMapper.auto_upgrade!

  belongs_to  :user


end