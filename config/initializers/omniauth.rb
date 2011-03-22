Rails.application.configure.middleware.use OmniAuth::Builder do
  provider :ldap, :host => 'ldap.rit.edu', :port => 636, :method => :ssl, 
                  :base => "ou=people,dc=rit,dc=edu", :uid => "uid"
end