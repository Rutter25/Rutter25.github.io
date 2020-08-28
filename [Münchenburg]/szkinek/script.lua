function replaceskin()
	txd = engineLoadTXD ( "lapd1.txd" )
	engineImportTXD ( txd, 280)
	dff = engineLoadDFF ( "lapd1.dff", 280)
	engineReplaceModel ( dff, 280)

	txd = engineLoadTXD ( "dsher.txd" )
	engineImportTXD ( txd, 288)
	dff = engineLoadDFF ( "dsher.dff", 288)
	engineReplaceModel ( dff, 288)


	txd = engineLoadTXD ( "csher.txd" )
	engineImportTXD ( txd, 283)
	dff = engineLoadDFF ( "csher.dff", 283)
	engineReplaceModel ( dff, 283)

	txd = engineLoadTXD ( "sffd1.txd" )
	engineImportTXD ( txd, 279)
	dff = engineLoadDFF ( "sffd1.dff", 279)
	engineReplaceModel ( dff, 279)

	txd = engineLoadTXD ( "lvfd1.txd" )
	engineImportTXD ( txd, 278)
	dff = engineLoadDFF ( "lvfd1.dff", 278)
	engineReplaceModel ( dff, 278)


	txd = engineLoadTXD ( "lapdm1.txd" )
	engineImportTXD ( txd, 284)
	dff = engineLoadDFF ( "lapdm1.dff", 284)
	engineReplaceModel ( dff, 284)

	txd = engineLoadTXD ( "wfyclot.txd" )
	engineImportTXD ( txd, 282)
	dff = engineLoadDFF ( "wfyclot.dff", 282)
	engineReplaceModel ( dff, 282)

	txd = engineLoadTXD ( "wmyclot.txd" )
	engineImportTXD ( txd, 217)
	dff = engineLoadDFF ( "wmyclot.dff", 217)
	engineReplaceModel ( dff, 217)

	txd = engineLoadTXD ( "lafd1.txd" )
	engineImportTXD ( txd, 277)
	dff = engineLoadDFF ( "lafd1.dff", 277)
	engineReplaceModel ( dff, 277)

	txd = engineLoadTXD ( "laemt1.txd" )
	engineImportTXD ( txd, 274)
	dff = engineLoadDFF ( "laemt1.dff", 274)
	engineReplaceModel ( dff, 274)

	txd = engineLoadTXD ( "lvemt1.txd" )
	engineImportTXD ( txd, 275)
	dff = engineLoadDFF ( "lvemt1.dff", 275)
	engineReplaceModel ( dff, 275)

	txd = engineLoadTXD ( "sfemt1.txd" )
	engineImportTXD ( txd, 276)
	dff = engineLoadDFF ( "sfemt1.dff", 276)
	engineReplaceModel ( dff, 276)

 	txd = engineLoadTXD ( "sfpd1.txd" )
	engineImportTXD ( txd, 281)
	dff = engineLoadDFF ( "sfpd1.dff", 281)
	engineReplaceModel ( dff, 281)

	txd = engineLoadTXD ( "swat.txd" )
	engineImportTXD ( txd, 285)
	dff = engineLoadDFF ( "swat.dff", 285)
	engineReplaceModel ( dff, 285)


end
addEventHandler ( "onClientResourceStart", getResourceRootElement(getThisResource()), replaceskin)