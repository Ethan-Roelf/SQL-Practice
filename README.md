# SQL
All SQL Practice I have done.

MOVIE_RENTAL_PROJECT TOPICS:
- Joins
- CTEs
- Sub queries
- Window Functions

Core_sql_mastery TOPICS:
- Aggregation
- Joins
- String functions
- Date functions
- Set functions
- Null handling

**Sakilla_BI_project TOPICS:**
1. Data Definition & Manipulation (DDL/DML)
CREATE TABLE: Defined schema structures with Primary Keys for optimized indexing.
INSERT INTO ... SELECT: Performed Bulk Data Transformation (ETL) from source to reporting tables.
UPDATE & DELETE: Managed data lifecycles and enforced data cleanup rules.

2. Advanced Joins & Set Theory
Multi-Table Joins: Connected Payment, Rental, Inventory, and Film tables while maintaining high performance.
Anti-Joins (EXCEPT): Isolated specific customer segments (e.g., customers who have never rented Horror films).
INTERSECT: Identified geographic overlaps between retail locations and customer bases without redundant joins.

3. Conditional Logic & Transformation
CASE Statements: Created dynamic categorical buckets for customer segmentation.
COALESCE / NULL Handling: Replaced missing return dates with sentinel values to prevent "broken" reporting visualizations.
Data Casting: Used CAST to ensure data-type compatibility across reporting layers.

4. Mathematical & String Functions
String Ops: Mastered CONCAT, UPPER, REPLACE, and LEFT for data cleansing.
Numeric Ops: Used ROUND and AVG to ensure financial reports meet professional precision standards.
Date Ops: Leveraged DATENAME, DATEPART, and YEAR for time-series extraction.

5. Analytical Window Functions
PARTITION BY: Segmented data by Store ID to perform local calculations within global datasets.
RANK(): Implemented competitive ranking logic that correctly handles ties in revenue.
Common Table Expressions (CTEs) / Subqueries: Nested window logic to filter for "Top N" business results.
 



**NB: Every question was drafted using AI, and given extra context so that the questions closely align with real business use-cases.**
