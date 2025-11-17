INSERT INTO Publisher (Name, Address)
VALUES
('Eksmo', 'Moscow, Bolshaya Polyanka St. 28'),
('AST', 'Moscow, Akademika Koroleva St. 19'),
('Azbuka', 'Saint Petersburg, Liteyny Prospect 15');


INSERT INTO Author (FirstName, LastName, DateOfBirth)
VALUES
('Fyodor', 'Dostoevsky', '1821-11-11'),
('Leo', 'Tolstoy', '1828-09-09'),
('Alexander', 'Pushkin', '1799-06-06'),
('Mikhail', 'Bulgakov', '1891-05-15'),
('Nikolai', 'Gogol', '1809-03-31');


INSERT INTO Book (ISBN13, Title, Language, Price, IssueDate, AuthorID, PublisherID)
VALUES
('9785000000001', 'Crime and Punishment', 'Russian', 199.99, '1866-01-01', 1, 1),
('9785000000002', 'The Idiot', 'Russian', 189.99, '1869-01-01', 1, 1),
('9785000000003', 'War and Peace', 'Russian', 299.99, '1869-01-01', 2, 2),
('9785000000004', 'Anna Karenina', 'Russian', 249.99, '1878-01-01', 2, 2),
('9785000000005', 'Eugene Onegin', 'Russian', 149.99, '1833-01-01', 3, 3),
('9785000000006', 'The Master and Margarita', 'Russian', 219.99, '1966-01-01', 4, 3),
('9785000000007', 'Dead Souls', 'Russian', 159.99, '1842-01-01', 5, 2),
('9785000000008', 'The Nose', 'Russian', 99.99, '1836-01-01', 5, 1),
('9785000000009', 'The White Guard', 'Russian', 189.99, '1925-01-01', 4, 1),
('9785000000010', 'Boris Godunov', 'Russian', 129.99, '1825-01-01', 3, 3);


INSERT INTO Shop (ShopName, Address)
VALUES
('Moscow Central Bookstore', 'Moscow, Tverskaya St. 12'),
('Saint Petersburg Book Hall', 'Saint Petersburg, Nevsky Prospect 55'),
('Novosibirsk Book Center', 'Novosibirsk, Krasny Prospect 22');


INSERT INTO StockBalance (ShopID, ISBN13, BookAmount)
VALUES
(1, '9785000000001', 12),
(1, '9785000000003', 8),
(1, '9785000000006', 5),
(2, '9785000000002', 10),
(2, '9785000000004', 6),
(2, '9785000000007', 9),
(3, '9785000000005', 7),
(3, '9785000000008', 15),
(3, '9785000000009', 4),
(3, '9785000000010', 11);


INSERT INTO Member (NumberOfOrders)
VALUES
(3),
(1),
(5);


INSERT INTO Customer (PersonalNumber, FirstName, LastName, Address, MemberID)
VALUES
('900101123456', 'Ivan', 'Petrov', 'Moscow, Lenin St. 10', 1),
('920304654321', 'Anna', 'Sokolova', 'Saint Petersburg, Gorokhovaya St. 7', 2),
('880512987654', 'Dmitri', 'Ivanov', 'Kazan, Kremlin 3', NULL),
('870913112233', 'Olga', 'Morozova', 'Novosibirsk, Shevchenko St. 5', 3);


INSERT INTO CustomerOrder (OrderDate, PersonalNumber, ShopID, ISBN13, BookAmount, Price)
VALUES
(GETDATE(), '900101123456', 1, '9785000000001', 1, 199.99),
(GETDATE(), '920304654321', 2, '9785000000004', 2, 249.99),
(GETDATE(), '880512987654', 3, '9785000000005', 1, 149.99),
('2025-01-13', '870913112233', 3, '9785000000009', 1, 189.99),
('2025-01-14', '900101123456', 1, '9785000000006', 1, 219.99);

