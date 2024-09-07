import pandas as pd
import numpy as np

df  = pd.read_csv(r"C:\Users\MY PC\Desktop\360 PROJECT\pallet_Masked_fulldata.csv")
print(df)

# sql connectivity

import mysql.connector

# Replace these values with your MySQL server information
host = "localhost"
user = "root"
password = "black"
database = "scm"

# Establish a connection
connection = mysql.connector.connect(
    host=host,
    user=user,
    password=password,
    database=database
)

# Create a cursor object to interact with the database
cursor = connection.cursor()

# Execute a simple query
cursor.execute("SELECT * FROM pallet_masked_fulldata")

# Fetch and print the results
results = cursor.fetchall()
print(results)

for row in results:
    print(row)

# Close the cursor and connection
cursor.close()
connection.close()


# first movement business decision
df.info()
df.describe()

# count the values

df['QTY'].count()

# min 

df['QTY'].min()
df['WHName'].min()

# max

df['QTY'].max()
df['WHName'].max()
df['CustName'].max()

# mean

df['QTY'].mean()
df['WHName'].mean()
df['CustName'].mean()

# median

df['QTY'].median()
df['WHName'].median()
df['CustName'].median()


# mode

df['QTY'].mode()
df['WHName'].mode()
df['CustName'].mode()


# second movement business decision


# variance

df['QTY'].var()
df['WHName'].var()
df['CustName'].var()

# standard deviation

df['QTY'].std()
df['WHName'].std()
df['CustName'].std()


# range


rangeQTY= df['QTY'].max() - df['QTY'].min()
print(rangeQTY)

rangewhname= df['WHName'].max() - df['WHName'].min()
print(rangewhname)

rangecustname= df['CustName'].max() - df['CustName'].min()
print(rangecustname)


# third movement business decision


df['QTY'].skew()
df['WHName'].skew()
df['CustName'].skew()


# fourth movement business decision


df['QTY'].kurt()
df['WHName'].kurt()
df['CustName'].kurt()


# eda

# missing values

missing_values = df.isnull().sum()
print(missing_values)

# null values 

null_values = df.isnull()
print(null_values)


#outliers

Q1 = df.quantile(0.25)
Q3 = df.quantile(0.75)
IQR = Q3 - Q1

# Define the upper and lower limits for outliers
upper_limit = Q3 + 1.5 * IQR
lower_limit = Q1 - 1.5 * IQR

# Find the outliers
outliers = df[(df < lower_limit) | (df > upper_limit)]
print(outliers);


# identify duplicates

duplicates = df.duplicated()

# remove and print duplicates

df_no_duplicates = df.drop_duplicates() 
print(df_no_duplicates)

df1=df_no_duplicates
print(df1)

# eda after preprocessing

# first movement business decision
df.info()
df.describe()

# count the values

df['QTY'].count()

# min 

df['QTY'].min()
df['WHName'].min()

# max

df['QTY'].max()
df['WHName'].max()
df['CustName'].max()

# mean

df['QTY'].mean()
df['WHName'].mean()
df['CustName'].mean()

# median

df['QTY'].median()
df['WHName'].median()
df['CustName'].median()


# mode

df['QTY'].mode()
df['WHName'].mode()
df['CustName'].mode()


# second movement business decision


# variance

df['QTY'].var()
df['WHName'].var()
df['CustName'].var()

# standard deviation

df['QTY'].std()
df['WHName'].std()
df['CustName'].std()


# range


rangeQTY= df['QTY'].max() - df['QTY'].min()
print(rangeQTY)

rangewhname= df['WHName'].max() - df['WHName'].min()
print(rangewhname)

rangecustname= df['CustName'].max() - df['CustName'].min()
print(rangecustname)


# third movement business decision


df['QTY'].skew()
df['WHName'].skew()
df['CustName'].skew()


# fourth movement business decision


df['QTY'].kurt()
df['WHName'].kurt()
df['CustName'].kurt()


