# MSSQL DB

## Last backup status of a database in SQL Server

	SELECT 
		db.name AS DatabaseName,
		MAX(b.backup_finish_date) AS LastBackupTime,
		b.type AS BackupType
	FROM 
		sys.databases db
	LEFT JOIN 
		msdb.dbo.backupset b ON db.name = b.database_name
	WHERE 
		db.state_desc = 'ONLINE' -- Only check online databases
	GROUP BY 
		db.name
	ORDER BY 
		db.name;

## Check the last failed backup status for each database

	SELECT 
		db.name AS DatabaseName,
		MAX(b.backup_finish_date) AS LastFailedBackupTime,
		b.type AS BackupType,
		b.backup_set_id AS BackupSetID
	FROM 
		sys.databases db
	LEFT JOIN 
		msdb.dbo.backupset b ON db.name = b.database_name
	LEFT JOIN 
		msdb.dbo.backupfile bf ON b.backup_set_id = bf.backup_set_id
	WHERE 
		db.state_desc = 'ONLINE' -- Only consider online databases
		AND b.backup_finish_date IS NOT NULL -- Only include backups with a finish date
		AND b.backup_finish_date > b.backup_start_date -- Check if the backup has finished
		AND b.type IN ('D', 'I', 'L') -- Filter for valid backup types (Full, Differential, Log)
	GROUP BY 
		db.name
	ORDER BY 
		db.name;


## check which processes are consuming the most CPU and memory in SQL Server


	SELECT 
		r.session_id,
		r.status,
		r.cpu_time AS CPU_Time_ms,
		r.memory_usage * 8 / 1024 AS Memory_Usage_MB,
		s.login_name,
		s.host_name,
		t.text AS SQL_Query,
		qp.query_plan AS Execution_Plan,
		db.name AS Database_Name
	FROM 
		sys.dm_exec_requests r
	JOIN 
		sys.dm_exec_sessions s ON r.session_id = s.session_id
	OUTER APPLY 
		sys.dm_exec_sql_text(r.sql_handle) t
	OUTER APPLY 
		sys.dm_exec_query_plan(r.plan_handle) qp
	LEFT JOIN 
		sys.databases db ON r.database_id = db.database_id
	WHERE 
		r.cpu_time > 0 -- Show processes consuming CPU time
	ORDER BY 
		r.cpu_time DESC;  -- Order by CPU consumption in descending order

