SELECT * FROM msdb.dbo.sysjobs
SELECT * FROM msdb.dbo.sysjobschedules
SELECT * FROM msdb.dbo.sysschedules
SELECT * FROM msdb.dbo.sysjobsteps WHERE job_id = 'jobid'

EXEC msdb.dbo.sp_start_job 'jobname';

SELECT jb.job_id, jb.name AS jobname, js.schedule_id, s.name AS schedulename, s.freq_type, s.freq_interval FROM msdb.dbo.sysjobs jb
LEFT OUTER JOIN msdb.dbo.sysjobschedules js   ON jb.job_id = js.job_id
LEFT OUTER JOIN  msdb.dbo.sysschedules s ON s.schedule_id = js.schedule_id
WHERE js.schedule_id IS NOT NULL
ORDER BY js.schedule_id

-- JOB STEPS
SELECT jb.job_id, jb.name AS jobname, js.step_id, js.step_name,js.database_name, js.command FROM msdb.dbo.sysjobs jb
LEFT OUTER JOIN msdb.dbo.sysjobsteps js   ON jb.job_id = js.job_id
ORDER BY js.database_name, jb.name, js.step_id
