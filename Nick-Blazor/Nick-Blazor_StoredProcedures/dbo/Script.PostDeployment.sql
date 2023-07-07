If not exists(SELECT 1 FROM dbo.[Employees])
BEGIN
INSERT INTO dbo.[Employees](FirstName, LastName, EmailAddress, Contact)
VALUES('Nick','Williams','nickW@gmail.com','0766180918'),
('Puseletso','Mahlangu','Puse@gmail.com','0624457716'),
('Thabang','Ngobeni','tNgobeni@gmail.com','0657829088');
END