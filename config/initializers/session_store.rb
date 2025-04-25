# config/initializers/session_store.rb

Rails.application.config.session_store :cookie_store, 
  key: 'YU3Oq3kKViqqPsEavPKF%2BY%2B%2FaiV0TCxOjkbuNZQtPxpNSpOIltCcPU2uuJMBfG3uEVPJyQhnrva5JDlAGcJyXVZfIEG40NlNhp0iFdSCgK3lJOU1eHULVNcLrWj0LExWvVqsQ5biR4Du7%2FZGz9NOynqWR0a%2Fp%2Fs3lkGpDESiOsRhB81N9%2F%2FL1lNAhijo%2FoLf9WrcGU8Gf9OQBFrS2bPojefDUJt3uwdqGfJB7q8wKmQXo0bnhf8VljJNxE%2F9v5uq10%2FofAvBprzDDQJGmO0DSovS8Zrc94iugUyT--ds%2BkvzaZkFLnurJy--iviEaLqGPn5PFM8EBWkE2g%3D%3D', 
  secure: Rails.env.production?, 
  same_site: :strict
