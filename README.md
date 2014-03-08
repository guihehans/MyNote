== README

Task1:API document.

There are two API implemented in the project.
login: POST /login   params: name=NAME,password=PASS
notes: GET /notes    params: token=TOKEN.

the login API returns a random hashed token as the indentity of user in json format.

the notes API returns a json string which contains all notes belongs to the user loginned.

login API is proccessed by sessions_controller, which accept the params Hash,authenticate user's name and password then updates the user.
notes API is proccessed by notes_controller, which accept the params and access the all of user's notes by association.

By configuring the routes, the RESTful style is achieved.
 get '/notes', to: 'notes#index', as: 'notes'
 post '/login', to: 'sessions#create', as: 'login'


The test of API uses POSTMAN which generates multiple HTTP requests.