CREATE TABLE S_ProcessedDoc (ROWID INT IDENTITY(1,1) NOT NULL,
							 FolioUID float not null PRIMARY KEY,
							 DATE_P_POR smalldatetime Null,
							 Keeper varchar(50),
							 KeeperUID int default 0,
							 Collector varchar(50),
							 ColletorUID int default 0,
							 OrderBuidDate smalldatetime Default GETDATE(),
							 Status int  default 3)

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure S_InsProcessedDoc
@FolioUID float = 0.0,
@DATE_P_POR smalldatetime = Null,
@Keeper varchar(50) = Null,
@KeeperUID int = 0,
@Collector varchar(50) = Null,
@ColletorUID int = 0,
@OrderBuidDate smalldatetime,
@Status int
as
BEGIN TRANSACTION
	BEGIN TRY
		INSERT INTO DELIVERY..S_ProcessedDoc   (FolioUID,
												DATE_P_POR,
												Keeper,
												KeeperUID,
												Collector,
												ColletorUID,
												OrderBuidDate,
												Status)

		VALUES								   (@FolioUID,
												@DATE_P_POR,
												@Keeper,
												@KeeperUID,
												@Collector,
												@ColletorUID,
												@OrderBuidDate,
												@Status)
	END TRY
	BEGIN CATCH
		SELECT ERROR_LINE() as ErrL,
				ERROR_MESSAGE() as ErrM,
				ERROR_NUMBER() as ErrN

		if @@TRANCOUNT > 0
			ROLLBACK TRANSACTION;
	END CATCH
	
if @@TRANCOUNT > 0
	COMMIT TRANSACTION;
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure S_GetProcessedDocs
@BegD smalldatetime = Null,
@EndD smalldatetime = Null
AS

if IsNull(@BegD, 0) = 0 
	SET @BegD = GETDATE()
IF IsNull(@EndD, 0) = 0
	SET @EndD = GETDATE() + 1

	SELECT  FolioUID,
			DATE_P_POR,
			Keeper,
			KeeperUID,
			Collector,
			ColletorUID,
			OrderBuidDate,
			Status
	FROM DELIVERY..S_ProcessedDoc PD WITH (NOLOCK)
	WHERE PD.DATE_P_POR BETWEEN @BegD  and @EndD
	ORDER BY PD.FolioUID
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure S_DelProcessedDoc
@FolioUID float = 0
AS
	IF @FolioUID != 0
		BEGIN TRANSACTION
		  BEGIN TRY	
			DELETE FROM DELIVERY..S_ProcessedDoc
			WHERE FolioUID = @FolioUID
		  END TRY
		  BEGIN CATCH
			SELECT ERROR_LINE() as ErrL,
				   ERROR_MESSAGE() as ErrM,
				   ERROR_NUMBER() as ErrN

			if @@TRANCOUNT > 0
				ROLLBACK TRANSACTION;
		 END CATCH

		if @@TRANCOUNT > 0
			COMMIT TRANSACTION;
GO