#data vizvalization

import matplotlib.pyplot as plt

# box chart

plt.figure(figsize=(10, 5))
plt.boxplot(df1['QTY'])
plt.show()

plt.figure(figsize=(10, 5))
plt.boxplot(df1['WHName'])
plt.show()

plt.figure(figsize=(10, 5))
plt.boxplot(df1['CustName'])
plt.show()

# bar chart

import plotly.express as px
import seaborn as sns


sns.barplot(x = "Region", y = "QTY", data = df1)

sns.barplot(x = "Transaction Type", y = "QTY", data = df1)

sns.barplot(x = "State", y = "CustName", data = df1)

sns.barplot(x = "WHName", y = "CustName", data = df1)


# line chart

sns.lineplot(x = "Region", y = "QTY", data = df1)

sns.lineplot(x = "Region", y = "Transaction Type", data = df1)

sns.lineplot(x = "Transaction Type", y = "QTY", data = df1)

sns.lineplot(x = "State", y = "WHName", data = df1)

sns.lineplot(x = "Region", y = "WHName", data = df1)

sns.lineplot(x = "WHName", y = "Transaction Type", data = df1)


# histogram

sns.histplot(x = "QTY", data = df1)

sns.histplot(x = "WHName", data = df1)

sns.histplot(x = "Region", data = df1)

sns.histplot(x = "Transaction Type", data = df1)

sns.histplot(x = "CustName",data=df1)



# scatter plot

sns.scatterplot(df1,x = 'QTY', y = 'Region',
                hue = "QTY")

sns.scatterplot(df1,x = 'QTY', y = 'State',
               hue = "QTY")

sns.scatterplot(df1,x = 'WHName', y = 'QTY',
               hue = "QTY")

sns.scatterplot(df1,x = 'Region', y = 'WHName',
               color = "green")

sns.scatterplot(df1,x = 'CustName', y = 'QTY',
               hue = "CustName")


# PAIRPLOT
sns.pairplot(df1)
plt.suptitle('Pairplot')
plt.show()


# auto eda

#pip install dtale


import dtale
import pandas as pd

# Assuming df is your DataFrame
dtale.show(df)

 # http://DESKTOP-DHR6L4N:40000/dtale/main/1


# autoviz


pip install autoviz

from autoviz.AutoViz_Class import AutoViz_Class

# Load your dataset (replace 'your_dataset.csv' with your actual data)
file_path = r"C:\Users\MY PC\Desktop\PROJECT\pallet_Masked_fulldata.csv"

AV = AutoViz_Class()
df = AV.AutoViz(
    filename=file_path,
    sep=',',
    depVar='',
    dfte=None,
    header=0,
    verbose=2,
    lowess=False,
    chart_format='svg',
    max_rows_analyzed=150000,
    max_cols_analyzed=30
)


# sweetviz

pip install sweetviz

import sweetviz as sv

# Load your dataset (replace 'your_dataset.csv' with your actual data)
file_path = r"C:\Users\MY PC\Desktop\PROJECT\pallet_Masked_fulldata.csv"
df2 = pd.read_csv(file_path)

report = sv.analyze(df2)

# Show the report in a Jupyter Notebook
report.show_html('report.html')


# pandas-profiling

pip install pandas_profiling

import pandas as pd
from pandas_profiling import ProfileReport

pip install -U ydata-profiling

import pandas_profiling
import pandas as pd

# Load your DataFrame (replace 'your_dataframe.csv' with your actual data)
file_path =  r"C:\Users\MY PC\Desktop\PROJECT\pallet_Masked_fulldata.csv"
df3 = pd.read_csv(file_path)

profile = pandas_profiling.ProfileReport(df3)

# Save the report to an HTML file
profile.to_file("profile_report.html")


#export to excel
excel_file_path = 'output_data.xlsx'
df1.to_excel('output.xlsx', index=False)
print(f'Data exported to {excel_file_path}')


