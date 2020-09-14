CREATE TABLE [Master].[PaymentTypes] (
    [PaymentTypeID] INT           IDENTITY (1, 1) NOT NULL,
    [PaymentType]   NVARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED ([PaymentTypeID] ASC)
);

