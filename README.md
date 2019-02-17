# CodeChallange
Repository created for code challange task

##Getting Started
These instructions will get you a copy of the project up and running on your local machine for testing purposes.
Repository contains two solutions:
1. SQL Solution
2. C# Solution

### Prerequisites
1.SQL Solution - SQL Server 2017 or higher (Hovewer it should works on previous versions as well including 2008).
2.C# Solution - Visual studio community edition or professional. , .NET Framework 4.7.2

###Installing
1.SQL Solution: you need to deploy stored procedure and function from folder \SQLSolution\CodeChallange_SSDT\CodeChallange\CodeChallange\Stored Procedures
and \SQLSolution\CodeChallange_SSDT\CodeChallange\CodeChallange\Functions
Deployment you can do through SSDT(Publish or Compare) project or manually.

## Running the tests

You can run test by exec stored procedure as below:
[dbo].[usp_GetBiggestTradeProfit] '18.93,20.25,17.05,16.59,21.09,16.22,21.43,27.13,18.62,21.31,23.96,25.52,19.64,23.49,15.28,22.77,23.1,26.58,27.03,23.75,27.39,15.93,17.83,18.82,21.56,25.33,25,19.33,22.08,24.03', ',', 0