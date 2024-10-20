# iwb102-team-novices

# Project Name

This project consists of both a frontend (Flutter) and backend (Ballerina) application. The frontend communicates with the backend API, and the backend connects to a database. This guide will walk you through setting up both the frontend and backend locally.

## Prerequisites

Make sure you have the following installed before you proceed:

### Frontend Requirements (Flutter)

- [Flutter SDK](https://docs.flutter.dev/get-started/install)
- Android Studio / VS Code (for emulators and building the app)
- A physical or virtual device for testing

### Backend Requirements (Ballerina)

- [Ballerina](https://ballerina.io/downloads/)
- MySQL or any other compatible database system

---

## Project Setup Instructions

### 1. Clone the Repository

First, clone the repository to your local machine:

```bash
git clone https://github.com/your-username/your-repo.git
cd your-repo
```

## Frontend Setup (Flutter)
### 2. Navigate to the frontend directory
```bash
cd frontend
```

### 3. Install dependencies
Install the required Flutter packages:

```bash
flutter pub get
```

### 4. Setup Environment Variables
Create a .env file in the root of the frontend directory and add the base URL for your backend API:

```bash
BASE_URL=https://your-backend-api.com
```
Ensure the BASE_URL points to the correct backend API endpoint (local or production).

### 5. Run the Flutter App
For Android, make sure you have a simulator or physical device connected.

```bash
flutter run
```

## Backend Setup (Ballerina)
### 6. Navigate to the backend directory
```bash
cd ../backend
```
### 7. Configure the Database
The backend service connects to a database, and the configuration details are stored in a config.toml file.

Create a config.toml file in the root of the backend directory and add your database configuration:

```toml
[database]
host = "localhost"
port = 3306
username = "your-username"
password = "your-password"
database = "your-database-name"
```
Make sure the database is up and running, and the details in the config.toml file are correct.

**You need to have a database in your MySQL server that contains the name specified in the `config.toml` file.** You can create this database via a database client or using the MySQL command line:

**Using MySQL command line:**
```sql
CREATE DATABASE your-database-name;
```

### 8. Build and Run the Backend Service
To build and run the Ballerina service, execute the following command in the backend directory:

```bash
bal run
```
This will start the backend API on the configured port.

## Running the Full Stack Locally
Start the backend by navigating to the backend directory and running:

```bash
bal run
```
Start the frontend by navigating to the frontend directory and running:

```bash
flutter run
```

At this point, the Flutter app should communicate with the Ballerina backend through the base URL defined in the .env file.