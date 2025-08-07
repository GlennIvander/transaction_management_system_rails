# 📊 Transaction Management System
This Ruby on Rails application allows users to manage financial transactions stored in a CSV file. It supports CSV import/export, filtering by account holder name, and includes a simple frontend built with Tailwind CSS and Hotwire.

## 🔧 Ruby version
- Ruby: 3.2.2
- Rails: 7.x
- PostgreSQL: >= 13 (only required if we're going to use ActiveRecord features — the core functionality uses CSV)

## 🧩 System dependencies
- Ruby (rbenv or rvm are recommended but this code was made in asdf)
- Rails
- Node.js (>= 16)
- Yarn
- PostgreSQL (optional for ActiveRecord setup)
- Git

## ⚙️ Configuration
1. Clone the repository:
   ```bash
   git clone https://github.com/GlennIvander/transaction_management_system_rails.git
   cd transaction_management_system_rails.git
   ```
3. Install dependencies:
   ```bash
   # Desktop/transaction_management_system_rails
   bundle install
   yarn install
   ```
   
5. Prepare the CSV:
   ```bash
   # Desktop/transaction_management_system_rails
   db/seeds/transactions-sample.csv # You can edit it or replace it with your own data.
   ```

## 🗄️ (Optional) Database creation
  Although this app works with a CSV file, if you plan to use database-backed features like user authentication:
  ```bash
  # Desktop/transaction_management_system_rails
  rails db:create
  rails db:migrate
  ```

## 🔌 Database initialization
  ```bash
  # Desktop/transaction_management_system_rails
  bin/rails csv:quote_all_fields
   ```

## 🚀 Running the Application
   ```bash
  # Desktop/transaction_management_system_rails
  bin/dev # This will start both the Rails server and Tailwind CSS
   ```
  Then visit in your browser: http://localhost:3000

## Services & Tools Used
  - Hotwire (Turbo + Stimulus) for interactivity
  - Tailwind CSS for styling
  - Ransack (simulated) for local search filtering (CSV-based)
  - Custom Service Objects for CSV reading/writing

## Project Structure Notes
  - app/controllers/transactions_controller.rb — Main UI logic
  - app/controllers/api/v1/transactions_controller.rb — API for client-side use
  - app/services/csv_reader_service.rb — Handles CSV loading
  - app/services/csv_writer_service.rb — Handles writing/appending to CSV
  - app/helpers/transactions_helper.rb — View logic (formatting, styling)
  
