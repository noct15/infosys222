# INFOSYS 222 Week 05: Normalisation

## Quiz 01

### 1NF

- Invoice(InvNo [PK], PONo, InvDate, DueDate, CustName, CustEmail, CustPhone, CustAdd, ItemNo [PK], ItemName, ItemDesc, UnitCost, Quantity, PaidToDate, Term)

Note: Introduce ItemNo as an attribute of Invoice

### 2NF

- Invoice(InvNo [PK], PONo, InvDate, DueDate, CustName, CustEmail, CustPhone, CustAdd, PaidToDate, Term)

- Item(ItemNo [PK], ItemName, ItemDesc, UnitCost)

- InvoiceLine(InvNo [PK, FK], ItemNo [PK, FK], Quantity)

### 3NF

- Customer(CustName [PK], CustEmail, CustPhone, CustAdd)

- Invoice(InvNo [PK], PONo, InvDate, DueDate, CustName [FK], PaidToDate, Term)

- Item(ItemNo [PK], ItemName, ItemDesc, UnitCost)

- InvoiceLine(InvNo [PK, FK], ItemNo [PK, FK], Quantity)

## Quiz 02

### 1NF

- Ticket(TicketNo [PK], DrawNo, DrawDate, WWNo, SoldAt, LineID [PK], N1, N2, N3, N4, N5, N6, PBNo)

### 2NF

- Ticket(TicketNo [PK], DrawNo, DrawDate, WWNo, SoldAt)

- Line(TicketNo [PK, FK], LineID [PK], N1, N2, N3, N4, N5, N6, PBNo)

### 3NF

- Draw(DrawNo [PK], DrawDate)

- Ticket(TicketNo [PK], DrawNo [FK], WWNo, SoldAt)

- Line(TicketNo [PK, FK], LineID [PK], N1, N2, N3, N4, N5, N6, PBNo)

## Quiz 03

### 1NF

- Title(TitleName [PK], RentType [PK], RentValue, MortValue, HouseCost, HotelCost, TitleGroup)

### 2NF

- Title(TitleName [PK], MortValue, HouseCost, HotelCost, TitleGroup)

- Rent(TitleName [PK, FK], RentType [PK], RentValue)

### 3NF

- TitleGroup(TitleGroup [PK], HouseCost, HotelCost)

- Title(TitleName [PK], MortValue, TitleGroup [FK])

- Rent(TitleName [PK, FK], RentType [PK], RentValue)
