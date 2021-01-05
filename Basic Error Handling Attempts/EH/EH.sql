
CREATE TABLE Staging
(
CredentialNumber char(50),
LastName char(50),
FirstName char(50),
MiddleName char(50),
CredentialType char(50),
[Status] char(50),
BirthYear char(50),
CEDueDate char(50),
FirstIssueDate char(50),
LastIssueDate char(50),
ExpirationDate char(50),
ActionTaken char(50)
)

CREATE TABLE Dest
(
CredentialNumber char(50),
LastName char(50),
FirstName char(50),
MiddleName char(50),
CredentialType char(50),
[Status] char(50),
BirthYear char(50),
CEDueDate date,
FirstIssueDate date,
LastIssueDate date,
ExpirationDate date,
ActionTaken char(50)
)

CREATE TABLE LogBadCred
(
CredentialNumber char(50),
LastName char(50),
FirstName char(50),
MiddleName char(50),
CredentialType char(50),
[Status] char(50),
BirthYear char(50),
CEDueDate date,
FirstIssueDate date,
LastIssueDate date,
ExpirationDate date,
ActionTaken char(50)
)
--SELECT * FROM LogBadCred

--SELECT * FROM Dest
--TRUNCATE TABLE Dest
--DROP TABLE Dest

CREATE TABLE ERROR
(
CredentialNumber char(50),
LastName char(50),
FirstName char(50),
MiddleName char(50),
CredentialType char(50),
[Status] char(50),
BirthYear char(50),
CEDueDate date,
FirstIssueDate date,
LastIssueDate date,
ExpirationDate date,
ActionTaken char(50),
)
--DROP TABLE ERROR


CREATE TABLE DuplicateRows
(
CredentialNumber char(50),
LastName char(50),
FirstName char(50),
MiddleName char(50),
CredentialType char(50),
[Status] char(50),
BirthYear char(50),
CEDueDate date,
FirstIssueDate date,
LastIssueDate date,
ExpirationDate date,
ActionTaken char(50),
)

--SELECT * FROM DuplicateRows
CREATE TABLE  LookupStat
(
[Status] char(50)
)

INSERT INTO LookupStat VALUES ('SUPERSEDED')
INSERT INTO LookupStat VALUES ('EXPIRED')
INSERT INTO LookupStat VALUES ('CLOSED')
INSERT INTO LookupStat VALUES ('ACTIVE')

CREATE TABLE LogBadStat
(
CredentialNumber char(50),
LastName char(50),
FirstName char(50),
MiddleName char(50),
CredentialType char(50),
[Status] char(50),
BirthYear char(50),
CEDueDate date,
FirstIssueDate date,
LastIssueDate date,
ExpirationDate date,
ActionTaken char(50)
)

CREATE TABLE PrefixLookup
(
Prefix char(50)
)
INSERT INTO PrefixLookup VALUES ('HC')
INSERT INTO PrefixLookup VALUES ('D1')
INSERT INTO PrefixLookup VALUES ('NA')
INSERT INTO PrefixLookup VALUES ('RC')
INSERT INTO PrefixLookup VALUES ('NC')
INSERT INTO PrefixLookup VALUES ('LP')
INSERT INTO PrefixLookup VALUES ('CG')
INSERT INTO PrefixLookup VALUES ('RN')
SELECT * FROM PrefixLookup
TRUNCATE TABLE PrefixLookup

--SELECT * FROM Dest d
--JOIN PrefixLookup p
--WHERE CredentialNumber like concat(p.Prefix, '%')

--SELECT * FROM Dest
--WHERE (CredentialNumber like 'HC%' OR CredentialNumber like 'D1%' OR CredentialNumber like 'NA%' OR CredentialNumber like 'RC%' OR CredentialNumber like 'NC%' OR CredentialNumber like 'LP%' OR CredentialNumber like 'CG%' OR CredentialNumber like 'RN%' )


CREATE TABLE LogBadStat
(
CredentialNumber char(50),
LastName char(50),
FirstName char(50),
MiddleName char(50),
CredentialType char(50),
[Status] char(50),
BirthYear char(50),
CEDueDate date,
FirstIssueDate date,
LastIssueDate date,
ExpirationDate date,
ActionTaken char(50)
)


CREATE TABLE LogBadPrefix
(
CredentialNumber char(50),
LastName char(50),
FirstName char(50),
MiddleName char(50),
CredentialType char(50),
[Status] char(50),
BirthYear char(50),
CEDueDate date,
FirstIssueDate date,
LastIssueDate date,
ExpirationDate date,
ActionTaken char(50)
)


CREATE TABLE CredLookUp
(
CredentialType char(50)
)

INSERT INTO CredLookUp VALUES ('Health Care Assistant Certification')
INSERT INTO CredLookUp VALUES ('Dental Assistant Registration')
INSERT INTO CredLookUp VALUES ('Nursing Assistant Registration')
INSERT INTO CredLookUp VALUES ('Counselor Registration')
INSERT INTO CredLookUp VALUES ('Licensed Practical Nurse')
INSERT INTO CredLookUp VALUES ('Counselor Agency Affiliated Registration')
INSERT INTO CredLookUp VALUES ('Registered Nurse License')
INSERT INTO CredLookUp VALUES ('Nursing Assistant Certification')


--SELECT * FROM Staging
--SELECT * FROM Dest
--SELECT * FROM LogBadStat
--SELECT * FROM DuplicateRows
--SELECT * FROM LogBadCred
--SELECT * FROM LogBadPrefix


--TRUNCATE TABLE Staging
--TRUNCATE TABLE DuplicateRows
--TRUNCATE TABLE LogBadPrefix
--TRUNCATE TABLE LogBadCred
--TRUNCATE TABLE Dest
--TRUNCATE TABLE LogBadStat


CREATE TABLE XYZ
(
pre char(50)
)

SELECT * FROM XYZ
SELECT * FROM PrefixLookup