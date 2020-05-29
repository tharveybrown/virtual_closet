# Virtual Closet

### Setup

* `bundle install`
* `rails db:migrate`



You will need to get a new api key from [mirror that look](https://mirrorthatlook.com/). Once you have your key, run `bundle exec Figaro install`. 

In /config/application.yml, add the key as:
`MTL: {your-api-key}`

Visit localhost:3000 (`rails s`) and sign up today! This webapp will help you discover new outfits from in closet and recommend what to wear based on the weather. 

