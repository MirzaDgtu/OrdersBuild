 CREATE TABLE S_KeeperTeam (KeeperUid int not Null default 1,
							KeeperName varchar(50) Not Null,
							CollectorUId int Not Null Default 1,
							CollectorName varchar(50) Not Null)

create procedure S_InsKeeperTeam
@KeeperUId int = 0,
@KeeperName varchar(50) = Null,
@CollectorUID int = 0,
@CollectorName varchar(50) = Null
as
	BEGIN TRANSACTION
		BEGIN TRY
			insert into S_KeeperTeam (KeeperUid,
									  KeeperName,
									  CollectorUId,
									  CollectorName)
			values (@KeeperUId, @KeeperName, @CollectorUID, @CollectorName)
		END TRY
		BEGIN CATCH
			SELECT ERROR_NUMBER() as ErrN,
				   ERROR_MESSAGE() as ErrM,
				   ERROR_LINE() as ErrL

			if @@TRANCOUNT > 0
				ROLLBACk TRANSACTION;

		END CATCH


GO


create procedure S_DelKeeperTeam
@KeeperUID int = 0
as 
  if @KeeperUID <> 0
	BEGIN TRANSACTION
		BEGIN TRY
			DELETE FROM S_KeeperTeam
			WHERE KeeperUID = @KeeperUID
		END TRY
		BEGIN CATCH
			SELECT ERROR_LINE() as ErrL,
				   ERROR_NUMBER() as ErrN,
				   ERROR_MESSAGE() as ErrM
				   
			if @@TRANCOUNT > 0
				ROLLBACK TRANSACTION;
		END CATCH

	if @@TRANCOUNT > 0
		COMMIT TRANSACTION;		

GO

create procedure S_GetKeeperTeam
as 
	SELECT KT.KeeperUid,
		   KT.KeeperName,
		   KT.CollectorUId,
		   KT.CollectorName
	FROM S_KeeperTeam KT  WITH (NOLOCK)
Go


