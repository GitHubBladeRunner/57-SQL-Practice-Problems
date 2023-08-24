SELECT TitleOfCourtesy, FirstName, LastName, CONVERT(DATE, BirthDate) AS'DateOnlyOfBirthDate' FROM Employees
ORDER BY DateOnlyOfBirthDate ASC
