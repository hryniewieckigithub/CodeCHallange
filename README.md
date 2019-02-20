# CodeChallange
Repository created for code challange task

## Getting Started
These instructions will get you a copy of the project up and running on your local machine for testing purposes.
Repository contains two separate solutions:
1. SQL Solution - T-SQL objects
2. C# Solution - C# console application


### Prerequisites
1.SQL Solution - SQL Server 2017 or higher (Hovewer it should works on previous versions as well including 2008).
2.C# Solution - Visual studio community edition or professional. , .NET Framework 4.6.1

### Installing
1.SQL Solution: you need to deploy stored procedure and function from folder \SQLSolution\CodeChallange_SSDT\CodeChallange\CodeChallange\Stored Procedures\usp_GetBiggestTradeProfit.sql
and \SQLSolution\CodeChallange_SSDT\CodeChallange\CodeChallange\Functions\tvf_SplitString.sql
Deployment you can do through SSDT(Publish or Compare) project or manually.
2.C# solution: please build solution using visual studio Application

## Running the tests

1. SQL Solution -You can run test by exec stored procedure as below:
[dbo].[usp_GetBiggestTradeProfit] '18.93,20.25,17.05,16.59,21.09,16.22,21.43,27.13,18.62,21.31,23.96,25.52,19.64,23.49,15.28,22.77,23.1,26.58,27.03,23.75,27.39,15.93,17.83,18.82,21.56,25.33,25,19.33,22.08,24.03', ',', 0
2. C# solution you can either run application from Visual studio or after build , run exe file. Please be aware that application requires two input parameters: filePath and separator.
Example of execution from cmd: CodeChallange.exe "C:/tmp/ChallengeSampleDataSet2.txt" ,
