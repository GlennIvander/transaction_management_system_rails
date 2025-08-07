Transaction Management System

This Ruby on Rails application allows users to manage financial transactions stored in a CSV file. It supports CSV import/export, filtering by account holder name, and includes a simple frontend built with Tailwind CSS and Hotwire.

Things you may want to cover:

* Ruby version
-Ruby: 3.2.2
-Rails: 7.x
-PostgreSQL: >= 13 (only required if we're going to use ActiveRecord features — the core functionality uses CSV)

* System dependencies
-Ruby (rbenv or rvm are recommended but this code was made in asdf)
-Rails
-Node.js (>= 16)
-Yarn
-PostgreSQL (optional for ActiveRecord setup)
-Git

* Configuration
1. Clone the repository:
   -git clone https://github.com/GlennIvander/transaction_management_system_rails.git
   -cd transaction_management_system_rails.git
2. Install dependencies:
   -bundle install
   -yarn install
3. Prepare the CSV:
   -db/seeds/transactions-sample.csv
   (You can edit it or replace it with your own data.)

* Database creation(optional)
  Although this app works with a CSV file, if you plan to use database-backed features like user authentication:
  -rails db:create
  -rails db:migrate

* Database initialization
  -bin/rails csv:quote_all_fields

* How to run the test suite
  -bin/dev (This will start both the Rails server and Tailwind CSS)
  Then visit
  -http://localhost:3000

* Services (job queues, cache servers, search engines, etc.)
  -Hotwire (Turbo + Stimulus) for interactivity
  -Tailwind CSS for styling
  -Ransack (simulated) for local search filtering (CSV-based)
  -Custom Service Objects for CSV reading/writing

* Deployment instructions

* Project Structure Notes
  -app/controllers/transactions_controller.rb — Main UI logic
  -app/controllers/api/v1/transactions_controller.rb — API for client-side use
  -app/services/csv_reader_service.rb — Handles CSV loading
  -app/services/csv_writer_service.rb — Handles writing/appending to CSV
  -app/helpers/transactions_helper.rb — View logic (formatting, styling)
  
