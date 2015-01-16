class Peep

  include DataMapper::Resource

  property :id,    Serial
  property :text,  Text
  
  # DataMapper.auto_upgrade!

  # belongs_to :user


end