-- Lightweight update: Add ReferenceNumber to Donations
IF NOT EXISTS (
    SELECT * FROM sys.columns 
    WHERE object_id = OBJECT_ID(N'[dbo].[Donations]') 
    AND name = 'ReferenceNumber'
)
BEGIN
    ALTER TABLE [dbo].[Donations] ADD [ReferenceNumber] NVARCHAR(50) NULL;
    PRINT 'ReferenceNumber column added successfully.';
END
ELSE
BEGIN
    PRINT 'ReferenceNumber column already exists.';
END
GO