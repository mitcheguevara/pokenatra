ActiveRecord::Base.establish_connection({
  database: 'poke_db',
  adapter: 'postgresql'
})

# Fix an issue with sinatra and Active Record where connections are left open
if defined? Sinatra
	after do
	  ActiveRecord::Base.connection.close
	end
end
