Mongoid.configure do |config|
  if Mongoid::VERSION >= '5.0.0'
    config.connect_to 'mongoid_enum_mapper_test'
  else
    config.sessions = { default: { hosts: ['0.0.0.0:27017'], database: 'mongoid_enum_mapper_test' }}
  end
end
