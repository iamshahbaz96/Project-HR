import pandas as pd
from sqlalchemy import create_engine
import os

# ──── MySQL connection details ────────────────────────────
username = "shahbaz"
password = "9960180596"
host = "localhost"
port = 3306
database = "ipsos"

engine = create_engine(f"mysql+pymysql://{username}:{password}@{host}:{port}/{database}")

# Load tables
emp_table = pd.read_sql("SELECT * FROM emp", con=engine)
desg_table = pd.read_sql("SELECT * FROM desg", con=engine)
reporting_table = pd.read_sql("SELECT * FROM reporting", con=engine)
departments_table = pd.read_sql("SELECT * FROM departments", con=engine)

# Inputs
n_first_name = input('First name? ')
n_last_name = input('Last name? ')
n_designation = input('Designation? ')
n_department = input('Department? ')
n_reporting = input('Reports to someone? (Yes/No) ').lower()

# New Emp ID (Ensure it's a standard Python int, not a numpy int)
n_emp_id = int(emp_table['emp_id'].max() + 1)

# Designation Logic
if n_designation in desg_table['designation'].values:
    filtered_desg = desg_table[desg_table['designation'] == n_designation]
    # FIX: Use .iloc[0] to get the value, not the Series
    n_desg_id = int(filtered_desg['desg_id'].iloc[0])
    query1 = ''
else:
    n_desg_id = int(desg_table['desg_id'].max() + 1)
    query1 = f'INSERT INTO desg VALUES ({n_desg_id}, "{n_designation}");'

# Emp Query
query2 = f'INSERT INTO emp VALUES ({n_emp_id}, "{n_first_name}", "{n_last_name}", {n_desg_id});'

# Reporting Logic
if n_reporting == "yes":
    manager_name = input('Who is the reporting manager? ')
    emp_table['Full Name'] = emp_table['first_name'] + ' ' + emp_table['last_name']
    filtered_reporting = emp_table[emp_table['Full Name'] == manager_name]
    
    if not filtered_reporting.empty:
        # FIX: Use .iloc[0] and handle data type
        n_reports_to = int(filtered_reporting['emp_id'].iloc[0])
    else:
        print("Manager not found! Setting to NULL.")
        n_reports_to = "NULL"
else:
    n_reports_to = "NULL"

query3 = f'INSERT INTO reporting VALUES ({n_emp_id}, {n_emp_id}, {n_reports_to});'

# Department Logic
if n_department in departments_table['department'].values:
    filtered_department = departments_table[departments_table['department'] == n_department]
    n_dep_id = int(filtered_department['dep_id'].iloc[0]) # FIX: .iloc[0]
    query4 = ''
else:
    n_dep_id = int(departments_table['dep_id'].max() + 1)
    query4 = f'INSERT INTO departments VALUES ({n_dep_id}, "{n_department}");'

n_salary = int(input('Salary? '))

query5 = f'INSERT INTO salary VALUES ({n_emp_id}, {n_emp_id}, {n_salary});'
query6 = f'INSERT INTO emp_department VALUES ({n_emp_id}, {n_emp_id}, {n_dep_id});'

# Create Folder and Save File
folder = "sql"
if not os.path.exists(folder): # FIX: Ensure folder exists
    os.makedirs(folder)

all_queries = [query1, query2, query3, query4, query5, query6]
filename = os.path.join(folder, f"{n_first_name}_{n_last_name}_{n_emp_id}.sql")

with open(filename, "w") as f:
    for q in all_queries:
        if q: # Only write if the query isn't empty
            f.write(q + "\n\n")

print(f"\n--- Success! ---")
print(f"File saved: {filename}")