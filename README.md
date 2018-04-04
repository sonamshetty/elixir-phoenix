# ENV variables:

1. MAILGUN_DOMAIN 
2. MAILGUN_KEY
3. ADMIN_USER //Admin email_address

# Clone the repository

$ cd leave_app

$ mix deps.get

# To start leave_app:
 1. Make sure ENV variables are set
 
 2. Install dependencies with mix deps.get
 
 3. Install Node.js dependencies with cd assets && npm install
 
 4. Setup DB with mix ecto.migrate
 
 5. Start Phoenix endpoint with mix phoenix.server
