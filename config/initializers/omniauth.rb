require 'omniauth'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :LDAP, :host => 'ldap.rit.edu', :port => 636, :method => :ssl, 
                  :base => "ou=people,dc=rit,dc=edu", :uid => "uid"
end