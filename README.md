# git_fx-batch

簡易順序
1.{transfer} 舊核下檔->新核,優先轉移會計  1-1-job(transfer)
2.{day-end} 關外匯(日終)，換日作業	2-1-job(day-end)
3.{bakcup} 換日前批次前DB備份	3-1-job(backup)
4.{maintain}	先取叫sechedul，因為這邊有點奇怪	4-1-job(日會計) , 4-2-job(日共用) , 4-3-job(日maintain) ,  4-4-job(週maintain)	,	4-5-job(月maintain)	,	4-6-job(年maintain)
這邊可以再依照excel裡面的去切分job來確定命名，例如把類似的統一在一個group，優先的在一個group之類

5.{upload} 上下傳類 -> 要確認到底有那些上下傳，目前確認到應該有的
	1.21:00舊核傳至新核(1-1-job到4-1-job這段、1-1-job到4-2-job這段)
	2.日終換日備份完後(3-1-job到5-1-job這段將1-1-job的output傳回、3-1-job到5-1-job這段將1-2-job的output傳回)
	3.傳回日檔案傳回舊核後，5-1-job這段將1-1-job的output傳回並再用5-1-job(不確定會不會是5-2-job另外指定)

		5-1-job(intergrate)	,	5-2-job(傳到其他地方,待確認是否有這個)
6.{report} 報表作業類	6-1-job(日報表)	,	6-2-job(週報表)	,	6-3-job(月報表)	,6-4-job(年報表)
7.{housekeeping} 整檔作業類		7-1-job(housekeeping)
